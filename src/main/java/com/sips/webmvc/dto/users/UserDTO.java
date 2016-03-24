package com.sips.webmvc.dto.users;

import java.util.List;

public class UserDTO {

	private String name;
	private String email;
	private String username;
	private String password;
	private Integer enabled;
	private String newPassword;
	private List<UserRoleDTO> userRole;

	public UserDTO() {
	}

	public UserDTO(String username, String password, Integer enabled) {
		this.username = username;
		this.password = password;
		this.enabled = enabled;
	}

	public UserDTO(String username, String password, Integer enabled,
			List<UserRoleDTO> userRole) {
		this.username = username;
		this.password = password;
		this.enabled = enabled;
		this.userRole = userRole;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}


	public List<UserRoleDTO> getUserRole() {
		return userRole;
	}

	public void setUserRole(List<UserRoleDTO> userRole) {
		this.userRole = userRole;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public Integer getEnabled() {
		return enabled;
	}

	public void setEnabled(Integer enabled) {
		this.enabled = enabled;
	}

}
