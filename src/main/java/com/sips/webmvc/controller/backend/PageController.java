package com.sips.webmvc.controller.backend;

import java.text.Normalizer;
import java.util.List;

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

import com.sips.webmvc.dto.page.PageDTO;
import com.sips.webmvc.service.page.PageService;

@Controller
public class PageController extends BaseController {

	@Autowired
	private PageService pageService;

	@RequestMapping(value = "/admin/pages", method = RequestMethod.GET)
	public ModelAndView pages() {
		ModelAndView model = new ModelAndView("bac_page");
		model.addObject("pageMenuActive", "active");
		return model;
	}

	@RequestMapping(value = "/admin/listPages", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody List<PageDTO> listPages() {
		List<PageDTO> pages = pageService.getTreePages();
		return pageService.getSelectionPages(pages, -1, 1);
	}

	@RequestMapping(value = "/admin/buildPageTreeView", method = RequestMethod.GET)
	public @ResponseBody String buildPageTreeView() {
		List<PageDTO> pages = pageService.getTreePages();
		String treeViewPages = convertToPageTreeView(pages);
		return "{\"JSON\":\"" + treeViewPages + "\"}";
	}

	@RequestMapping(value = "/admin/findPage/{id}", method = RequestMethod.GET)
	public @ResponseBody PageDTO findPage(@PathVariable("id") int id) {
		return pageService.findById(id);
	}

	@RequestMapping(value = "/admin/deletePage/{id}", method = RequestMethod.DELETE)
	public @ResponseBody String deletePage(@PathVariable("id") int id) {
		try {
			pageService.deletePage(id);
			List<PageDTO> pages = pageService.getTreePages();
			String treeViewPages = convertToPageTreeView(pages);
			return "{\"JSON\":\"" + treeViewPages + "\"}";
		} catch (Exception e) {
			return "{\"JSON\":\"ERROR\"}";
		}
	}

	@RequestMapping(value = "/admin/savePage", method = RequestMethod.POST, consumes = "application/json")
	public @ResponseBody PageDTO savePage(@RequestBody PageDTO dto) {
		return pageService.savePage(dto);
	}

	@RequestMapping(value = "/admin/makePageFriendURL", method = RequestMethod.POST)
	public @ResponseBody PageDTO makePageFriendURL(@RequestBody PageDTO page) {

		if (page == null || page.getName() == null) {
			return page;
		}

		String friendURL = page.getName();

		// Remove UTF-8 accents
		friendURL = Normalizer.normalize(friendURL, Normalizer.Form.NFD);
		friendURL = friendURL.replaceAll("[\\p{InCombiningDiacriticalMarks}]", "");
		friendURL = friendURL.trim().toLowerCase().replaceAll(" ", "-").replaceAll("/", "-").replaceAll("đ", "d");
		String friendURLAuto = friendURL;
		int i = 0;
		int pageId = (page.getId() == null || page.getId().intValue() <= 0) ? -1
				: page.getId();
		while (true) {
			if (pageService.countByFriendUrlExceptPageId(friendURLAuto,
					pageId) > 0) {
				i++;
				friendURLAuto = friendURL + "-" + i;
			} else {
				break;
			}
		}

		page.setFriendURL(friendURLAuto);

		return page;
	}

	private String convertToPageTreeView(List<PageDTO> pages) {
		if (pages == null || pages.size() == 0) {
			return "";
		}
		StringBuilder htmlPages = new StringBuilder("<ul>");
		for (PageDTO dto : pages) {
			htmlPages.append("<li>");
			htmlPages.append("<a href='' ng-click='pageList.edit("
					+ dto.getId() + ")'>");
			htmlPages.append(dto.getName());
			htmlPages.append("</a>");
			htmlPages.append("</li>");
		}
		htmlPages.append("</ul>");
		return htmlPages.toString();
	}

}
