package com.sips.webmvc.service.connect_link;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.sips.webmvc.dao.connect_link.ConnectLinkDao;
import com.sips.webmvc.dto.connect_link.ConnectLinkDTO;
import com.sips.webmvc.model.connect_link.ConnectLink;
import com.sips.webmvc.service.image.ImageService;

@Service
public class ConnectLinkServiceImpl implements ConnectLinkService {

	@Autowired
	private ConnectLinkDao  partnerDao;
	
	@Autowired
	private ImageService imageService;
	
	@Override
	public ConnectLinkDTO toDTO(ConnectLink entity) {
		if(entity == null){
			return null;
		}
		ConnectLinkDTO dto = new ConnectLinkDTO();
		dto.setId(entity.getId());
		dto.setName(entity.getName());
		dto.setLink(entity.getLink());
		dto.setLinkImage(entity.getLinkImage());
		if(!StringUtils.isEmpty(entity.getLinkImage())){
			dto.setImageLink(imageService.getById(Integer.parseInt(entity.getLinkImage())));
		}
		dto.setType(entity.getType());
		dto.setSortOrder(entity.getSortOrder());
		return dto;
	}
	
	@Override
	public ConnectLink toEntite(ConnectLinkDTO dto) {
		ConnectLink entity = new ConnectLink();
		entity.setId(dto.getId());
		entity.setName(dto.getName());
		entity.setLink(dto.getLink());
		entity.setLinkImage(dto.getLinkImage());
		entity.setType(dto.getType());
		entity.setSortOrder(dto.getSortOrder());
		return entity;
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<ConnectLinkDTO> toDTOs(List<ConnectLink> partner) {
		List<ConnectLinkDTO> dtos = new ArrayList<ConnectLinkDTO>();
		if( partner != null && partner.size() > 0){
			for( ConnectLink c : partner ){
				ConnectLinkDTO dto = toDTO(c);
				dtos.add(dto);
			}
		}
		return dtos;
	}

	@Override
	@Transactional(readOnly = true)
	public ConnectLinkDTO findById(int id) {
		return toDTO(partnerDao.findById(id));
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<ConnectLinkDTO> findAllPartners() {
		return toDTOs(partnerDao.findAllPartners());
	}
	
	@Override
	@Transactional(readOnly = true)
	public List<ConnectLinkDTO> findByType(String type) {
		return toDTOs(partnerDao.findByType(type));
	}
	
	@Override
	@Transactional
	public void remove(int id) {
		partnerDao.remove(partnerDao.find(id));
	}
	
	@Override
	@Transactional
	public void update(ConnectLinkDTO dto) {
		ConnectLink entite =  toEntite(dto);
		partnerDao.update(entite);
	}

}
