package com.sips.webmvc.controller.frontend;

import java.util.List;
import java.util.Locale;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.sips.webmvc.controller.backend.CustomerController;
import com.sips.webmvc.dto.catalog.CatalogDTO;
import com.sips.webmvc.dto.company.CompanyDTO;
import com.sips.webmvc.dto.connect_link.ConnectLinkDTO;
import com.sips.webmvc.dto.general.GeneralDTO;
import com.sips.webmvc.service.blog.BlogService;
import com.sips.webmvc.service.catalog.CatalogService;
import com.sips.webmvc.service.company.CompanyService;
import com.sips.webmvc.service.connect_link.ConnectLinkService;
import com.sips.webmvc.service.customer.CustomerService;
import com.sips.webmvc.service.general.GeneralService;
import com.sips.webmvc.service.page.PageService;
import com.sips.webmvc.service.product.ProductService;
import com.sips.webmvc.service.slideimage.SlideImageService;

@Controller
public class CommonFrontendController {
	
	private static Logger LOG = Logger.getLogger(CommonFrontendController.class);
	
	@Autowired
    protected Environment environment;
	
	@Autowired
	protected ProductService productService;
	
	@Autowired
	protected CatalogService catalogService;
	
	@Autowired
	protected SlideImageService slideImageService;
	
	@Autowired
	protected BlogService blogService;
	
	@Autowired
	protected CompanyService companyService;
	
	@Autowired
	protected GeneralService generalService;
	
	@Autowired
	protected PageService pageService;
	
	@Autowired
	protected CustomerService customerService;
	
	@Autowired
	protected ConnectLinkService partnerService;
	
	@Autowired  
	protected MessageSource messageSource;

    @ModelAttribute
    public Model buildMenu(Model model) {
    	
    	LOG.info("==============================buildMenu");
    	
    	// dataDomain
    	model.addAttribute("dataDomain", environment.getRequiredProperty("data.domain"));
    	
    	List<CatalogDTO> catalogs = catalogService.getTreeCatalogs();
    	model.addAttribute("catalogs",catalogs);
    	
    	// Company
    	List<CompanyDTO> companies = companyService.getByAll();
    	CompanyDTO company = null;
    	if(companies != null && companies.size() > 0){
    		company = companies.get(0);
    	}
    	model.addAttribute("company",company);
    	GeneralDTO generalSetting = generalService.findSetting();
    	model.addAttribute("generalSetting",generalSetting);
    	
    	List<ConnectLinkDTO> menuFooterOne = partnerService.findByType("MENU_FOOTER_ONE");
    	List<ConnectLinkDTO> menuFooterTwo = partnerService.findByType("MENU_FOOTER_TWO");
    	model.addAttribute("menuFooterOne",menuFooterOne);
    	model.addAttribute("menuFooterTwo",menuFooterTwo);
		return model;		
    }
    
    protected String getMessage(String key){
    	return messageSource.getMessage(key, null, Locale.ENGLISH);
    }
	
}
