package com.sips.webmvc.service.users;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mysql.jdbc.StringUtils;
import com.sips.webmvc.dao.users.UserDao;
import com.sips.webmvc.dto.users.UserDTO;
import com.sips.webmvc.dto.users.UserRoleDTO;
import com.sips.webmvc.model.users.UserRole;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;

	@Autowired
	private UserRoleService userRoleService;

	@Transactional(readOnly = true)
	@Override
	public UserDetails loadUserByUsername(final String username)
			throws UsernameNotFoundException {

		com.sips.webmvc.model.users.User user = userDao
				.findByUserName(username);
		if(user!=null && user.getEnabled()==0){
			user = null;
		}
		List<GrantedAuthority> authorities = buildUserAuthority(user
				.getUserRole());

		return buildUserForAuthentication(user, authorities);

	}

	// Converts com.mkyong.users.model.User user to
	// org.springframework.security.core.userdetails.User
	private User buildUserForAuthentication(
			com.sips.webmvc.model.users.User user,
			List<GrantedAuthority> authorities) {
		return new User(user.getUsername(), user.getPassword(),
				true, true, true, true, authorities);
	}

	private List<GrantedAuthority> buildUserAuthority(Set<UserRole> userRoles) {

		Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();

		// Build user's authorities
		for (UserRole userRole : userRoles) {
			setAuths.add(new SimpleGrantedAuthority(userRole.getRole()));
		}

		List<GrantedAuthority> Result = new ArrayList<GrantedAuthority>(
				setAuths);

		return Result;
	}

	@Override
	@Transactional(readOnly = true)
	public List<UserDTO> findAll() {
		return toDTOs(userDao.findAll());
	}

	@Override
	@Transactional
	public UserDTO findById(int id) {
		return toDTO(userDao.find(id));
	}

	@Override
	@Transactional
	public List<UserDTO> getUsers(int firstResult, int maxResults) {
		return toDTOs(userDao.getUsers(firstResult, maxResults));
	}
	
	@Override
	@Transactional
	public long countAll() {
		return userDao.countAll();
	}
	
	@Override
	@Transactional
	public void update(UserDTO userDTO) {
		com.sips.webmvc.model.users.User user = toEntite(userDTO);
		if (!StringUtils.isNullOrEmpty(userDTO.getNewPassword()))
        {
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String hashedPassword = passwordEncoder.encode(userDTO.getNewPassword());
            user.setPassword(hashedPassword);
        }
		userDao.update(user);
	}

	@Override
	@Transactional
	public void remove(int id) {
		userDao.remove(userDao.find(id));
	}

	@Override
	public com.sips.webmvc.model.users.User toEntite(UserDTO dto) {
		com.sips.webmvc.model.users.User entite = new com.sips.webmvc.model.users.User();
		entite.setUsername(dto.getUsername());
		entite.setPassword(dto.getPassword());
		entite.setEnabled(dto.getEnabled());
		entite.setName(dto.getName());
		entite.setEmail(dto.getEmail());
		return entite;
	}

	@SuppressWarnings("rawtypes")
	@Override
	public UserDTO toDTO(com.sips.webmvc.model.users.User entite) {
		UserDTO dto = new UserDTO();
		dto.setUsername(entite.getUsername());
		dto.setPassword(entite.getPassword());
		dto.setEnabled(entite.getEnabled());
		dto.setName(entite.getName());
		dto.setEmail(entite.getEmail());
		if (!entite.getUserRole().isEmpty()) {
			List<UserRoleDTO> userRoleDTOs = new ArrayList<UserRoleDTO>();
			Iterator itr = entite.getUserRole().iterator();
			while (itr.hasNext()) {
				UserRole element = (UserRole) itr.next();
				userRoleDTOs.add(userRoleService.toDTO(element));
			}
			dto.setUserRole(userRoleDTOs);
		}
		return dto;
	}

	@Override
	public List<UserDTO> toDTOs(List<com.sips.webmvc.model.users.User> entites) {
		List<UserDTO> dtos = new ArrayList<UserDTO>();
		for (com.sips.webmvc.model.users.User entite : entites) {
			dtos.add(toDTO(entite));
		}
		return dtos;
	}
}