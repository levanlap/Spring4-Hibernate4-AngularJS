<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="content">
   <div class="container background-white bottom-border">
      <div class="row no-margin">
         <div class="col-xs-12 margin-vert-10" style="background: rgb(221, 243, 254);padding: 10px 0px 1px 0px;">
            <h2 class="text-center text-primary">Chi tiết sản phẩm</h2>
         </div>
      </div>
      <div class="row">
         <div
            style="text-align: left; margin: 10px 0px 10px 0px"
            class="col-xs-12">
            <a href="/tuvanhoatuoi/"><i class="glyph-icon-20 flaticon-home9"></i> Trang chủ</a> / <a href="${ cp }/san-pham.html"><i
               class="glyph-icon-20 flaticon-flower80"></i> Sản phẩm</a>
            <c:if test="${ catalogSelected != null && catalogSelected.parent != null }">
               <a href="${ cp }/san-pham-${ catalogSelected.parent.friendURL }.html"><i class="glyph-icon-20 flaticon-flower80"></i> ${ catalogSelected.parent.name }</a>
            </c:if>
            <c:if test="${ catalogSelected != null }">
               <a href="${ cp }/san-pham-${ catalogSelected.friendURL }.html"><i class="glyph-icon-20 flaticon-flower80"></i> ${ catalogSelected.name }</a>
            </c:if>
            / ${ product.name }
         </div>
      </div>


		<div class="row margin-vert-20">
			<div class="col-xs-12">
				<!-- Main Content -->
				<div class="row">
					<div class="col-md-4">
						<img src="${dataDomain}${ product.imageLink.url }" alt="image_detail_product" style="box-shadow: 0 0 2px rgba(0, 0, 0, 0.1);
    margin-left: 20px;"/>
					</div>

					<div class="col-md-8 margin-bottom-10">
						<div class="row">
                           <div class="col-xs-5">
                              <h2 class="text-primary">${ product.name }</h2>
                              <p class="text-primary no-margin">Mã sản phẩm : SNM - 193</p>
                              <p class="text-primary">450,000 VND</p>
                             
                           </div>
                            <div class="col-xs-7" style="border: 3px solid rgb(221, 243, 254);
    padding: 10px;margin-left: -20px">
                            <c:if test="${ product.orderNote !=null }">
                               <em>${ product.orderNote }</em>
                                 </c:if>
                           </div>
                            <div class="col-xs-12">
                              <p class="text-primary no-margin">Chọn kích cỡ</p>
                              <div >
                                 <c:if test="${ (product.largePrice != null && product.largePrice != 0) || (product.discountLargePrice != null && product.discountLargePrice != 0) }">
                                    <label class="radio-inline text-primary">
                                      <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> Lớn hơn 
                                      <c:if test="${ product.discountLargePrice != null && product.discountLargePrice != 0}">
                                         <%--  <span style="text-decoration: line-through;"> <fmt:formatNumber
                                    type="number" groupingUsed="true" value="${product.largePrice}" /> VND
                                    </span> --%>
                                       </c:if>
                                       <c:if test="${ product.discountLargePrice == null || product.discountLargePrice == 0}">
                                          <fmt:formatNumber type="number" groupingUsed="true"
                                             value="${product.largePrice}" /> VND
                                       </c:if> 
                                       <c:if test="${ product.discountLargePrice != null && product.discountLargePrice != 0}">
                                           <fmt:formatNumber
                                                type="number" groupingUsed="true" value="${product.discountLargePrice}" /> VND
                                          
                                       </c:if>
                                    </label>
                                    </c:if>
                                    
                                    
                                    <c:if test="${ (product.mediumPrice != null && product.mediumPrice != 0) || (product.discountMediumPrice != null && product.discountMediumPrice != 0) }">
                                    <label class="radio-inline text-primary">
                                      <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> Như hình
                                      <c:if test="${ product.discountMediumPrice != null && product.discountMediumPrice != 0}">
                                        <%--   <span style="text-decoration: line-through;"> <fmt:formatNumber
                                    type="number" groupingUsed="true" value="${product.mediumPrice}" /> VND
                                    </span> --%>
                                       </c:if>
                                       <c:if test="${ product.discountMediumPrice == null || product.discountMediumPrice == 0}">
                                          <fmt:formatNumber type="number" groupingUsed="true"
                                             value="${product.mediumPrice}" /> VND
                                       </c:if> 
                                       <c:if test="${ product.discountMediumPrice != null && product.discountMediumPrice != 0}">
                                           <fmt:formatNumber
                                                type="number" groupingUsed="true" value="${product.discountMediumPrice}" /> VND
                                          
                                       </c:if>
                                    </label>
                                    </c:if>
                                    
                                    
                                    <c:if test="${ (product.smallPrice != null && product.smallPrice != 0) || (product.discountSmallPrice != null && product.discountSmallPrice != 0) }">
                                    <label class="radio-inline text-primary">
                                      <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> Nhỏ hơn 
                                      <c:if test="${ product.discountSmallPrice != null && product.discountSmallPrice != 0}">
                                          <%-- <span style="text-decoration: line-through;"> <fmt:formatNumber
												type="number" groupingUsed="true" value="${product.smallPrice}" /> VND
										  </span> --%>
                                       </c:if>
                                       <c:if test="${ product.discountSmallPrice == null || product.discountSmallPrice == 0}">
                                          <fmt:formatNumber type="number" groupingUsed="true"
                                             value="${product.smallPrice}" /> VND
                                       </c:if> 
                                       <c:if test="${ product.discountSmallPrice != null && product.discountSmallPrice != 0}">
                                           <fmt:formatNumber
                                                type="number" groupingUsed="true" value="${product.discountSmallPrice}" /> VND
                                          
                                       </c:if>
                                    </label>
                                    </c:if>
                              </div>
                           </div>
                           <c:if test="${ product.detailNote !=null }">
                           <div class="col-xs-12 margin-top-10">${ product.detailNote }</div>
                           </c:if>
                           
                           <div class="col-xs-7">
                              <h4 class=" text-primary">QUÀ TẶNG KHUYẾN MÃI KÈM THEO</h4>
                              <div style="border: 3px solid rgb(221, 243, 254);
    padding: 10px;margin-right: -60px">
                              <img alt="" src="http://localhost/tuvanhoatuoi/khuyen-mai/i-love-you-400.jpg" width="80px">
                             </div>
                           </div>
                           <div class="col-xs-5 text-center margin-top-60">
                             <p>Mua qua điện thoại</p>
                             <p class="no-margin">HCM : 01212233243</p>
                             <p class="no-margin">Hà nội : 01212233243</p>
                           </div>
                           <div class="col-xs-7 margin-vert-20">
                               <a class="btn btn-lg" style="    color: #fff;
    background-color: #39b3d7;
    border-color: #269abc;" href="http://dotstrap.com/">
                      <i class="glyphicon glyphicon-shopping-cart pull-left"></i><span>Mua thường<br><small>Đặt hàng thông qua website</small></span></a>
                           </div>
                            <div class="col-xs-5 margin-vert-20">
                          <a class="btn btn-lg" style="color: #fff;
    background-color: #3276b1;
    border-color: #285e8e;margin-left: 40px !important" href="#">
                      <i class="glyphicon glyphicon-phone-alt pull-left"></i><span>Mua nhanh<br><small>Gọi trực tiếp đến của hàng</small></span></a>
                           </div>
                        </div>

					</div>
				</div>

				<!-- End Main Content -->
			</div>

			
			<!-- Main Column -->
			<div class="row no-margin padding-horiz-20">
				<div class="col-xs-12">
					<div class="row animate fadeInUpBig animated">
					
						<div class="tabs alternative">
                <ul class="nav nav-tabs">
                  <li class="active"><a href="#tab_1" data-toggle="tab" aria-expanded="false">Chi
										tiết</a></li>
                  <li class=""><a href="#tab_2" data-toggle="tab" aria-expanded="false">Hướng dẫn
										thanh toán</a></li>
                  <li class=""><a href="#tab_3" data-toggle="tab" aria-expanded="true">Điều khoản mua hàng</a></li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="tab_1">
						<div class="row">
							<div class="col-md-12">
								<p>${ product.content }</p>
							</div>
						</div>

						<div class="row">
							<h2 class="text-center text-primary">Sản phẩm tương tự</h2>
							<hr />
							<div class="col-md-12 portfolio-group no-padding">
								<c:forEach items="${ relativeProducts }" var="product">
									<div class="col-xs-6 col-md-2">
										<div class="product_item">
											<div class="bw pic">
												<a href="${ cp }/chi-tiet-san-pham-${product.friendURL}.html">
													<img
													src="${dataDomain}${product.imageLink.url}">
												</a>
											</div>
											<c:if test="${ product.status =='NEW'}">
												<i class="flaticon-new45"></i>
											</c:if>
											<c:if test="${ product.status =='SALE'}">
												<i class="flaticon-sale22"></i>
											</c:if>
											<div class="backround">
												<p class="name">${ product.name }</p>
												<p class="price">${product.mediumPrice}</p>
												<button type="button" class="btn btn-success">
													<span class="glyph-icon-20 flaticon-shopping100"></span>
													Mua Ngay
												</button>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<div class="clearfix"></div>
						</div>
					</div><!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_2">
                   <div class="row">
                                                    <div class="col-md-12">
                                                    	${contentPayMethod }
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                  </div><!-- /.tab-pane -->
                  <div class="tab-pane" id="tab_3">
                    <div class="row">
                                                    <div class="col-md-12">
                                                    	${contentConditionBuy }
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                  </div><!-- /.tab-pane -->
                </div><!-- /.tab-content -->
              </div>
					</div>

				</div>

			</div>
			<!-- End Main Column -->
		</div>
	</div>
</div>


<script>
	$(function(){
		<c:if test="${ (product.smallPrice != null && product.smallPrice != 0) || (product.discountSmallPrice != null && product.discountSmallPrice != 0) }">
		$("#addToCart1").click(function(){
			<c:if test="${ product.discountSmallPrice != null && product.discountSmallPrice != 0}">
				addToCart(${product.discountSmallPrice}, 'DISCOUNT_SMALL_PRICE');
			</c:if> 
			<c:if test="${ product.discountSmallPrice == null || product.discountSmallPrice == 0 }">
			addToCart(${product.smallPrice}, 'DISCOUNT_SMALL');
			</c:if>
		});
		</c:if>
		
		<c:if test="${ (product.mediumPrice != null && product.mediumPrice != 0) || (product.discountMediumPrice != null && product.discountMediumPrice != 0) }">
		$("#addToCart2").click(function(){
			<c:if test="${ product.discountMediumPrice != null && product.discountMediumPrice != 0 }">
				addToCart(${product.discountMediumPrice}, 'DISCOUNT_MEDIUM_PRICE');
			</c:if> 
			<c:if test="${ product.discountMediumPrice == null || product.discountMediumPrice == 0 }">
			addToCart(${product.mediumPrice}, 'MEDIUM_PRICE');
			</c:if>
		});
		</c:if>
		
		<c:if test="${ (product.largePrice != null && product.largePrice != 0) || (product.discountLargePrice != null && product.discountLargePrice != 0) }">
		$("#addToCart3").click(function(){
			<c:if test="${ product.discountLargePrice != null && product.discountLargePrice != 0 }">
				addToCart(${product.discountLargePrice}, 'DISCOUNT_LARGE_PRICE');
			</c:if> 
			<c:if test="${ product.discountLargePrice == null || product.discountLargePrice == 0 }">
			addToCart(${product.largePrice}, 'LARGE_PRICE');
			</c:if>
		});
		</c:if>
	});
	function addToCart(price, priceType){
		var postFormStr = "<form method='POST' action='${cp}/addToCart'>\n";
		postFormStr += "<input type='hidden' name='productId' value='${ product.id }'></input>";
		postFormStr += "<input type='hidden' name='qty' value='1'></input>";
		postFormStr += "<input type='hidden' name='price' value='"+price+"'></input>";
		postFormStr += "<input type='hidden' name='priceType' value='"+priceType+"'></input>";
	    postFormStr += "</form>";
	    var formElement = $(postFormStr);
	    $('body').append(formElement);
	    $(formElement).submit();
	}
</script>

