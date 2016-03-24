<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="content" class="border_left_10">
	<div class="container background-white bottom-border ">
       <div class="row no-margin">
         <div class="col-xs-12 margin-vert-10" style="background: rgb(221, 243, 254);padding: 10px 0px 1px 0px;">
            <h2 class="text-center text-primary">Danh sách sản phẩm</h2>
         </div>
      </div>
       
		<div class="row margin-vert-10">


			<div class="col-md-12">

				<c:if test="${ catalogSelected != null }">
					<h2>${ catalogSelected.name }</h2>
				</c:if>
				<c:if test="${ catalogSelected == null }">
					Tấc cả sản phẩm
				</c:if>

				<!-- Filter Buttons -->
				<div style="    position: absolute;
    right: 20;
    top: 0;">

					<div class="btn-group">
                      <button type="button" class="btn btn-primary btn-flat">Từ khóa</button>
                      <button type="button" class="btn btn-primary btn-flat dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="height: 32px">
                        <span class="caret"></span>
                        <span class="sr-only">Toggle Dropdown</span>
                      </button>
                      <ul class="dropdown-menu filter-selecter dropdown-menu-right" role="menu">
                       <li><a href="#" price-filter="1">Giá tăng dần</a>
						</li>
						<li><a href="#" price-filter="0">Giá giảm dần</a>
						</li>
						<li><a href="#" price-filter="100000">&gt;100.000 VND</a>
						</li>
						<li><a href="#" price-filter="150000">&gt;150.000 VND</a>
						</li>
						<li><a href="#" price-filter="200000">&gt;200.000 VND</a>
						</li>
						<li><a href="#" price-filter="250000">&gt;250.000 VND</a>
						</li>
						<li><a href="#" price-filter="300000">&gt;300.000 VND</a>
						</li>
						<li><a href="#" price-filter="350000">&gt;350.000 VND</a>
						</li>
						<li><a href="#" price-filter="400000">&gt;400.000 VND</a>
						</li>
                      </ul>
                    </div>
                    
				</div>
				<script type="text/javascript">
                	$("a[price-filter]").click(function(){
                		<c:choose>
    					
							<%-- Filter product by catalog --%>
							<c:when test="${catalogSelected != null}">
							window.location.href="${cp}/san-pham-${catalogSelected.friendURL}/" +$(this).attr('price-filter') + "/1.html";
							</c:when>
							
							<%-- Search product by searchText --%>
							<c:when test="${searchText != null}">
								window.location.href="${cp}/tim-kiem-san-pham-${searchText}/" +$(this).attr('price-filter') + "/1.html";
							</c:when>
							
							<%-- Only view products --%>
							<c:otherwise>
								window.location.href="${cp}/san-pham/" +$(this).attr('price-filter') + "/1.html";
							</c:otherwise>
						</c:choose>

                	});
                </script>
				<!-- End Filter Buttons -->
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 portfolio-group no-padding">
                  <c:forEach items="${ products }" var="product">
                     <div class="col-xs-2">
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

			<div class="clearfix"></div>

			<%-- Pagging --%>
			<div class="text-center">
				<ul class="pagination ">

					<c:if test="${ page > 1 }">
						<li><a
							href="${ cp }/${currentURL}/1.html">&laquo;</a></li>
					</c:if>

					<c:forEach var="i" begin="1" end="${ totalPage }">
						<li class='<c:if test="${ i == page }">active</c:if>'><a
							href="${ cp }/${currentURL}/${ i }.html">${ i }</a>
						</li>
					</c:forEach>

					<c:if test="${ page < totalPage }">
						<li><a
							href="${ cp }/${currentURL}/${ totalPage }.html">&raquo;</a></li>
					</c:if>

				</ul>
			</div>
		</div>
	</div>
</div>