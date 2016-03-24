package com.sips.webmvc.controller.frontend;

import java.text.Normalizer;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
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
import com.sips.webmvc.service.order.OrderService;
import com.sips.webmvc.service.product.ProductService;
import com.sips.webmvc.service.transaction.TransactionService;

@Controller
public class RestApiController {

	@Autowired
    private Environment environment;
	
	@Autowired
	private CatalogService catalogService;

	@Autowired
	private ProductService productService;

	@Autowired
	private TransactionService transactionService;

	@Autowired
	private OrderService orderService;

	@RequestMapping(value = "/api/catalogs", method = RequestMethod.GET)
	public ModelAndView catalogs() {
		ModelAndView model = new ModelAndView("bac_catalog");
		model.addObject("catalogMenuActive", "active");
		return model;
	}

	@RequestMapping(value = "/api/listCatalogs", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody List<CatalogDTO> listCatalogs() {
		List<CatalogDTO> catalogs = catalogService.getTreeCatalogs();
		return catalogService.getSelectionCatalogs(catalogs, -1, 1);
	}

	@RequestMapping(value = "/api/buildTreeView", method = RequestMethod.GET)
	public @ResponseBody List<CatalogDTO> buildTreeView() {
		List<CatalogDTO> catalogs = catalogService.getTreeCatalogs();
		return catalogs;
	}

	@RequestMapping(value = "/api/findCatalog/{id}", method = RequestMethod.GET)
	public @ResponseBody CatalogDTO findCatalog(@PathVariable("id") int id) {
		return catalogService.findById(id);
	}

	@RequestMapping(value = "/api/deleteCatalog/{id}", method = RequestMethod.DELETE)
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
	
	@RequestMapping(value = "/api/listSelectionCatalogs", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody List<CatalogDTO> listSelectionCatalogs(
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		return catalogService.getSelectionCatalogs();
	}

	@RequestMapping(value = "/api/saveCatalog", method = RequestMethod.POST)
	public @ResponseBody CatalogDTO saveCatalog(@RequestBody CatalogDTO dto) {
		return catalogService.saveCatalog(dto) ;
	}
	
	@RequestMapping(value = "/api/makeCatalogFriendURL", method = RequestMethod.POST)	
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
