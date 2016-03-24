package com.sips.webmvc.controller.backend;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sips.webmvc.constant.StyleCssValue;
import com.sips.webmvc.dto.general.GeneralDTO;
import com.sips.webmvc.dto.image.ImageDTO;
import com.sips.webmvc.service.general.GeneralService;
import com.sips.webmvc.service.image.ImageService;

@Controller
public class GeneralController extends BaseController{

	@Autowired
	private GeneralService generalService;

	@Autowired
	private ImageService imageService;

	@RequestMapping(value = "/admin/general", method = RequestMethod.GET)
	public ModelAndView generals() {
		ModelAndView model = new ModelAndView("bac_general");
		GeneralDTO generalSetting = generalService.findSetting();
		StyleCssValue styleCssValue = new StyleCssValue(new HashMap<String, String>());
		String styleColor = styleCssValue.getCssColor(generalSetting.getStyleLink());
		generalSetting.setStyleColor(styleColor);
		model.addObject("generalSetting", generalSetting);
		List<ImageDTO> images = imageService.getByAll();
		model.addObject("images", images);
		model.addObject("generalMenuActive", "active");
		return model;
	}

	@RequestMapping(value = "/admin/saveGeneral", method = RequestMethod.POST)
	public @ResponseBody GeneralDTO updateBlog(@RequestBody GeneralDTO dtoDetail) {
		StyleCssValue styleCssValue = new StyleCssValue(new HashMap<String, String>());
		String styleLink = styleCssValue.getCssLink(dtoDetail.getStyleColor());
		dtoDetail.setStyleLink(styleLink);
		dtoDetail = generalService.saveGeneral(dtoDetail);
		return dtoDetail;
	}
}
