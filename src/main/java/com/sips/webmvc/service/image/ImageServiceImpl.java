package com.sips.webmvc.service.image;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FilenameUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.sips.webmvc.dao.catalog.CatalogDao;
import com.sips.webmvc.dao.image.ImageDao;
import com.sips.webmvc.dto.image.ImageDTO;
import com.sips.webmvc.model.image.Image;
import com.sips.webmvc.service.catalog.CatalogService;
import com.sips.webmvc.util.FileSystemUtil;
import com.sips.webmvc.util.StringUtil;

@Service
@Transactional
public class ImageServiceImpl implements ImageService {
	
	private static Logger LOG = Logger.getLogger(ImageServiceImpl.class);
	
	@Autowired
    private Environment environment;

	@Autowired
	private ImageDao imageDao;
	
	@Autowired
	private CatalogDao catalogDao;
	
	@Autowired
	private CatalogService catalogService;
	
	@Override
	public Image toEntity(ImageDTO dto) {
		Image entity = new Image();
		entity.setId(dto.getId());
		entity.setName(dto.getName());
		entity.setUrl(dto.getUrl());
		entity.setFolder(dto.isFolder());
		entity.setFileType(dto.getFileType());
		entity.setCreated(dto.getCreated());
		if(dto.getParent() != null && dto.getParent().getId() != null){
			entity.setParent(imageDao.findById(dto.getParent().getId()));
		}
		return entity;
	}
	
	@Override
	public ImageDTO toDTO(Image entity) {
		if(entity == null){
			return null;
		}
		ImageDTO dto = new ImageDTO();
		dto.setId(entity.getId());
		dto.setName(entity.getName());
		dto.setOriginName(entity.getName());
		dto.setUrl(entity.getUrl());
		dto.setFolder(entity.isFolder());
		dto.setFileType(entity.getFileType());
		dto.setCreated(entity.getCreated());
		if(entity.getParent() != null){
			dto.setParentId(entity.getParent().getId());
		}
		return dto;
	}
	
	@Override
	public ImageDTO toDTO(Image entity, boolean copyParent, boolean copyChildren, boolean copyChildrenFolder, boolean copyChildrenFile) {
		if(entity == null){
			return null;
		}
		
		ImageDTO dto = toDTO(entity);
		if(copyParent){
			
			if(entity.getParent() != null){
				dto.setParentId(entity.getParent().getId());
			}
			
			// DON'T PASTE true for copyParent here. It will run with loop
			dto.setParent(toDTO(entity.getParent()));
		}
		if(copyChildren){
			dto.setChildren(toDTOs(entity.getChildren(), true, true, copyChildrenFolder, copyChildrenFile));
		}
		return dto;
	}
	
	@Override
	public ImageDTO saveImage(ImageDTO image) {
		return toDTO( imageDao.saveImage(toEntity(image)) );
	}
	
	@Override
	public ImageDTO updateName(int id, String name) {
		return toDTO( imageDao.updateName(id, name) );
	}

	@Override
	public ImageDTO deleteById(int id) {
		return toDTO( imageDao.deleteById(id) );
	}

	@Override
	@Transactional(readOnly = true)
	public List<ImageDTO> toDTOs(List<Image> entities) {
		List<ImageDTO> dtos = new ArrayList<ImageDTO>();
		if( entities != null && entities.size() > 0){
			for( Image e : entities ){
				ImageDTO dto = toDTO(e);
				dtos.add(dto);
			}
		}
		return dtos;
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<ImageDTO> toDTOs(List<Image> entities, boolean copyParent, boolean copyChildren, boolean copyChildrenFolder, boolean copyChildrenFile) {
		List<ImageDTO> dtos = new ArrayList<ImageDTO>();
		if( entities != null && entities.size() > 0){
			for( Image e : entities ){
				if( (copyChildrenFolder && copyChildrenFile) 
						&& (!copyChildrenFolder && !copyChildrenFile)){
					ImageDTO dto = toDTO(e, copyParent, copyChildren, copyChildrenFolder, copyChildrenFile);
					dtos.add(dto);
				}
				
				else if( copyChildrenFolder && e.isFolder() ){
					ImageDTO dto = toDTO(e, copyParent, copyChildren, copyChildrenFolder, copyChildrenFile);
					dtos.add(dto);
				}
				
				else if( copyChildrenFile && !e.isFolder() ){
					ImageDTO dto = toDTO(e, copyParent, copyChildren, copyChildrenFolder, copyChildrenFile);
					dtos.add(dto);
				}
			}
		}
		return dtos;
	}

	@Override
	@Transactional(readOnly = true)
	public List<ImageDTO> getByAll() {
		return toDTOs(imageDao.findByAll());
	}

	@Override
	@Transactional(readOnly = true)
	public ImageDTO getById(int id) {
		return toDTO(imageDao.findById(id));
	}
	
	@Override
	@Transactional(readOnly = true)
	public ImageDTO getRootAndTreeChildrenFolder() {
		Image image = imageDao.findRoot();
		return toDTO(image, false, true, true, false);
	}

	@Override
	@Transactional(readOnly = true)
	public List<ImageDTO> getByIds(String ids) {
		return toDTOs(imageDao.findByIds(ids));
	}

	@Override
	@Transactional(readOnly = true)
	public boolean canDeleteImage(int imageId) {
		return imageDao.canDeleteImage(imageId);
	}
	

	@Override
	public ImageDTO createNewFileSystem(ImageDTO image, MultipartFile file) throws IOException {
		
		LOG.info("======================================createNewFileSystem");
		if(image.isFolder()){
			image = createNewFolder(image);
		}else{
			image = createNewFile(image, file);
		}
		LOG.info("Finish : " + image);
		return image;
	}
	
	private ImageDTO createNewFolder(ImageDTO image) throws IOException {
		
		LOG.info("======================================createNewFolder");
		
		// get parent
		Image parent = imageDao.findById(image.getParent().getId());
		
		// url
		String newUrl = "";
		if(parent.getUrl().equals("/")){
			newUrl = "/" + StringUtil.convertToAscii(image.getName());
		}else{
			newUrl = parent.getUrl() + "/" + StringUtil.convertToAscii(image.getName());
		}
		LOG.info("newUrl: " + newUrl);
		
		// Make Path
		String newPath = FileSystemUtil.getPath(environment.getRequiredProperty("data.folder.path"), newUrl);
		
		LOG.info("newPath: " + newPath);

		// Check existed file
		String originFsPath = null;
		if(image.getId() != null
				&& !image.getName().equals(image.getOriginName())){
			LOG.info("RENAME");
			originFsPath = FileSystemUtil.getPath(environment.getRequiredProperty("data.folder.path"), image.getUrl());
			LOG.info("originFsPath: " + originFsPath);
			if( FileSystemUtil.isExistedFileSystem(newPath)){
				LOG.info("isExistedFileSystem: true");
				throw new IOException("File or Folder existed");
			}
		}
		else if(FileSystemUtil.isExistedFileSystem(newPath)){
			LOG.info("isExistedFileSystem: true");
			throw new IOException("File or Folder existed");
		}
		
		// Store filesystem on disk
		if(originFsPath != null){
			LOG.info("RENAME2: " + originFsPath + " -> " + newPath);
			FileSystemUtil.renameFileSystem(originFsPath, newPath);
			
			// Store info into database
			image.setFileType("FOLDER");
			image.setUrl(newUrl);
			image = saveImage(image);
			
			// Rename children
			imageDao.updateChildrenFolderURL(image.getId());
			
		}
		else{
			LOG.info("createFolder: " + newPath);
			FileSystemUtil.createFolder(newPath);
			
			// Store info into database
			image.setFileType("FOLDER");
			image.setUrl(newUrl);
			image = saveImage(image);
		}
		
		return image;
	}
	
	private ImageDTO createNewFile(ImageDTO image, MultipartFile file) throws IOException {
		
		LOG.info("======================================createNewFile");
		
		// get parent
		Image parent = imageDao.findById(image.getParent().getId());
		
		// url
		String newUrl = "";
		if(parent.getUrl().equals("/")){
			newUrl = "/" + StringUtil.convertToAscii(image.getName());
		}else{
			newUrl = parent.getUrl() + "/" + StringUtil.convertToAscii(image.getName());
		}
		LOG.info("newUrl: " + newUrl);
		
		// Make Path
		String newPath = FileSystemUtil.getPath(environment.getRequiredProperty("data.folder.path"), newUrl);
		LOG.info("newPath: " + newPath);

		// Check existed file
		String originFsPath = null;
		if(image.getId() != null
				&& !image.getName().equals(image.getOriginName())){
			LOG.info("RENAME: ");
			originFsPath = FileSystemUtil.getPath(environment.getRequiredProperty("data.folder.path"), image.getUrl());
			LOG.info("originFsPath: " + originFsPath);
			String fileExtension = FileSystemUtil.getExtensionWhenRenameFile(originFsPath, newPath);
			LOG.info("fileExtension: " + fileExtension);
			if(fileExtension != null && !fileExtension.isEmpty()){
				newUrl += ("." + fileExtension);
				newPath = FileSystemUtil.getPath(environment.getRequiredProperty("data.folder.path"), newUrl);
				LOG.info("newUrl: " + newUrl);
				LOG.info("newPath: " + newPath);
			} 
			if( FileSystemUtil.isExistedFileSystem(newPath)){
				LOG.info("File existed");
				throw new IOException("File existed");
			}
		}
		else if(FileSystemUtil.isExistedFileSystem(newPath)){
			LOG.info("File existed");
			throw new IOException("File existed");
		}
		
		// Store filesystem on disk
		if(originFsPath != null){
			LOG.info("RENAME: " + originFsPath + " -> " + newPath);
			FileSystemUtil.renameFileSystem(originFsPath, newPath);
		}
		else{
			LOG.info("Create new file: " + newPath);
			file.transferTo(new File(newPath));
			//FileSystemUtil.createFile(newPath, file.getBytes());
		}
		
		// Store info into database
		if(file != null){
			image.setFileType(file.getContentType());
		}
		image.setUrl(newUrl);
		image.setName( FilenameUtils.removeExtension(image.getName()) );
		image = saveImage(image);
		
		return image;
	}

	@Override
	public void deleteFileSystem(ImageDTO image) throws IOException{
		LOG.info("======================================deleteFileSystem");
		
		// Make Path
		String deletePath = FileSystemUtil.getPath(environment.getRequiredProperty("data.folder.path"), image.getUrl());
		
		// Delete into database, Also delete children if it has
		imageDao.deleteById(image.getId());
		
		// Delete
		FileSystemUtil.deleteFileSystem(deletePath);
		
	}

	@Override
	@Transactional(readOnly = true)
	public ImageDTO getChildrenByParentId(int parentId) {
		Image image = imageDao.findById(parentId);
		List<Image> children = imageDao.findByParentId(parentId); // Use this method to sort by created
		List<ImageDTO> dtos = new ArrayList<ImageDTO>();
		if( children != null && children.size() > 0){
			for( Image e : children ){
				ImageDTO dto = toDTO(e);
				dto.setParent(toDTO(e.getParent()));
				dtos.add(dto);
			}
		}
		ImageDTO dto = toDTO(image);
		dto.setParent(toDTO(image.getParent()));
		dto.setChildren(dtos);
		return dto;
	}

}
