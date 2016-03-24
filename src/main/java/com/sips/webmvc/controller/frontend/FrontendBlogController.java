package com.sips.webmvc.controller.frontend;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sips.webmvc.dto.blog.BlogDTO;
import com.sips.webmvc.dto.catalog.CatalogDTO;
import com.sips.webmvc.dto.company.CompanyDTO;
import com.sips.webmvc.dto.general.GeneralDTO;
import com.sips.webmvc.service.blog.BlogService;
import com.sips.webmvc.service.catalog.CatalogService;
import com.sips.webmvc.service.company.CompanyService;
import com.sips.webmvc.service.general.GeneralService;
import com.sips.webmvc.service.slideimage.SlideImageService;

@Controller
public class FrontendBlogController {
	
	private static final int MAX_RESULTS = 4;
	
	@Autowired
    private Environment environment;
	
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

    @ModelAttribute
    public Model buildMenu(Model model) {
    	
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
		return model;		
    }
    
    @RequestMapping(value = "/nhung-bai-viet-ve-hoa", method = RequestMethod.GET)
	public ModelAndView getBlogs(
			HttpServletRequest request) {
    	return getBlogs(request, 1);
    }
    
    @RequestMapping(value = "/nhung-bai-viet-ve-hoa-{page}", method = RequestMethod.GET)
	public ModelAndView getBlogs(
			HttpServletRequest request,
			@PathVariable("page") int page) {
		
		// model
		ModelAndView model = new ModelAndView("fro_blogs");
		
		List<BlogDTO> blogs = blogService.getByAll();
		
		// Total the number of blogs
		long total = 0;
		
		blogs = blogService.getByAll(
				page * MAX_RESULTS - MAX_RESULTS, 
				MAX_RESULTS);
		total = blogService.countByAll();
		long totalPage = getNumberOfPage(total);
		
		if(blogs != null && blogs.size() > 0){
			for(BlogDTO dto : blogs){
				if(dto.getContent().length() > 350){
					dto.setContent(dto.getContent().substring(0, 350));
				}
			}
		}
		
		// Recent Blogs
		List<BlogDTO> recentBlogs = blogService.getRecentBlogs(0, 4);
		
		model.addObject("blogs", blogs);
		model.addObject("recentBlogs", recentBlogs);
		model.addObject("totalPage", totalPage);
		model.addObject("page", page);
		model.addObject("currentURL", "nhung-bai-viet-ve-hoa");
		
		return model;
	}
    
    @RequestMapping(value = "/bai-viet-{friendURL}", method = RequestMethod.GET)
	public ModelAndView getBlogDetail(
			HttpServletRequest request, 
			@PathVariable("friendURL") String friendURL) {
		
		// model
		ModelAndView model = new ModelAndView("fro_blog_detail");
		
		// Blog
		BlogDTO blog = blogService.getBlogByFriendURL(friendURL);
		
		// Recent Blogs
		List<BlogDTO> recentBlogs = blogService.getRecentBlogs(0, 4);
		
		model.addObject("blog", blog);
		model.addObject("recentBlogs", recentBlogs);
		
		return model;
	}
	
    private long getNumberOfPage(long total){
		
		long numberOfTotal = total/MAX_RESULTS;
		if(total%MAX_RESULTS != 0){
			numberOfTotal ++;
		}
		return numberOfTotal;
		
	}
	
}
