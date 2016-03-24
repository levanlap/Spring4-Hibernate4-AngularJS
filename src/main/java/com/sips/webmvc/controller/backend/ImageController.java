package com.sips.webmvc.controller.backend;

import java.io.IOException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.sips.webmvc.dto.image.ImageDTO;
import com.sips.webmvc.service.image.ImageService;

@Controller
public class ImageController extends BaseController{
	
	private static Logger LOG = Logger.getLogger(ImageController.class);
	
	@Autowired
	private ImageService imageService;
	
	@RequestMapping(value = "/admin/fileupload", method = RequestMethod.GET)
	public ModelAndView images() {
		ModelAndView model = new ModelAndView("bac_image");
		model.addObject("imagesMenuActive", "active");
		return model;
	}

	@RequestMapping(value = "/admin/fileupload/getTreeFolders", method = RequestMethod.GET)
	public @ResponseBody ImageDTO getTreeFolders() {

		ImageDTO image = imageService.getRootAndTreeChildrenFolder();
		
		return image;

	}
	
	@RequestMapping(value = "/admin/fileupload/getChildrenByParentId/{parentId}", method = RequestMethod.GET)
	public @ResponseBody ImageDTO getChildrenByParentId(@PathVariable("parentId") int parentId) {

		return imageService.getChildrenByParentId(parentId);

	}

	@RequestMapping(value = "/admin/fileupload/createNewFolder", method = RequestMethod.POST)
	public @ResponseBody ImageDTO createNewFolder(@RequestBody ImageDTO image) {

		try {

			image = imageService.createNewFileSystem(image, null);

			LOG.info("Create New Folder: " + image.getUrl());
			
			return image;

		} catch (IOException e) {

			LOG.error("Error Create File System");

			LOG.error(e);

			e.printStackTrace();
			
			return null;
			
		}

	}

	@RequestMapping(value = "/admin/fileupload/deleteFileSystem", method = RequestMethod.POST)
	public @ResponseBody ImageDTO deleteFileSystem(@RequestBody ImageDTO image) {
		try {

			boolean canDelete = imageService.canDeleteImage(image.getId());
			if(canDelete){
				imageService.deleteFileSystem(image);
				LOG.info("Delete File System: " + image.getUrl());
				return image;
			}else{
				LOG.info("Can not delete File System: " + image.getUrl());
				return null;
			}

		} catch (IOException e) {

			LOG.error("Error Delete Folder");

			LOG.error(e);
			return null;

		}

	}

	@RequestMapping(value = "/admin/fileupload/uploadfiles", method = RequestMethod.POST)
	public @ResponseBody ImageDTO uploadFiles(
			@RequestParam("parentId") int parentId,
			@RequestParam("file") MultipartFile file) {

		try {

			// Parent
			ImageDTO parent = new ImageDTO();
			parent.setId(parentId);
			
			ImageDTO image = new ImageDTO();
			image.setName(file.getOriginalFilename());
			image.setParent(parent);
			image.setFolder(false);
			
			image = imageService.createNewFileSystem(image, file);
			
			return image;
		} catch (Exception e) {
			LOG.equals(e);
		}

		return null;
	}
	
}
