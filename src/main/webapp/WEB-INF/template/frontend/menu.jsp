<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<nav class="navbar navbar-default" id="menu_bar_fix" role="navigation" >
            <div id="greenmenu" style="">
                <ul class="nav navbar-nav" >

					<c:forEach items="${ catalogs }" var="catalog" varStatus="loop">
						<li class="dropdown"><a href="#" data-toggle="dropdown" class="dropdown-toggle"><span>${ catalog.name }</span> <span style="margin-left: 5px" class="glyph-icon-10 flaticon-chevron2"></span> </a>
							 <ul class="dropdown-menu" role="menu">
							 <c:forEach items="${ catalog.children }" var="catalogChildren">
									<li>
										<a href="${ cp }/san-pham-${ catalogChildren.friendURL }.html">
											<span class="glyph-icon-10 flaticon-flowerpetals"></span> ${ catalogChildren.name }
										</a>
									</li>
								</c:forEach>
	                        </ul><!-- end dropdown-menu -->
						</li>
						</c:forEach>
						</ul>
						
 						<ul class="navbar-right nav navbar-nav">
 						<c:if test="${sessionScope.loggedInCustomer == null}">
					<li  class="dropdown" style="padding-top: 8px;">
						<span class="flaticon-office-worker2 glyph-icon-20" style="margin-right: 5px;color: #fff;font-size: 54px;"></span>
						<span style="color: #fff;cursor: pointer;" data-toggle="modal" data-target="#login-overlay">Đăng nhập</span>
							<ul class="dropdown-menu ">
							<li><jsp:include page="include/form_register.jsp"></jsp:include>
							</li>
						</ul>
							</li>
				</c:if>
				<c:if test="${sessionScope.loggedInCustomer != null}">
							<li style="padding-top: 8px;"><span class="flaticon-office-worker2 glyph-icon-20" style="margin-right: 5px;
    /* padding-top: 10px; */
    color: #fff;
    /* font-weight: 900; */
    font-size: 54px;"></span><span style="color: #fff" class="dropdown-toggle" data-toggle="dropdown">Tài khoản</span>
     <ul class="dropdown-menu" role="menu">
              <li><a href="${ cp }/thong-tin-tai-khoan"><span class="flaticon-user194"></span> Thông tin cá nhân
                              </a></li>
               <li><a href="#" data-toggle="modal"
               data-target="#modal_change_password"><span class="flaticon-password17" ></span> Thay đổi mật khẩu
                              </a></li>
                                 <li><a href="${ cp }/dang-xuat"><span class="flaticon-power27"></span> Đăng xuất
                              </a></li>
              </ul>
							</li></c:if>
								<li style="padding-top: 8px;margin-left: 10px" class="dropdown">
                        
                        <span class="flaticon-shopping79 glyph-icon-20" style="margin-right: 5px;
		    /* padding-top: 10px; */
		    color: #fff;
		    /* font-weight: 900; */
		    font-size: 54px;"></span><span style="color: #fff;cursor: pointer;" class="dropdown-toggle" data-toggle="dropdown"> 7 - Sản phẩm</span>
          <ul class="dropdown-menu dropdown-cart" role="menu">
              <li>
                  <span class="item">
                    <span class="item-left">
                        <img src="http://lorempixel.com/50/50/" alt="" />
                        <span class="item-info">
                            <span>Item name</span>
                            <span>23$</span>
                        </span>
                    </span>
                    <span class="item-right">
                        <button class="btn btn-xs btn-danger pull-right">x</button>
                    </span>
                </span>
              </li>
              <li>
                  <span class="item">
                    <span class="item-left">
                        <img src="http://lorempixel.com/50/50/" alt="" />
                        <span class="item-info">
                            <span>Item name</span>
                            <span>23$</span>
                        </span>
                    </span>
                    <span class="item-right">
                        <button class="btn btn-xs btn-danger pull-right">x</button>
                    </span>
                </span>
              </li>
              <li>
                  <span class="item">
                    <span class="item-left">
                        <img src="http://lorempixel.com/50/50/" alt="" />
                        <span class="item-info">
                            <span>Item name</span>
                            <span>23$</span>
                        </span>
                    </span>
                    <span class="item-right">
                        <button class="btn btn-xs btn-danger pull-right">x</button>
                    </span>
                </span>
              </li>
              <li>
                  <span class="item">
                    <span class="item-left">
                        <img src="http://lorempixel.com/50/50/" alt="" />
                        <span class="item-info">
                            <span>Item name</span>
                            <span>23$</span>
                        </span>
                    </span>
                    <span class="item-right">
                        <button class="btn btn-xs btn-danger pull-right">x</button>
                    </span>
                </span>
              </li>
              <li class="divider"></li>
              <li><a class="text-center" href="">View Cart</a></li>
          </ul>
        </li>
		                </ul> 
					</div>
			</nav>
		

<nav class="navbar navbar-blue" role="navigation" id="menu-top">
		<div id="bluemenu" class="navbar-collapse collapse">
			<ul class="nav navbar-nav" style="margin-left: -20px;font-size: 11px">
			<li><i class="glyph-icon flaticon-runer glyph-icon-blue"
				style="float: left; margin-top: 2px;margin-right: 2px"></i> <a class="text-blue"
				style="float: right; margin-top: -10px;padding-left:0">GIAO
					HOA MIỄN PHÍ</a></li>
			<li><i class="glyph-icon-20 flaticon-present23 glyph-icon-blue"
				style="float: left; margin-top: -1px;margin-right: 2px"></i> <a class="text-blue"
				style="float: right; margin-top: -10px;padding-left:0">
					QUÀ TẶNG MIỄN PHÍ</a></li>
			<li><i class="glyph-icon-20 flaticon-clock269 glyph-icon-blue"
				style="float: left;margin-right: 2px"></i> <a class="text-blue"
				style="float: right; margin-top: -10px;padding-left:0">
					PHỤC VỤ 24/7</a></li>
			<li><i class="glyph-icon-20 flaticon-payment7 glyph-icon-blue"
				style="float: left; margin-top: 2px;margin-right: 2px"></i> <a class="text-blue"
				style="float: right; margin-top: -10px;padding-left:0">
					THANH TOÁN TRỰC TUYẾN</a></li>
			<li><i class="glyph-icon-20 flaticon-award24 glyph-icon-blue"
				style="float: left; margin-top: 2px;margin-right: 2px"></i> <a class="text-blue"
				style="float: right; margin-top: -10px;padding-left:0">
					CAM KẾT CHẤT LƯỢNG</a></li>
			<li><i class="glyph-icon-20 flaticon-turn20 glyph-icon-blue"
				style="float: left; margin-top: 2px;margin-right: 2px"></i> <a class="text-blue"
				style="float: right; margin-top: -10px;padding-left:0">
					THÔNG BÁO GIAO NHẬN</a></li>
			

			</ul>

			<ul class="navbar-right nav navbar-nav" style="margin-right: -13px !important;position: relative;">
               <li><i class="glyph-icon-20 flaticon-magnifier13 glyph-icon-blue " onclick="$('#searchField').toggle('slow')"
				style="float: left; margin-top: 2px;margin-right: 2px"></i>
               <ul class="dropdown-menu" id="searchField">
                   <li style="padding: 10px" class="margin-top-10">
                     <span class="flaticon-user194 glyph-icon-blue text-primary"><strong>Tìm kiếm</strong></span> 
                     <input type="text" id="searchText1" style="width: 228px;height: 29px;border:1px solid #2F60AD;padding-left: 10px"  class="" placeholder="Tìm kiếm" value="${ searchText }"/>
                     <button class="btn btn-warning margin-top-10"  onclick="$('#searchField').hide('slow')">
                      Đóng lại</button>
                    
                     <button class="btn btn-primary margin-top-10 pull-right">
                       Tìm kiếm</button>
                     </li>
                      
                      
                 </ul>
            </li>
				
			</ul>
        
         
		</div>
	</nav>
<div class="modal fade" id="login-overlay">
<div  class="modal-dialog modal-lg">
      <div class="modal-content">
          <div class="modal-header" style="background: rgb(47, 96, 173);color: #fff">
              <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
              <h4 class="modal-title text-white" id="myModalLabel">Đăng nhập đến tuvanhoatuoi.com</h4>
          </div>
          <div class="modal-body">
         
              <div class="row">
                  <div class="col-xs-6" style="border-right: 1px solid rgb(186, 213, 226);margin-top: -20px;margin-bottom: -30px;height: 360px">
                  	<div style="border-bottom:2px solid rgb(221, 243, 254);padding: 30px 0px 1px 20px;">
							<h3 class="text-primary" style="font-weight:500 ">TÔI ĐÃ ĐĂNG KÝ TÀI KHOẢN</h3>
					</div>
                      <div class="well">
                         <form:form id="loginForm" method="POST" action="${ cp }/checkLogin" class="">
                              <div class="form-group">
                                  <label for="username" class="control-label text-primary">Địa chỉ email *</label>
                                  <input name="email" type="email" placeholder="Email" class="form-control">
                                  <span class="help-block"></span>
                              </div>
                              <div class="form-group">
                                   <label for="username" class="control-label text-primary">Mật khẩu *</label>
                                  <input name="password" type="password"  placeholder="Mật khẩu" class="form-control">
                                  <span class="help-block"></span>
                              </div>
                              <div id="loginErrorMsg" class="alert alert-error hide">Wrong username og password</div>
                              <a class="text-primary" href="#">Quên mật khẩu ?</a>
                              <div class="checkbox">
                                  <label class="text-primary">
                                      <input type="checkbox" name="remember" id="remember" style="margin-top: 14px"> Giữ trạng thái đăng nhập
                                  </label>
                                  <button class="btn btn-lg btn-primary" type="submit" >ĐĂNG NHẬP</button>
                             
                              </div>
                            
                         </form:form>
                      </div>
                  </div>
                  <div class="col-xs-6" style="border-left: 24px solid rgb(221, 243, 254);margin-top: -21px">
                    <div style="padding: 69px 0px 1px 92px;">
							<h3 class="text-primary" style="font-weight:500 ">BẠN LÀ KHÁCH HÀNG MỚI</h3>
					</div>
                      <a class="btn btn-lg btn-primary-customer" href="dang-ky" style="margin-left: 96px;
    margin-top: 10px;">
                      <i class="glyphicon glyphicon-user pull-left"></i><span>ĐĂNG KÝ<br><small>Click để đăng ký và mua hàng</small></span></a>       
                    
                     <div style="background: rgb(221, 243, 254);padding: 10px 0px 1px 24px;margin-top: 60px;margin-left:-40px;height:136px">
							<h3 class="text-primary text-center" style="font-weight:500;font-size: 15px">ĐĂNG NHẬP THUẬN TIỆN BẰNG TÀI KHOẢN FACEBOOK</h3>
							<a class="btn btn-default"  style="background: rgb(47, 96, 173);
    padding: 0px 20px 0px 20px;
    color: #fff;
    margin-left: 108px;
    margin-top: 10px;">
						        <i class="flaticon-facebook24 glyph-icon-10" style="    margin-left: -10px;
    margin-right: 10px;"></i> Đăng nhập với Facebook
						      </a>
						      <p class="text-primary" style="font-size: 11px;margin-top: 10px">ROSA sẽ không bao giờ gửi bài viết hoặc chia sẻ thông tin mà chưa được sự đồng ý của bạn</p>
	</div>
                  </div>
              </div>
          </div>
      </div>
  </div>
   </div>
   
<jsp:include page="../../views/frontend/modal_change_password.jsp"></jsp:include>
<script type="text/javascript">
  	$(function(){
   	$("#searchText1").keypress(function(e){
   		if(e.which == 13) {
   			window.location.href="${cp}/tim-kiem-san-pham-" + $("#searchText1").val()+".html";
   	    }
   	});

   
  	});

  </script>