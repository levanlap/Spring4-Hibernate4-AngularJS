package com.sips.webmvc.service.slideimage;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sips.webmvc.dao.slideimage.SlideImageDao;
import com.sips.webmvc.dto.sildeimage.SlideImageDTO;
import com.sips.webmvc.model.slideimage.SlideImage;
import com.sips.webmvc.service.image.ImageService;

@Service
@Transactional
public class SlideImageServiceImpl implements SlideImageService {

	@Autowired
	private SlideImageDao slideImageDao;
	
	@Autowired
	private ImageService imageService;
	
	@Override
	public SlideImage toEntity(SlideImageDTO dto) {
		if(dto == null){
			return null;
		}
		SlideImage entity = new SlideImage();
		entity.setId(dto.getId());
		entity.setTitle(dto.getTitle());
		entity.setLink(dto.getLink());
		entity.setSubtitle(dto.getSubTitle());
		entity.setShortDesc(dto.getShortDesc());
		entity.setImage( imageService.toEntity(dto.getImage()) );
		return entity;
	}
	
	@Override
	public SlideImageDTO toDTO(SlideImage entity) {
		if(entity == null){
			return null;
		}
		SlideImageDTO dto = new SlideImageDTO();
		dto.setId(entity.getId());
		dto.setTitle(entity.getTitle());
		dto.setLink(entity.getLink());
		dto.setSubTitle(entity.getSubtitle());
		dto.setShortDesc(entity.getShortDesc());
		dto.setImage(imageService.toDTO(entity.getImage()));
		return dto;
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<SlideImageDTO> toDTOs(List<SlideImage> entities) {
		List<SlideImageDTO> dtos = new ArrayList<SlideImageDTO>();
		if( entities != null && entities.size() > 0){
			for( SlideImage e : entities ){
				SlideImageDTO dto = toDTO(e);
				dtos.add(dto);
			}
		}
		return dtos;
	}

	@Override
	@Transactional(readOnly = true)
	public List<SlideImageDTO> getByAll() {
		return toDTOs(slideImageDao.findAll());
	}

	@Override
	@Transactional(readOnly = true)
	public SlideImageDTO getById(int id) {
		return toDTO( slideImageDao.find(id) );
	}

	@Override
	public SlideImageDTO saveSlideImage(SlideImageDTO slideImage) {
		return toDTO( slideImageDao.saveSlideImage( toEntity(slideImage)) );
	}

	@Override
	public SlideImageDTO deleteById(int id) {
		return toDTO( slideImageDao.deleteById(id) );
	}

}
