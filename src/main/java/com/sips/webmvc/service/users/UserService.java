package com.sips.webmvc.service.users;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetailsService;

import com.sips.webmvc.dto.users.UserDTO;
import com.sips.webmvc.model.users.User;


public interface UserService extends UserDetailsService {

	List<UserDTO> findAll();

	UserDTO findById(int id);

	void update(UserDTO userDTO);

	void remove(int id);

	User toEntite(UserDTO customerDto);

	UserDTO toDTO(User user);

	List<UserDTO> toDTOs(List<User> users);

	List<UserDTO> getUsers(int firstResult, int maxResults);

	long countAll();
	
}
