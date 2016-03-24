package com.sips.webmvc.dto.users;


public class UserRoleDTO {

	private Integer userRoleId;
	private UserDTO user;
	private String role;

	public UserRoleDTO() {
	}

	public UserRoleDTO(UserDTO user, String role) {
		this.user = user;
		this.role = role;
	}

	public Integer getUserRoleId() {
		return userRoleId;
	}

	public void setUserRoleId(Integer userRoleId) {
		this.userRoleId = userRoleId;
	}

	public UserDTO getUser() {
		return user;
	}

	public void setUser(UserDTO user) {
		this.user = user;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

}