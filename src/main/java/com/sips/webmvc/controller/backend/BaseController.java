package com.sips.webmvc.controller.backend;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.sips.webmvc.dto.httpresponse.HttpResponseDTO;

@Controller
public class BaseController {
	
	private static Logger LOG = Logger.getLogger(ImageController.class);

	@Autowired
    private Environment environment;
	
	@ModelAttribute
	public Model buildMenu(Model model) {
		
		model.addAttribute("dataDomain", environment.getRequiredProperty("data.domain"));
		
		return model;
	}
	
	protected HttpResponseDTO responseSuccess(Object data){
		HttpResponseDTO response = new HttpResponseDTO();
		response.setStatus(HttpResponseDTO.SUCCESS);
		response.setData(data);
		return response;
	}
	
	protected HttpResponseDTO responseError(String message){
		HttpResponseDTO response = new HttpResponseDTO();
		response.setStatus(HttpResponseDTO.ERROR);
		response.setMessage(message);
		return response;
	}

}
