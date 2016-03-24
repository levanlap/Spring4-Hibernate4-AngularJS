package com.sips.webmvc.controller.frontend;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sips.webmvc.dto.customer.CustomerDTO;
import com.sips.webmvc.dto.product.ProductDTO;

@Controller
public class LoginController extends CommonFrontendController{
	
	public static boolean OPEN_FRONT_END = false;
	
    @ModelAttribute
    public Model buildMenu(Model model) {
    	
    	super.buildMenu(model);
    	
		return model;		
    }
    

	@RequestMapping(value = "/dang-nhap", method = RequestMethod.GET)
	public ModelAndView login(HttpServletRequest request)
			throws Exception {		
		ModelAndView model = new ModelAndView("fro_login");
		return model;
	}
	
	@RequestMapping(value = "/dang-nhap1", method = RequestMethod.GET)
	public ModelAndView login1(HttpServletRequest request)
			throws Exception {		
		ModelAndView model = new ModelAndView("fro_login1");
		return model;
	}
	
	@RequestMapping(value = "/dang-ky", method = RequestMethod.GET)
	public ModelAndView signUp(HttpServletRequest request)
			throws Exception {		
		ModelAndView model = new ModelAndView("fro_sign_up");
		return model;
	}
	
	@RequestMapping(value = "/checkLogin", method = RequestMethod.POST)
	public String checkLogin(HttpServletRequest request, HttpServletResponse response){
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		CustomerDTO customer = customerService.getByEmail(email);
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		if( customer != null  && passwordEncoder.matches(password, customer.getPassword())){
			request.getSession().setAttribute("loggedInCustomer", customer);
			if(request.getSession().getAttribute("productId") != null){
				try{
					int productId = Integer.parseInt(request.getSession().getAttribute("productId").toString());
					request.getSession().removeAttribute("productId");
					ProductDTO product = productService.getById(productId);
					return "redirect:chi-tiet-san-pham-"+product.getFriendURL()+".html";
				}catch(Exception exc){
					exc.printStackTrace();
				}
			}
			return "redirect:index.html";
		}
		request.getSession().setAttribute("errorLogin", getMessage("customer.loginErrror"));
		return "redirect:dang-nhap.html";
	}
	
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String register(HttpServletRequest request){	
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirmPassword = request.getParameter("confirmPassword");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String term = request.getParameter("term");
		
		String errorRegister = "";
		if( name == null || name.trim().isEmpty() ){
			errorRegister = getMessage("customer.register.name.required");
		}
		else if( email == null || email.trim().isEmpty() ){
			errorRegister = getMessage("customer.register.email.required");
		}
		else if( password == null || password.trim().isEmpty() ){
			errorRegister = getMessage("customer.register.password.required");
		}
		else if( confirmPassword == null || confirmPassword.trim().isEmpty() ){
			errorRegister = getMessage("customer.register.confirm.password.required");
		}
		else if( !password.trim().equals(confirmPassword.trim()) ){
			errorRegister = getMessage("customer.register.password.not.the.same.confirm.password");
		}
		else if( phone == null || phone.trim().isEmpty() ){
			errorRegister = getMessage("customer.register.phone.required");
		}
		else if( address == null || address.trim().isEmpty() ){
			errorRegister = getMessage("customer.register.address.required");
		}
		else if( term == null || term.trim().isEmpty() ){
			errorRegister = getMessage("customer.register.term.required");
		}
		else if( customerService.getByEmail(email) != null ){
			errorRegister = getMessage("customer.register.existed.email");
		}
		else{
			
			BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
			String hashedPassword = passwordEncoder.encode(password);
		
			CustomerDTO customer = new CustomerDTO();
			customer.setName(name);
			customer.setEmail(email);
			customer.setPassword(hashedPassword);
			customer.setPhone(phone);
			customer.setAddress(address);
			customer.setStatus(1);
			customer = customerService.saveCustomer(customer);
			
			if( customer.getId() != null ){
				request.getSession().setAttribute("loggedInCustomer", customer);
				return "redirect:index.html";
			}
		
		}
		request.getSession().setAttribute("errorRegister", errorRegister);
		return "redirect:dang-ky.html";
	}
	
	@RequestMapping(value = "/dang-xuat", method = RequestMethod.GET)
	public String logout(HttpServletRequest request){
		
		Enumeration<String> keys = request.getSession().getAttributeNames();
		while(keys.hasMoreElements()){
			request.getSession().removeAttribute(keys.nextElement());
		}
		
		return "redirect:index.html";
	}
	
	@RequestMapping(value = "/thong-tin-tai-khoan", method = RequestMethod.GET)
	public String goToAccountInfo(HttpServletRequest request){
		
		// Get customer logged in
		CustomerDTO customer = (CustomerDTO) request.getSession().getAttribute("loggedInCustomer");
		if(customer == null){
			return "redirect:dang-nhap.html";
		}
		
		return "fro_account_info";
	}
	
	@RequestMapping(value = "/updateAccountInfo", method = RequestMethod.POST)
	public String updateAccountInfo(HttpServletRequest request){	
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		
		String errorRegister = "";
		if( name == null || name.trim().isEmpty() ){
			errorRegister = getMessage("customer.register.name.required");
		}
		else if( phone == null || phone.trim().isEmpty() ){
			errorRegister = getMessage("customer.register.phone.required");
		}
		else if( address == null || address.trim().isEmpty() ){
			errorRegister = getMessage("customer.register.address.required");
		}
		else{
			
			// Get customer logged in
			CustomerDTO customer = (CustomerDTO) request.getSession().getAttribute("loggedInCustomer");
			customer.setName(name);
			customer.setPhone(phone);
			customer.setAddress(address);
			customer = customerService.saveCustomer(customer);
			
			request.getSession().setAttribute("loggedInCustomer", customer);
			request.getSession().setAttribute("success", getMessage("customer.update.info.success"));
			return "redirect:thong-tin-tai-khoan.html";
		
		}
		request.getSession().setAttribute("error", errorRegister);
		return "redirect:thong-tin-tai-khoan.html";
	}
	
	@RequestMapping(value = "/thay-doi-mat-khau", method = RequestMethod.GET)
	public String goToChangePassword(HttpServletRequest request){
		
		// Get customer logged in
		CustomerDTO customer = (CustomerDTO) request.getSession().getAttribute("loggedInCustomer");
		if(customer == null){
			return "redirect:dang-nhap.html";
		}
		
		return "fro_change_password";
	}
	
	@RequestMapping(value = "/changePassword", method = RequestMethod.POST)
	public String changePassword(HttpServletRequest request){
		
		// Get customer logged in
		CustomerDTO customer = (CustomerDTO) request.getSession().getAttribute("loggedInCustomer");
		if(customer == null){
			return "redirect:dang-nhap.html";
		}
		
		String oldpassword = request.getParameter("oldpassword");
		String newpassword = request.getParameter("newpassword");
		String confirmnewpassword = request.getParameter("confirmnewpassword");
		
		String errorRegister = "";
		if( oldpassword == null || oldpassword.trim().isEmpty() ){
			errorRegister = getMessage("customer.change.password.oldpassword.required");
		}
		else if( newpassword == null || newpassword.trim().isEmpty() ){
			errorRegister = getMessage("customer.change.password.newpassword.required");
		}
		else if( confirmnewpassword == null || confirmnewpassword.trim().isEmpty() ){
			errorRegister = getMessage("customer.change.password.confirm.password.required");
		}
		else if( !newpassword.trim().equals(confirmnewpassword.trim()) ){
			errorRegister = getMessage("customer.change.password.newpassword.not.the.same.confirm.password");
		}
		else if( oldpassword.trim().equals(newpassword.trim())){
			errorRegister = getMessage("customer.change.password.oldpassword.the.same.newpassword");
		}
		else if( !oldpassword.trim().equals(customer.getPassword()) ){
			errorRegister = getMessage("customer.change.password.oldpassword.not.existed");
		}
		else{
			
			customer.setPassword(newpassword);
			customer = customerService.saveCustomer(customer);
			
			request.getSession().setAttribute("loggedInCustomer", customer);
			request.getSession().setAttribute("success", getMessage("customer.change.password.success"));
			return "redirect:thay-doi-mat-khau.html";
		
		}
		request.getSession().setAttribute("error", errorRegister);
		return "redirect:thay-doi-mat-khau.html";
		
	}
	
	
}
