package com.sips.webmvc.service.slideimage;

import java.util.List;

import com.sips.webmvc.dto.sildeimage.SlideImageDTO;
import com.sips.webmvc.model.slideimage.SlideImage;


public interface SlideImageService {
	
	SlideImage toEntity(SlideImageDTO dto);
	
	SlideImageDTO toDTO(SlideImage entity);
	
	List<SlideImageDTO> toDTOs(List<SlideImage> entities);

	List<SlideImageDTO> getByAll();

	SlideImageDTO getById(int id);
	
	SlideImageDTO saveSlideImage(SlideImageDTO product);
	
	SlideImageDTO deleteById(int id);
	
}
