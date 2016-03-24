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

import com.sips.webmvc.dto.httpresponse.HttpResponseDTO;
import com.sips.webmvc.dto.image.ImageDTO;
import com.sips.webmvc.dto.product.ProductDTO;
import com.sips.webmvc.service.image.ImageService;
import com.sips.webmvc.service.product.ProductService;

@Controller
public class ProductController extends BaseController{

	@Autowired
	private ProductService productService;

	@Autowired
	private ImageService imageService;

	@RequestMapping(value = "/admin/products", method = RequestMethod.GET)
	public ModelAndView products() {
		List<ProductDTO> products = productService.getAllByAdmin();
		List<ImageDTO> images = imageService.getByAll();
		ModelAndView model = new ModelAndView("bac_product", "products",
				products);
		model.addObject("images", images);
		model.addObject("productMenuActive", "active");
		long total = productService.countByAll();
		model.addObject("total", total);
		return model;
	}

	@RequestMapping(value = "/admin/listProducts/{currentPage}/{pageSize}", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody List<ProductDTO> listProducts(@PathVariable("currentPage") int currentPage,
			@PathVariable("pageSize") int pageSize)
			throws Exception {
		List<ProductDTO> products = productService.getByAll((currentPage - 1) * pageSize, pageSize);
		return products;
	}

	@RequestMapping(value = "/admin/saveProduct", method = RequestMethod.POST)
	public @ResponseBody HttpResponseDTO saveProduct(@RequestBody ProductDTO product) {
		
		if(productService.isExisted(product)){
		
			return responseError("Sản phẩm đã tồn tại trong danh mục");
		
		}else{
			
			product = productService.saveProduct(product);
			return responseSuccess(product);
			
		}
		
	}

	@RequestMapping(value = "/admin/makeProductFriendURL", method = RequestMethod.POST)
	public @ResponseBody ProductDTO makeProductFriendURL(
			@RequestBody ProductDTO product) {

		if (product == null || product.getName() == null) {
			return product;
		}
		String friendURL = product.getName();

		// Remove UTF-8 accents
		friendURL = Normalizer.normalize(friendURL, Normalizer.Form.NFD);
		friendURL = friendURL.replaceAll("[\\p{InCombiningDiacriticalMarks}]", "");
		friendURL = friendURL.trim().replaceAll(" ", "-").toLowerCase();
		String friendURLAuto = friendURL;
		int i = 0;
		int productId = (product.getId() == null || product.getId().intValue() <= 0) ? -1 : product.getId();
		while (true) {
			if (productService.countByFriendUrlExceptProductId(friendURLAuto, productId) > 0) {
				i++;
				friendURLAuto = friendURL + "-" + i;
			} else {
				break;
			}
		}
		product.setFriendURL(friendURLAuto);
		return product;
	}

	@RequestMapping(value = "/admin/deleteProduct/{id}", method = RequestMethod.POST)
	public @ResponseBody ProductDTO deleteProduct(@PathVariable("id") int id) {
		if(productService.canDeleteByProductId(id)){
			return productService.deleteById(id);
		}
		return null;
	}

}
