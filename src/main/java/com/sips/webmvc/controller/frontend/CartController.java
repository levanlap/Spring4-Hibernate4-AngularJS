package com.sips.webmvc.controller.frontend;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.sips.webmvc.dto.catalog.CatalogDTO;
import com.sips.webmvc.dto.company.CompanyDTO;
import com.sips.webmvc.dto.customer.CustomerDTO;
import com.sips.webmvc.dto.general.GeneralDTO;
import com.sips.webmvc.dto.order.OrderDTO;
import com.sips.webmvc.dto.product.ProductDTO;
import com.sips.webmvc.dto.transaction.TransactionDTO;
import com.sips.webmvc.model.transaction.TransactionPaymentMethodEnum;
import com.sips.webmvc.service.catalog.CatalogService;
import com.sips.webmvc.service.company.CompanyService;
import com.sips.webmvc.service.customer.CustomerService;
import com.sips.webmvc.service.general.GeneralService;
import com.sips.webmvc.service.order.OrderService;
import com.sips.webmvc.service.product.ProductService;
import com.sips.webmvc.service.transaction.TransactionService;

@Controller
public class CartController {
	
	@Autowired
    private Environment environment;
	
	@Autowired
	private ProductService productService;	
	
	@Autowired
	private TransactionService transactionService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private CustomerService customerService;
	
	@Autowired
	private CatalogService catalogService;
	
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
	
	@RequestMapping(value = "/don-hang", method = RequestMethod.GET)	
	public ModelAndView goToCart( HttpServletRequest request){
		
		if( request.getSession().getAttribute("loggedInCustomer") != null ){
		
			// Get transaction
			TransactionDTO transaction = (TransactionDTO) request.getSession().getAttribute("transaction");
			List<OrderDTO> orders = new ArrayList<OrderDTO>();
			if( transaction != null ){
				orders = orderService.getByTransactionId(transaction.getId());
			}
			
			ModelAndView model = new ModelAndView("fro_cart");
			model.addObject("transaction", transaction);
			model.addObject("orders", orders);
			model.addObject("countOrders", orders.size());
			return model;
			
		}else{
			ModelAndView model = new ModelAndView("redirect:dang-nhap");
			return model;
		}
		
	}
	
	@RequestMapping(value = "/transaction", method = RequestMethod.GET)
	@ResponseStatus(HttpStatus.OK)
	public @ResponseBody TransactionDTO getTransaction(
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {		
		// Get transaction
		TransactionDTO transaction = (TransactionDTO) request.getSession().getAttribute("transaction");
		/*List<OrderDTO> orders = new ArrayList<OrderDTO>();
		if( transaction != null ){
			orders = orderService.getByTransactionId(transaction.getId());
			transaction.setOrders(orders);
		}*/
		return transaction;
	}
	
	@RequestMapping(value = "/saveCart", method = RequestMethod.POST)
	public @ResponseBody TransactionDTO saveCart(HttpServletRequest request,
			@RequestBody TransactionDTO transactionDTO) {
		transactionDTO = transactionService.saveTransaction(transactionDTO);
		request.getSession().removeAttribute("transaction");
		return transactionDTO;
	}
	
	@RequestMapping(value = "/addToCart", method = RequestMethod.POST)	
	public String addToCart( HttpServletRequest request, 
			@RequestParam("productId") int productId, 
			@RequestParam("qty") Integer qty,
			@RequestParam("price") Double price,
			@RequestParam("priceType") String priceType){
		
		// Get customer logged in
		CustomerDTO customer = (CustomerDTO) request.getSession().getAttribute("loggedInCustomer");
		if(customer == null){
			request.getSession().setAttribute("productId", productId);
			return "redirect:dang-nhap.html";
		}
		
		// Get Product to order
		ProductDTO product = productService.getById(productId);
		
		// Get transaction
		TransactionDTO transaction = (TransactionDTO) request.getSession().getAttribute("transaction");
		if( transaction == null ){
			transaction = new TransactionDTO();

			transaction.setCustomer(customer);
			
			// Default info for user order
			transaction.setCustomerName(customer.getName());
			transaction.setCustomerEmail(customer.getEmail());
			transaction.setCustomerPhone(customer.getPhone());
			transaction.setCustomerAddress(customer.getAddress());
			
			//
			transaction.setPaymentMethod(TransactionPaymentMethodEnum.DELIVERY_CASH.name());
			transaction.setStatus(false);
			request.getSession().setAttribute("transaction", transaction);
			
		}
		
		if(transaction.getOrderedProductIds().contains(productId)){
			
			boolean existedProductWithPrice = false;
			for( OrderDTO order : transaction.getOrders() ){
				if( order.getProduct().getId().intValue() == productId ){
					
					if(order.getPriceType() != null 
							&& order.getPriceType().equals(priceType)){
						existedProductWithPrice = true;
					}
				}
				if(existedProductWithPrice){
					break;
				}
			}
			if(!existedProductWithPrice){
				OrderDTO order = new OrderDTO();
				order.setProduct(product);
				order.setPrice(price);
				order.setPriceType(priceType);
				if(qty != null){
					order.setQty(qty.intValue());
				}else{
					order.setQty(1);
				}
				order.setStatus(false);
				transaction.getOrders().add(order);
				transaction.getOrderedProductIds().add(productId);
				order.setData("data");
			}
			
		}else{
			// Order
			OrderDTO order = new OrderDTO();
			order.setProduct(product);
			order.setPrice(price);
			order.setPriceType(priceType);
			if(qty != null){
				order.setQty(qty.intValue());
			}else{
				order.setQty(1);
			}
			order.setStatus(false);
			//order = orderService.saveOrder(order);
			transaction.getOrders().add(order);
			transaction.getOrderedProductIds().add(productId);
			order.setData("data");
		}
		
		return "redirect:don-hang.html";
	}
	
	@RequestMapping(value = "/cancelFromCart", method = RequestMethod.POST)	
	public @ResponseBody OrderDTO cancelFromCart( HttpServletRequest request, @RequestParam("productId") int productId ){
		TransactionDTO transaction = (TransactionDTO) request.getSession().getAttribute("transaction");
		List<OrderDTO> orders = orderService.getByTransactionId(transaction.getId());
		OrderDTO order = null;
		for( OrderDTO o : orders ){
			if( o.getProduct().getId() == productId ){
				order = orderService.deleteById(o.getId());
				transaction.getOrders().remove(order);
			}
		}
		return order;
	}
	
	@RequestMapping(value = "/deleteOrder/{orderId}", method = RequestMethod.POST)	
	public @ResponseBody OrderDTO deleteOrder( HttpServletRequest request, @PathVariable("orderId") Integer orderId ){
		if(orderId != null){
			TransactionDTO transaction = (TransactionDTO) request.getSession().getAttribute("transaction");
			OrderDTO order = orderService.deleteById(orderId);
			transaction.getOrders().remove(order);
			return order;
		}else{
			return null;
		}
	}

}
