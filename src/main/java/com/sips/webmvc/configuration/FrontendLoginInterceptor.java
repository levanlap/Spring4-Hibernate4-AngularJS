package com.sips.webmvc.configuration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class FrontendLoginInterceptor extends HandlerInterceptorAdapter {

	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
/*
		if (!request.getRequestURI().contains("bac_")
				&& !request.getRequestURI().contains("admin")
				&& !request.getRequestURI().contains("dang-nhap1")
				&& !request.getRequestURI().contains("checkLogin")
				&& request.getSession().getAttribute("loggedInCustomer") == null) {
			response.sendRedirect("dang-nhap1.html");
			return false;
		}*/

		return true;
	}

}
