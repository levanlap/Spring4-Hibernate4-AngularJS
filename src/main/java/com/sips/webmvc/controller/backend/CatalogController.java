package com.sips.webmvc.controller.backend;

import java.text.Normalizer;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.sips.webmvc.dto.catalog.CatalogDTO;
import com.sips.webmvc.service.catalog.CatalogService;

@Controller
public class CatalogController extends BaseController{

	@Autowired
	private CatalogService catalogService;

	@RequestMapping(value = "/admin/catalogs", method = RequestMethod.GET)
	public ModelAndView catalogs() {
		ModelAndView model = new ModelAndView("bac_catalog");
		model.addObject("catalogMenuActive", "active");
		return model;
	}

	@RequestMapping(value = "/admin/listCatalogs", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody List<CatalogDTO> listCatalogs() {
		List<CatalogDTO> catalogs = catalogService.getTreeCatalogs();
		return catalogService.getSelectionCatalogs(catalogs, -1, 1);
	}

	@RequestMapping(value = "/admin/buildTreeView", method = RequestMethod.GET)
	public @ResponseBody String buildTreeView() {
		List<CatalogDTO> catalogs = catalogService.getTreeCatalogs();
		String treeViewCatalogs = convertToTreeView(catalogs);
		return "{\"JSON\":\"" + treeViewCatalogs + "\"}";
	}

	@RequestMapping(value = "/admin/findCatalog/{id}", method = RequestMethod.GET)
	public @ResponseBody CatalogDTO findCatalog(@PathVariable("id") int id) {
		return catalogService.findById(id);
	}

	@RequestMapping(value = "/admin/deleteCatalog/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String deleteCatalog(@PathVariable("id") int id) {
		try {
			boolean canDelete = catalogService.canDeleteById(id);
			if(canDelete){
				catalogService.deleteCatalog(id);
				List<CatalogDTO> catalogs = catalogService.getTreeCatalogs();
				String treeViewCatalogs = convertToTreeView(catalogs);
				return "{\"JSON\":\"" + treeViewCatalogs + "\"}";
			}else{
				return "{\"JSON\":\"ERROR\"}";
			}
		} catch (Exception e) {
			// TODO: handle exception
			return "{\"JSON\":\"ERROR\"}";
		}
	}
	
	@RequestMapping(value = "/admin/listSelectionCatalogs", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody List<CatalogDTO> listSelectionCatalogs(
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return catalogService.getSelectionCatalogs();
	}

	@RequestMapping(value = "/admin/saveCatalog", method = RequestMethod.POST)
	public @ResponseBody CatalogDTO saveCatalog(@RequestBody CatalogDTO dto) {
		return catalogService.saveCatalog(dto) ;
	}
	
	@RequestMapping(value = "/admin/makeCatalogFriendURL", method = RequestMethod.POST)	
	public @ResponseBody CatalogDTO makeCatalogFriendURL( @RequestBody CatalogDTO catalog )   {
		
		if(catalog == null || catalog.getName() == null){
			return catalog;
		}
		
		String friendURL = catalog.getName();
		
		// Remove UTF-8 accents
	    friendURL = Normalizer.normalize(friendURL, Normalizer.Form.NFD);
	    friendURL = friendURL.replaceAll("[\\p{InCombiningDiacriticalMarks}]", "");
	    
	    friendURL = friendURL.trim().replaceAll(" ", "-").toLowerCase();

		String friendURLAuto = friendURL;
		int i = 0;
		int catalogId = (catalog.getId() == null || catalog.getId().intValue() <= 0) ? -1 : catalog.getId();
		while(true){
			if( catalogService.countByFriendUrlExceptProductId(friendURLAuto, catalogId) > 0 ){
				i ++;
				friendURLAuto = friendURL + "-" + i;
			}else{
				break;
			}
		}
		
		catalog.setFriendURL(friendURLAuto);
		
		return catalog;
	}

	private String convertToTreeView(List<CatalogDTO> catalogs) {
		if (catalogs == null || catalogs.size() == 0) {
			return "";
		}
		StringBuilder htmlCatalogs = new StringBuilder("<ul>");
		for (CatalogDTO dto : catalogs) {
			htmlCatalogs.append("<li>");
			htmlCatalogs.append("<a href='' ng-click='catalogList.edit("
					+ dto.getId() + ")'>");
			htmlCatalogs.append(dto.getName());
			htmlCatalogs.append(convertToTreeView(dto.getChildren()));
			htmlCatalogs.append("</a>");
			htmlCatalogs.append("</li>");
		}
		htmlCatalogs.append("</ul>");
		return htmlCatalogs.toString();
	}

}
