package com.sips.webmvc.controller.backend;

import java.io.UnsupportedEncodingException;
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

import com.sips.webmvc.dto.blog.BlogDTO;
import com.sips.webmvc.dto.image.ImageDTO;
import com.sips.webmvc.service.blog.BlogService;
import com.sips.webmvc.service.image.ImageService;

@Controller
public class BlogController extends BaseController{

	@Autowired
	private BlogService blogService;

	@Autowired
	private ImageService imageService;

	@RequestMapping(value = "/admin/blogs", method = RequestMethod.GET)
	public ModelAndView catalogs() {
		List<ImageDTO> images = imageService.getByAll();
		ModelAndView model = new ModelAndView("bac_blog");
		model.addObject("blogMenuActive", "active");
		model.addObject("images", images);
		long total = blogService.countByAll();
		model.addObject("total", total);
		return model;
	}

	@RequestMapping(value = "/admin/listBlog/{currentPage}/{pageSize}", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody List<BlogDTO> listBlog(@PathVariable("currentPage") int currentPage,
			@PathVariable("pageSize") int pageSize) {
		List<BlogDTO> blogs = blogService.getRecentBlogs((currentPage - 1) * pageSize, pageSize);
		return blogs;
	}

	@RequestMapping(value = "/admin/findByName/{currentPage}/{pageSize}/{name}", method = RequestMethod.GET)
	public @ResponseBody List<BlogDTO> findByName(@PathVariable("currentPage") int currentPage,
			@PathVariable("pageSize") int pageSize, @PathVariable("name") String name, HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		List<BlogDTO> blogs = blogService.findBlogsByName((currentPage - 1) * pageSize, pageSize, name);
		return blogs;
	}

	@RequestMapping(value = "/admin/countByName/{name}", method = RequestMethod.GET)
	public @ResponseBody long countByName(@PathVariable("name") String name) {
		long total = blogService.countByName(name);
		return total;
	}

	@RequestMapping(value = "/admin/deleteBlog/{id}", method = RequestMethod.DELETE)
	public @ResponseBody void deleteBlog(@PathVariable("id") int id) {
		blogService.deleteById(id);
	}

	@RequestMapping(value = "/admin/saveBlog", method = RequestMethod.POST)
	public @ResponseBody BlogDTO updateBlog(@RequestBody BlogDTO dtoDetail) {
		dtoDetail = blogService.saveBlog(dtoDetail);
		return dtoDetail;
	}

	@RequestMapping(value = "/admin/makeBlogFriendURL", method = RequestMethod.POST)
	public @ResponseBody BlogDTO makeBlogFriendURL(@RequestBody BlogDTO blog) {

		if (blog == null || blog.getTitle() == null) {
			return blog;
		}
		String friendURL = blog.getTitle();

		// Remove UTF-8 accents
		friendURL = Normalizer.normalize(friendURL, Normalizer.Form.NFD);
		friendURL = friendURL.replaceAll("[\\p{InCombiningDiacriticalMarks}]", "");
		friendURL = friendURL.trim().replaceAll(" ", "-").toLowerCase();
		String friendURLAuto = friendURL;
		int i = 0;
		int blogId = (blog.getId() == null || blog.getId().intValue() <= 0) ? -1 : blog.getId();
		while (true) {
			if (blogService.countByFriendUrlExceptProductId(friendURLAuto, blogId) > 0) {
				i++;
				friendURLAuto = friendURL + "-" + i;
			} else {
				break;
			}
		}
		blog.setFriendURL(friendURLAuto);
		return blog;
	}

}
