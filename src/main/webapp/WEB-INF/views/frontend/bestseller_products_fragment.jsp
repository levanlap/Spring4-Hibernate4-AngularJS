<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div style="background: rgb(221, 243, 254);padding: 10px 0px 1px 0px;height: 45px">
			<span  id="prev_bestseller_product" class="flaticon-rewind44" style="width: 10%;float: left;margin-left: 5px"></span> 
			<h2 class="text-center text-primary" style="width: 80%;float: left">Bán chạy</h2>
			<span id="next_bestseller_product" class="flaticon-fast44" style="float: right;margin-right: 5px"></span> 
</div>
<div class="row" style="margin-right: -50px;margin-left: -30px">
			<div class="col-md-12 margin-vert-10">
	<div id="bestseller-product" class="owl-carousel owl-theme " >
			<c:forEach items="${ bestSellerProducts }" var="product">
			<div class="item">
				<div class="product_item">
					<div class="backround text-center">
							<p class="name">${ product.name }</p>
					</div>
					<div  class="image-product">
						<a href="${ cp }/chi-tiet-san-pham-${product.friendURL}.html">
							<img
							src="${dataDomain}${product.imageLink.url}">
						</a>
					</div>
					<div class="backround">
						<p class="price">${product.mediumPrice} VND</p>
						<a type="button" class=" button">
							<span class="glyph-icon-20 flaticon-shopping100">Mua Ngay</span>
						</a>
					</div>
				</div>
			</div>
			</c:forEach>
			<c:forEach items="${ discountProducts }" var="product">
			<div class="item">
				<div class="product_item">
					<div class="product_item">
					<div class="backround text-center">
							<p class="name">${ product.name }</p>
					</div>
					<div  class="image-product">
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
			</div>
		</c:forEach>

	</div>
</div>
</div>

<script type="text/javascript">
		$(document).ready(function() {
			var owl = $("#bestseller-product");
			  owl.owlCarousel({
				  pagination: false,
				  dots: false,
			      items : 4, //10 items above 1000px browser width
			      itemsDesktop : [1000,4], //5 items between 1000px and 901px
			      itemsDesktopSmall : [900,4], // betweem 900px and 601px
			      itemsTablet: [600,4], //2 items between 600 and 0
			      itemsMobile : false // itemsMobile disabled - inherit from itemsTablet option
			  });
			  // Custom Navigation Events
			  $("#next_bestseller_product").click(function(){
			    owl.trigger('owl.next');
			  })
			  $("#prev_bestseller_product").click(function(){
			    owl.trigger('owl.prev');
			  })
		});
	</script>
