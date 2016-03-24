<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
.hovers{
margin-top: -10px;}
</style>
<jsp:include page="image_slide_fragment.jsp"></jsp:include>
<div id="content" class="">
	<div class="container background-white bottom-border">
<div class="row margin-vert-20">
   <c:forEach items="${ bestCatalogs }" var="bestCatalog"
      varStatus="loop">
      
      <div class="col-xs-3 no-margin no-padding"><a href="${ bestCatalog.link }"><img 
            src="${dataDomain}${ bestCatalog.imageLink.url }" class="top_best_catalog"/></a>
            

            </div>
   </c:forEach>
 
</div>
<div class="row">
                        <!-- Main Column -->
          
                        <div class="col-xs-9">
                        	<jsp:include page="news_products_fragment.jsp"></jsp:include>
                        	<jsp:include page="discount_products_fragment.jsp"></jsp:include>
                        	<jsp:include page="bestseller_products_fragment.jsp"></jsp:include>
                        </div>
                         <div class="col-xs-3 margin-vert-10" >
								<!-- Recent Posts -->
								<div class="blog-background" style="border: 1px solid rgb(221, 243, 254);padding-bottom: 55px" >
									<div class=" blog-main-title" style="background: rgb(221, 243, 254);padding: 10px 0px 1px 0px">
										<h2 class="text-center text-primary">Bài viết mới</h2>
									</div>
									<c:forEach items="${ recentBlogs }" var="blog">
									<div class="blog-content" style="padding:0px 20px 10px 20px;clear: both">
										<h4 class="blog-title" style="color: #000"><strong> ${blog.title } </strong></h4>
										<div class="blog-image"><img src="${dataDomain}${ blog.image.url }" ></div>
										<div class="blog-sumary">${blog.shortContent }</div>
										<div class="blog-link pull-right" style="color:#000"><a href="${cp}/bai-viet-${blog.friendURL}" >>> Xem tiếp</a></div>
									</div>
									</c:forEach>
									<%-- <ul class="posts-list margin-top-10">
										<c:forEach items="${ recentBlogs }" var="blog">
											<li>
												<div class="recent-post">
													<a href="${cp}/bai-viet-${blog.friendURL}"> <img
														class="pull-left" src="${dataDomain}${ blog.image.url }"
														style="width: 54px; height: 54px">
													</a> <a href="${cp}/bai-viet-${blog.friendURL}"
														class="posts-list-title">${ blog.title }</a> <br> 
												</div>
												<div class="clearfix"></div>
											</li>
										</c:forEach>
									</ul> --%>
								</div>
								<!-- End recent Posts -->
				
                        </div>
</div>
<jsp:include page="partner_fragment.jsp"></jsp:include>                        
	</div>

<!-- 	<div class="container background-grey hidden-xs hidden-sm visible-md visible-lg">
		<div class="row padding-vert-20">
			Icons
			<div class="col-md-3 text-center">
				<i class="flaticon-transport32 glyph-icon-fa-4x"></i>
				<h2 class="padding-top-10 text-color-success">Miễn phí giao hoa</h2>
				<p>Đến trung tâm 63 tỉnh thành</p>
			</div>
			<div class="col-md-3 text-center">
				<i class="flaticon-present23 glyph-icon-fa-4x"></i>
				<h2 class="padding-top-10 text-color-success">Quà Tặng Miễn Phí</h2>
				<p>Quà tặng miễn phí ...</p>
			</div>
			<div class="col-md-3 text-center">
				<i class="flaticon-business2 glyph-icon-fa-4x"></i>
				<h2 class="padding-top-10 text-color-success">Dịch vụ giao hoa
					VIP</h2>
				<p>Xe ôtô,NV mặc trang phụ theo yêu cầu</p>
			</div>
			<div class="col-md-3 text-center">
				<i class="flaticon-man293 glyph-icon-fa-4x"></i>
				<h2 class="padding-top-10 text-color-success">Thông báo người
					nhận</h2>
				<p>Bằng hình ảnh sản phẩm...</p>
			</div>
			End Icons
		</div>
	</div>
 -->


	<%-- <div class="container sandpapaer-backround bottom-border border_left_10">
		<jsp:include page="discount_products_fragment.jsp"></jsp:include>
	</div>
	<div class="container sandpapaer-backround bottom-border border_left_10">
		<jsp:include page="bestseller_products_fragment.jsp"></jsp:include>
	</div>
	<jsp:include page="partner_fragment.jsp"></jsp:include>
 --%>
</div>

