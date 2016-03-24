package com.sips.webmvc.controller.backend;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sips.webmvc.dto.company.CompanyDTO;
import com.sips.webmvc.service.company.CompanyService;

@Controller
public class CompanyController extends BaseController{

	@Autowired
	private CompanyService companyService;
	
	@RequestMapping(value = "/admin/company", method = RequestMethod.GET)
	public ModelAndView getCompany() {
		ModelAndView model = new ModelAndView("bac_company");
		model.addObject("companyMenuActive", "active");
		return model;
	}
	
	@RequestMapping(value = "/admin/getCompany/{companyId}", method = RequestMethod.GET)
	public @ResponseBody CompanyDTO getCompany(@PathVariable("companyId") int companyId) {
		
		// Company
    	List<CompanyDTO> companies = companyService.getByAll();
    	CompanyDTO company = null;
    	if(companies != null && companies.size() > 0){
    		company = companies.get(0);
    	}
		
		return company;
	}
	
	@RequestMapping(value = "/admin/saveCompany", method = RequestMethod.POST)
	public @ResponseBody CompanyDTO updateCompany(
			@RequestBody CompanyDTO dtoDetail) {
		dtoDetail = companyService.saveCompany(dtoDetail);
		return dtoDetail;
	}
	
}
