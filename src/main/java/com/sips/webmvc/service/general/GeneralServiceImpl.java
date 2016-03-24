package com.sips.webmvc.service.general;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sips.webmvc.dao.general.GeneralDao;
import com.sips.webmvc.dto.general.GeneralDTO;
import com.sips.webmvc.model.general.General;

@Service
@Transactional
public class GeneralServiceImpl implements GeneralService {

	@Autowired
	private GeneralDao generalDao;

	@Override
	@Transactional(readOnly = true)
	public GeneralDTO findSetting() {
		return toDTO(generalDao.findSetting());
	}

	public GeneralDTO toDTO(General entity) {
		if (entity == null) {
			return null;
		}
		GeneralDTO dto = new GeneralDTO();
		dto.setId(entity.getId());
		dto.setStyleLink(entity.getStyleLink());
		dto.setBackgroundLink(entity.getBackgroundLink());
		dto.setPreHeaderBg(entity.getPreHeaderBg());
		dto.setBackgroundContentRepeat(entity.getBackgroundContentRepeat());
		return dto;
	}
	
	@Override
	public General toEntity(GeneralDTO dto) {
		if(dto == null){
			return null;
		}
		General entity = new General();
		entity.setId(dto.getId());
		entity.setStyleLink(dto.getStyleLink());
		entity.setBackgroundLink(dto.getBackgroundLink());
		entity.setPreHeaderBg(dto.getPreHeaderBg());
		entity.setBackgroundContentRepeat(dto.getBackgroundContentRepeat());
		return entity;
	}
	
	@Override
	public GeneralDTO saveGeneral(GeneralDTO generalDto) {
		return toDTO(generalDao.saveGeneral(toEntity(generalDto)));
	}

}
