package com.sips.webmvc.controller.backend;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.sips.webmvc.dto.users.UserDTO;
import com.sips.webmvc.service.users.UserService;

@Controller
public class UserController extends BaseController{

	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/admin/users", method = RequestMethod.GET)
	public ModelAndView users() {
		ModelAndView model = new ModelAndView("bac_user");
		List<String> roles = new ArrayList<String>();
		roles.add("ADMIN_TECHNICAL");
		roles.add("ADMIN_SALE");
		model.addObject("roles", roles);
		model.addObject("userMenuActive", "active");
		long total=userService.countAll();
		model.addObject("total", total);
		return model;
	}

	@RequestMapping(value = "/admin/listUser/{currentPage}/{pageSize}", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody List<UserDTO> listUser(@PathVariable("currentPage") int currentPage,
			@PathVariable("pageSize") int pageSize) {
		List<UserDTO> dtos = userService.getUsers((currentPage - 1) * pageSize, pageSize);
		return dtos;
	}

	@RequestMapping(value = "/admin/updateUser", method = RequestMethod.POST)
	public @ResponseBody UserDTO updateUser(@RequestBody UserDTO dto) {
		 userService.update(dto);
		 return dto;
	}
	
}
