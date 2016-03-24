package com.sips.webmvc.service.users;

import java.util.List;

import com.sips.webmvc.dto.users.UserRoleDTO;
import com.sips.webmvc.model.users.UserRole;


public interface UserRoleService {

	UserRole toEntity(UserRoleDTO dto);

	UserRoleDTO toDTO(UserRole entity);

	List<UserRoleDTO> toDTOs(List<UserRole> entities);
	
}
