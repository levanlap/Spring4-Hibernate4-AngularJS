package com.sips.webmvc.controller.frontend;

import java.text.Normalizer;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sips.webmvc.controller.backend.ImageController;
import com.sips.webmvc.dto.blog.BlogDTO;
import com.sips.webmvc.dto.catalog.CatalogDTO;
import com.sips.webmvc.dto.company.CompanyDTO;
import com.sips.webmvc.dto.connect_link.ConnectLinkDTO;
import com.sips.webmvc.dto.general.GeneralDTO;
import com.sips.webmvc.dto.page.PageDTO;
import com.sips.webmvc.dto.product.ProductDTO;
import com.sips.webmvc.dto.sildeimage.SlideImageDTO;
import com.sips.webmvc.model.product.ProductStatusEnum;
import com.sips.webmvc.service.blog.BlogService;
import com.sips.webmvc.service.catalog.CatalogService;
import com.sips.webmvc.service.company.CompanyService;
import com.sips.webmvc.service.connect_link.ConnectLinkService;
import com.sips.webmvc.service.general.GeneralService;
import com.sips.webmvc.service.page.PageService;
import com.sips.webmvc.service.product.ProductService;
import com.sips.webmvc.service.slideimage.SlideImageService;

@Controller
public class FrontendController {
	
	private static Logger LOG = Logger.getLogger(ImageController.class);
	
	private static final int MAX_RESULTS = 18;
	
	@Autowired
    private Environment environment;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private CatalogService catalogService;
	
	@Autowired
	private SlideImageService slideImageService;
	
	@Autowired
	private BlogService blogService;
	
	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private GeneralService generalService;
	
	@Autowired
	private PageService pageService;
	
	@Autowired
	private ConnectLinkService partnerService;

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
    
	@RequestMapping(value = { "/", "/index"})
	public ModelAndView dashboard(HttpServletRequest request) {
		
		ModelAndView model = new ModelAndView("fro_index");
		
		// Slide Image
		//List<SlideImageDTO> slideImages = loadImageSlide();
		
		// New Products
		List<ProductDTO> newProducts = loadLastestProducts();
		
		// DiscountProducts
		List<ProductDTO> discountProducts = loadDiscountProducts();
	
		List<ProductDTO> bestSellerProducts = productService.getByBestSellers(0, 10);
		// Recent Blogs
		List<BlogDTO> recentBlogs = blogService.getRecentBlogs(0, 5);
		
		List<ConnectLinkDTO> partners = partnerService.findAllPartners();
		
		List<ConnectLinkDTO> slideImages = partnerService.findByType("SLIDE_IMAGE");
		
		List<ConnectLinkDTO> bestCatalogs = partnerService.findByType("BEST_CATALOG");
		
		model.addObject("newProducts", newProducts);
		model.addObject("discountProducts", discountProducts);
		model.addObject("bestSellerProducts", bestSellerProducts);
		model.addObject("slideImages", slideImages);
		model.addObject("recentBlogs", recentBlogs);
		model.addObject("partners", partners);
		model.addObject("bestCatalogs", bestCatalogs);
		
		return model;
		
	}
	
	/*@RequestMapping(value = "/gioi-thieu", method = RequestMethod.GET)
	public ModelAndView introduce(HttpServletRequest request) {
		
		ModelAndView model = new ModelAndView("fro_page");
		
		PageDTO pageDTO = pageService.getByFriendURL("gioi-thieu");
		
		model.addObject("pageDTO", pageDTO);
		
		return model;
	}
	
	@RequestMapping(value = "/huong-dan-thanh-toan", method = RequestMethod.GET)
	public ModelAndView paymentMethod(HttpServletRequest request) {
		
		ModelAndView model = new ModelAndView("fro_page");
		
		PageDTO pageDTO = pageService.getByFriendURL("huong-dan-thanh-toan");
		
		model.addObject("pageDTO", pageDTO);
		
		return model;
	}
	
	@RequestMapping(value = "/qui-dinh-mua-hang", method = RequestMethod.GET)
	public ModelAndView purchaseRule(HttpServletRequest request) {
		
		ModelAndView model = new ModelAndView("fro_page");
		
		PageDTO pageDTO = pageService.getByFriendURL("qui-dinh-mua-hang");
		
		model.addObject("pageDTO", pageDTO);
		
		return model;
	}*/
	
	@RequestMapping(value = "/trang/{page_name}", method = RequestMethod.GET)
	public ModelAndView purchaseRule1(HttpServletRequest request, @PathVariable("page_name") String pageName){
		
		ModelAndView model = new ModelAndView("fro_page");
		
		PageDTO pageDTO = pageService.getByFriendURL("trang/"+pageName);
		
		model.addObject("pageDTO", pageDTO);
		
		return model;
	}
	
	@RequestMapping(value = "/chi-nhanh-cua-hang-tu-van-hoa-tuoi", method = RequestMethod.GET)
	public ModelAndView getBranchesPage(HttpServletRequest request) {
		
		ModelAndView model = new ModelAndView("fro_branches");
		
		List<CompanyDTO> companies = companyService.getByAll();
    	CompanyDTO company = null;
    	if(companies != null && companies.size() > 0){
    		company = companies.get(0);
    	}
    	model.addObject("company", company);
		
		return model;
	}
	
	@RequestMapping(value = "/san-pham", method = RequestMethod.GET)
	public ModelAndView getProducts(HttpServletRequest request) {
		return searchProduct(request, null, null, -1, 1);
	}
	
	@RequestMapping(value = "/san-pham/{page}", method = RequestMethod.GET)
	public ModelAndView getProducts(
			HttpServletRequest request, 
			@PathVariable("page") int page) {
		return searchProduct(request, null, null, -1, page);
	}
	
	@RequestMapping(value = "/san-pham/{priceFilter}/{page}", method = RequestMethod.GET)
	public ModelAndView getProducts(
			HttpServletRequest request,
			@PathVariable("priceFilter") int priceFilter, 
			@PathVariable("page") int page) {
		return searchProduct(request, null, null, priceFilter, page);
	}
	
	@RequestMapping(value = "/san-pham-{catalogFriendURL}", method = RequestMethod.GET)
	public ModelAndView getProductsByCatalog(
			HttpServletRequest request, 
			@PathVariable("catalogFriendURL") String catalogFriendURL) {
		return searchProduct(request, catalogFriendURL, null, -1, 1);
	}
	
	@RequestMapping(value = "/san-pham-{catalogFriendURL}/{page}", method = RequestMethod.GET)
	public ModelAndView getProductsByCatalog(
			HttpServletRequest request, 
			@PathVariable("catalogFriendURL") String catalogFriendURL, 
			@PathVariable("page") int page) {
		return searchProduct(request, catalogFriendURL, null, -1, page);
	}
	
	@RequestMapping(value = "/san-pham-{catalogFriendURL}/{priceFilter}/{page}", method = RequestMethod.GET)
	public ModelAndView getProductsByCatalog(
			HttpServletRequest request, 
			@PathVariable("catalogFriendURL") String catalogFriendURL, 
			@PathVariable("priceFilter") int priceFilter,
			@PathVariable("page") int page) {
		return searchProduct(request, catalogFriendURL, null, priceFilter, page);
	}
	
	
	@RequestMapping(value = "/tim-kiem-san-pham-{searchText}", method = RequestMethod.GET)
	public ModelAndView searchProducts(
			HttpServletRequest request, 
			@PathVariable("searchText") String searchText) {
		return searchProduct(request, null, searchText, -1, 1);
	}
	
	@RequestMapping(value = "/tim-kiem-san-pham-{searchText}/{page}", method = RequestMethod.GET)
	public ModelAndView searchProducts(
			HttpServletRequest request, 
			@PathVariable("searchText") String searchText,
			@PathVariable("page") int page) {
		return searchProduct(request, null, searchText, -1, page);
	}
	
	@RequestMapping(value = "/tim-kiem-san-pham-{searchText}/{priceFilter}/{page}", method = RequestMethod.GET)
	public ModelAndView searchProducts(
			HttpServletRequest request, 
			@PathVariable("searchText") String searchText,
			@PathVariable("priceFilter") int priceFilter,
			@PathVariable("page") int page) {
		return searchProduct(request, null, searchText, priceFilter, page);
	}
	
	private ModelAndView searchProduct(
			HttpServletRequest request,
			String catalogFriendURL,
			String searchText,
			int priceFilter,
			int page){
		
		// Model
		ModelAndView model = new ModelAndView("fro_products");
		
		// Products
		List<ProductDTO> products = null;
		
		// Total the number of products
		long total = 0;
		
		// CurrentURL: This is used at paging
		StringBuilder currentURL = new StringBuilder();

		// CatalogSelected
		CatalogDTO catalogSelected = null;

		
		// Products
		if(catalogFriendURL != null){
			products = productService.getByCatalogFriendURLAndFilterByPrice(
			catalogFriendURL,
			priceFilter,
			page * MAX_RESULTS - MAX_RESULTS, 
			MAX_RESULTS);
			total = productService.countByCatalogFriendURLAndFilterByPrice(catalogFriendURL, priceFilter);
		}
		else if(searchText != null && !searchText.isEmpty()){
			
			String searchTextTemp = Normalizer.normalize(searchText, Normalizer.Form.NFD);
			searchTextTemp = searchText.replaceAll("[\\p{InCombiningDiacriticalMarks}]",
					"");
			searchTextTemp = searchTextTemp.toLowerCase();
			
			products = productService.getSearchTextAndFilterByPrice(
					searchText,
					priceFilter,
					page * MAX_RESULTS - MAX_RESULTS, 
					MAX_RESULTS);
			total = productService.countBySearchTextAndFilterByPrice(searchText, priceFilter);
		}else{
			products = productService.getFilterByPrice(
					priceFilter,
					page * MAX_RESULTS - MAX_RESULTS, 
					MAX_RESULTS);
			total = productService.countFilterByPrice(priceFilter);
		}
		long totalPage = getNumberOfPage(total);
		 
		// CurrentURL
		if(searchText != null){
			currentURL.append("tim-kiem-san-pham");
		}else{
			currentURL.append("san-pham");
		}
		if(catalogFriendURL != null){
			currentURL.append("-");
			currentURL.append(catalogFriendURL);
		}
		if(searchText != null){
			currentURL.append("-");
			currentURL.append(searchText);
		}
		if(priceFilter > -1){
			currentURL.append("/");
			currentURL.append(priceFilter);
		}
		
		// CatalogSelected
		catalogSelected = catalogService.getByFriendURL(catalogFriendURL);
		if(catalogSelected != null){
			CatalogDTO parentCatalogSelected = catalogService.getParentByFriendURL(catalogFriendURL);
			catalogSelected.setParent(parentCatalogSelected);
		}
		
		model.addObject("catalogSelected", catalogSelected);
		model.addObject("searchText", searchText);
		model.addObject("priceFilter", priceFilter);
		model.addObject("products", products);
		model.addObject("totalPage", totalPage);
		model.addObject("page", page);
		model.addObject("currentURL", currentURL.toString());
		
		return model;
	}
	
	@RequestMapping(value = "/chi-tiet-san-pham-{friendUrl}", method = RequestMethod.GET)
	public ModelAndView getProductDetail(HttpServletRequest request, 
				@PathVariable("friendUrl") String friendUrl) {
		
		// product
		ProductDTO product = productService.getByFriendUrl(friendUrl);
		if(product.getImageList() == null
			|| product.getImageList().size() == 0){
			product.getImageList().add(product.getImageLink());
		}else{
			if( !product.getImageList().contains(product.getImageLink()) ){
				product.getImageList().add(0, product.getImageLink());
			} 
		}
		
		//String catalogFriendURL = product.getCatalog().getFriendURL();
		
		// catalogSelected
		//CatalogDTO catalogSelected = catalogService.getByFriendURL(catalogFriendURL);
		
		// parentCatalogSelected
		//CatalogDTO parentCatalogSelected = catalogService.getParentByFriendURL(catalogFriendURL);
		//catalogSelected.setParent(parentCatalogSelected);
		
		List<BlogDTO> recentBlogs = blogService.getRecentBlogs(0, 12);
		
		// Relative Product
		//List<ProductDTO> relativeProducts = productService.getByRelativeProducts(product.getId());
		
		// Tab pay method
		PageDTO payMethod = pageService.findById(2);
		
		// Tab condition buy product
		PageDTO conditionBuy = pageService.findById(4);
		
		// model
		ModelAndView model = new ModelAndView("fro_product_detail");
		model.addObject("recentBlogs", recentBlogs);
		//model.addObject("catalogSelected", catalogSelected);
		model.addObject("product", product);
		//model.addObject("relativeProducts", relativeProducts);
		model.addObject("contentPayMethod", payMethod.getContent());
		model.addObject("contentConditionBuy", conditionBuy.getContent());
		return model;
	}

	private long getNumberOfPage(long total){
		
		long numberOfTotal = total/MAX_RESULTS;
		if(total%MAX_RESULTS != 0){
			numberOfTotal ++;
		}
		return numberOfTotal;
		
	}
	
	private List<SlideImageDTO> loadImageSlide(){
		List<SlideImageDTO> slideImages = slideImageService.getByAll();
		return slideImages;
	}
	
	private List<ProductDTO> loadLastestProducts(){
		List<ProductDTO> products = productService.getByStatus(-1, 8, ProductStatusEnum.NEW.name());
		return products;
	}

	private List<ProductDTO> loadDiscountProducts(){
		List<ProductDTO> discounts = productService.getByDiscounts(-1, 10);
		return discounts;
	}
	
}
