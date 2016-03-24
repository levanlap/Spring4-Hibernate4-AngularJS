package com.sips.webmvc.service.users;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sips.webmvc.dto.users.UserRoleDTO;
import com.sips.webmvc.model.users.UserRole;

@Service
@Transactional
public class UserRoleServiceImpl implements UserRoleService {

	@Autowired
	private UserService userService;

	@Override
	public UserRole toEntity(UserRoleDTO dto) {
		if (dto == null) {
			return null;
		}
		UserRole entity = new UserRole();
		entity.setUserRoleId(entity.getUserRoleId());
		return entity;
	}

	@Override
	public UserRoleDTO toDTO(UserRole entity) {
		if (entity == null) {
			return null;
		}
		UserRoleDTO dto = new UserRoleDTO();
		dto.setUserRoleId(entity.getUserRoleId());
		dto.setRole(entity.getRole());
		return dto;
	}

	@Override
	@Transactional(readOnly = true)
	public List<UserRoleDTO> toDTOs(List<UserRole> entities) {
		List<UserRoleDTO> dtos = new ArrayList<UserRoleDTO>();
		if (entities != null && entities.size() > 0) {
			for (UserRole e : entities) {
				UserRoleDTO dto = toDTO(e);
				dtos.add(dto);
			}
		}
		return dtos;
	}

}
