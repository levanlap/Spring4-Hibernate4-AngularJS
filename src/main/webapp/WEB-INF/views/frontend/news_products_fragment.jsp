<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!-- <div class="container bottom-border border_left_10"> -->

	<div class="margin-vert-10" style="background: rgb(221, 243, 254);padding: 10px 0px 1px 0px">
			<h2 class="text-center text-primary">Sản phẩm mới</h2>
	</div>
	
	<div class="row">
		<c:forEach items="${ newProducts }" var="product">
			<div class="col-xs-3">
				<div class="product_item">
					<div class="backround text-center">
							<p class="name">${ product.name }</p>
					</div>
					<div class="image-product">
						<a href="${ cp }/chi-tiet-san-pham-${product.friendURL}.html">
							<img
							src="${dataDomain}${product.imageLink.url}">
						</a>
					</div>
					<div class="backround">
						<p class="price">${product.mediumPrice} VND</p>
						<a type="button" class=" button">
							<span class="glyph-icon-20 flaticon-shopping100 visible-xs"></span>
							<span class="glyph-icon-20 flaticon-shopping100 visible-sm visible-md visible-lg">Mua Ngay</span>
						</a>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<br>
<!-- </div> -->
