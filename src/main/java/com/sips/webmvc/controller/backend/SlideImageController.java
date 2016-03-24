package com.sips.webmvc.controller.backend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.sips.webmvc.dto.connect_link.ConnectLinkDTO;
import com.sips.webmvc.dto.image.ImageDTO;
import com.sips.webmvc.service.connect_link.ConnectLinkService;
import com.sips.webmvc.service.image.ImageService;
import com.sips.webmvc.service.slideimage.SlideImageService;

@Controller
public class SlideImageController extends BaseController{
	
	@Autowired
	private ImageService imageService;

	@Autowired
	private SlideImageService slideImageService;
	
	@Autowired
	private ConnectLinkService connectLinkService;

	@RequestMapping(value = "/admin/slideImages", method = RequestMethod.GET)
	public ModelAndView slideImages() {
		List<ImageDTO> images = imageService.getByAll();
		ModelAndView model = new ModelAndView("bac_slideimage");
		model.addObject("slideImageMenuActive", "active");
		model.addObject("images", images);
		return model;
	}

	@RequestMapping(value = "/admin/listSlideImage", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody List<ConnectLinkDTO> listSlideImage(){
		//List<SlideImageDTO> slideImages = slideImageService.getByAll();
		List<ConnectLinkDTO> slideImages = connectLinkService.findByType("SLIDE_IMAGE");
		return slideImages;
	}

    @RequestMapping(value = "/admin/deleteSlideImage/{id}", method = RequestMethod.DELETE)
    public @ResponseBody void deleteSlideImage(@PathVariable("id") int id){
    	slideImageService.deleteById(id);
    }
    
    
	@RequestMapping(value = "/admin/updateSlideImage", method = RequestMethod.POST)
	public @ResponseBody ConnectLinkDTO updateSlideImage(
			@RequestBody ConnectLinkDTO dtoDetail) {
		connectLinkService.update(dtoDetail);
		return dtoDetail;
	}

}
