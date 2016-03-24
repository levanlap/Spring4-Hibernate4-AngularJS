package com.sips.webmvc.controller.backend;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.jdbc.StringUtils;
import com.sips.webmvc.dto.customer.CustomerDTO;
import com.sips.webmvc.service.customer.CustomerService;

@Controller
public class CustomerController extends BaseController{

	@Autowired
	private CustomerService customerService;

	@RequestMapping(value = "/admin/customers", method = RequestMethod.GET)
	public ModelAndView catalogs() {
		ModelAndView model = new ModelAndView("bac_customer");
		model.addObject("customerMenuActive", "active");
		long total = customerService.countAll();
		model.addObject("total", total);
		return model;
	}

	@RequestMapping(value = "/admin/listCustomer/{currentPage}/{pageSize}", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody List<CustomerDTO> listCustomer(@PathVariable("currentPage") int currentPage,@PathVariable("pageSize") int pageSize,
			HttpServletRequest request, HttpServletResponse response) {
		List<CustomerDTO> customers = customerService.getCustomers((currentPage-1)*pageSize, pageSize);
		return customers;
	}

	@RequestMapping(value = "/admin/deleteCustomer/{id}", method = RequestMethod.DELETE)
	public @ResponseBody void deleteCustomer(@PathVariable("id") int id) {
		customerService.remove(id);
	}

	@RequestMapping(value = "/admin/updateCustomer", method = RequestMethod.POST)
	public @ResponseBody CustomerDTO updateCustomer(
			@RequestBody CustomerDTO dtoDetail) {
		if(!StringUtils.isNullOrEmpty(dtoDetail.getNewPassword())){
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String hashedPassword = passwordEncoder.encode(dtoDetail.getNewPassword());
			dtoDetail.setPassword(hashedPassword);
		}
		customerService.update(dtoDetail);
		return dtoDetail;
	}

}
