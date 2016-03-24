<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col-md-3 portfolio-item margin-bottom-40 code">
	<div class="thumbnail">
		<a href="#">
			<figure class="animate slideInLeft">
				<img src="${dataDomain}${product.imageLink.url}" alt="image2"
					width="200px" height="200px">
			</figure>
		</a>
		<div class="caption">
			<h4>${ product.name }</h4>
			<p style="color: red">${ product.mediumPrice }đ</p>
		</div>
	</div>
</div>
