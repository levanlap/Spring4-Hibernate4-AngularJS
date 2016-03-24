package com.sips.webmvc.controller.backend;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.sips.webmvc.dto.image.ImageDTO;
import com.sips.webmvc.dto.order.OrderDTO;
import com.sips.webmvc.service.image.ImageService;
import com.sips.webmvc.service.order.OrderService;

@Controller
public class OrderController extends BaseController{
	@Autowired
	private OrderService orderService;

	@Autowired
	private ImageService imageService;

	@RequestMapping(value = "/admin/orders", method = RequestMethod.GET)
	public ModelAndView orders() {
		List<OrderDTO> orders = orderService.getByAll();
		List<ImageDTO> images = imageService.getByAll();
		ModelAndView model = new ModelAndView("bac_order", "orders", orders);
		model.addObject("images", images);
		model.addObject("orderMenuActive", "active");
		return model;
	}

	@RequestMapping(value = "/admin/listOrders", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody List<OrderDTO> listOrders(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		List<OrderDTO> orders = orderService.getByAll();
		return orders;
	}

	@RequestMapping(value = "/admin/saveOrder", method = RequestMethod.POST)
	public @ResponseBody OrderDTO saveOrder(@RequestBody OrderDTO order) {
		return orderService.saveOrder(order);
	}

	@RequestMapping(value = "/admin/deleteOrder", method = RequestMethod.POST)
	public @ResponseBody OrderDTO deleteOrder(@RequestBody OrderDTO order) {
		// Check constraints before delete
		return orderService.deleteById(order.getId());
	}

}
