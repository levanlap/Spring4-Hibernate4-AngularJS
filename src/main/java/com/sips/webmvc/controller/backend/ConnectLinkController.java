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

import com.sips.webmvc.dto.connect_link.ConnectLinkDTO;
import com.sips.webmvc.dto.page.PageDTO;
import com.sips.webmvc.service.connect_link.ConnectLinkService;
import com.sips.webmvc.service.page.PageService;

@Controller
@RequestMapping("/admin/connect_link")
public class ConnectLinkController extends BaseController{

	@Autowired
	private ConnectLinkService connectLinkService;

	@Autowired
	private PageService pageService;
	
	@RequestMapping(value = "/partner", method = RequestMethod.GET)
	public ModelAndView pages() {
		ModelAndView model = new ModelAndView("bac_partner");
		model.addObject("partnerMenuActive", "active");
		return model;
	}

	@RequestMapping(value = "/menu_footer_one", method = RequestMethod.GET)
	public ModelAndView menuFooterOne() {
		List<PageDTO> pages = pageService.findAllPages();
		ModelAndView model = new ModelAndView("bac_menu_footer_one");
		model.addObject("footerMenuOneActive", "active");
		model.addObject("pages", pages);
		return model;
	}

	@RequestMapping(value = "/menu_footer_two", method = RequestMethod.GET)
	public ModelAndView menuFooterTwo() {
		List<PageDTO> pages = pageService.findAllPages();
		ModelAndView model = new ModelAndView("bac_menu_footer_two");
		model.addObject("footerMenuTwoActive", "active");
		model.addObject("pages", pages);
		return model;
	}
	
	@RequestMapping(value = "/slideImages", method = RequestMethod.GET)
	public ModelAndView slideImages() {
		ModelAndView model = new ModelAndView("bac_slideimage");
		model.addObject("slideImageMenuActive", "active");
		return model;
	}
	
	@RequestMapping(value = "/bestCatalog", method = RequestMethod.GET)
	public ModelAndView bestCatalog() {
		ModelAndView model = new ModelAndView("bac_best_catalog");
		model.addObject("bestCatalogMenuActive", "active");
		return model;
	}


	@RequestMapping(value = "/find_conect_link_by_type/{type}", method = RequestMethod.GET)
	public @ResponseBody List<ConnectLinkDTO> findByType(@PathVariable("type") String type) {
		return connectLinkService.findByType(type);
	}

	@RequestMapping(value = "/find_connect_link/{id}", method = RequestMethod.GET)
	public @ResponseBody ConnectLinkDTO findConnectLink(@PathVariable("id") int id) {
		return connectLinkService.findById(id);
	}

	@RequestMapping(value = "/delete_connect_link/{id}", method = RequestMethod.DELETE)
	public @ResponseBody void deleteConnectLink(@PathVariable("id") int id) {
		connectLinkService.remove(id);
	}

	@RequestMapping(value = "/update_connect_link", method = RequestMethod.POST)
	public @ResponseBody ConnectLinkDTO updateConnectLink(@RequestBody ConnectLinkDTO dtoDetail) {
		connectLinkService.update(dtoDetail);
		return dtoDetail;
	}

}
