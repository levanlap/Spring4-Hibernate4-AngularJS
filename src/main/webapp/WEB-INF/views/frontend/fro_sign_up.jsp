<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div id="content">
	<div class="container background-white bottom-border">
		<div class="row margin-vert-30">
			<!-- Register Box -->
			<div class="col-xs-6" >
			<img src="${ cp }/frontend/img/dangky-panel.png" alt="dangky-tuvanhoatuoi"  style="margin-top: 50px">
			<img src="${ cp }/frontend/img/dangky_panel2.png" alt="logo-tuvanhoatuoi" >
			</div>
			<div class="col-xs-6">
				<form:form id="registryForm" method="POST" action="${ cp }/register" class="signup-page">
					<div class="signup-header">
						<h1 class="text-primary" style="font-weight: bold;margin: 10px 0px 30px 10px;">TÀI KHOẢN MỚI</h1>
		
						<span class="text-primary" style="font-weight:500;font-size: 15px ;width: 178px;float: left;margin-right: 20px;line-height: 1em">ĐĂNG NHẬP THUẬN TIỆN BẰNG TÀI KHOẢN FACEBOOK</span>
						<span style="float: left;"><a class="btn btn-default"  style="background: rgb(47, 96, 173);
    padding: 3px 20px 3px 20px;
    color: #fff;">
						        <i class="flaticon-facebook24 glyph-icon-10" style="    margin-left: -10px;
    margin-right: 10px;"></i> Đăng nhập với Facebook
						      </a></span>
					</div>
					
						<div class="clearfix"></div>
						 <p class="text-primary" style="font-size: 13px;margin-top: 30px;margin-right: 20px">ROSA sẽ không bao giờ gửi bài viết hoặc chia sẻ thông tin mà chưa được sự đồng ý của bạn.</p>
				
					<c:if test="${ errorRegister != null }">
						<div style="color: red">
                            <label class="error-msg"><i class="fa fa-times-circle-o"></i> ${ errorRegister }</label>
                            <c:remove var="errorRegister" scope="session" />
                        </div>
                    </c:if>
                    
                   <label>Địa chỉ Email *</label> 
                   <input class="form-control margin-bottom-20" type="text" name="email" maxlength="50">
                    <p class="text-primary" style="font-size: 13px;">Chúng tôi sẽ gửi thư xác nhận đến địa chỉ email này. Xin hãy chắc chắn rằng bạn có thể truy cập và sử dụng địa chỉ email này để nhận thư.</p>
				
                   <label>Mật khẩu *</label> 
                   <input class="form-control margin-bottom-20" type="password" name="password" maxlength="50">
                    
                   <label>Gõ lại mật khẩu *</label> 
				   <input class="form-control margin-bottom-20" type="password" name="confirmPassword" maxlength="50">
				
					<label>Điện thoại *</label> <input
						class="form-control margin-bottom-20" type="text" name="phone" maxlength="20"> 
						
					<label>Địa chỉ *</label> <input
						class="form-control margin-bottom-20" type="text" name="address" maxlength="100"> 
					
					<div style="border-bottom:2px solid rgb(221, 243, 254);padding: 20px 0px 0px 0px;">
							<h5 class="text-primary" style="font-weight:500 ">THÔNG TIN KHÁC</h5>
					</div>	
				
					
					<div class="row">
						<div class="col-xs-6">
							<label>Tên</label> 
							<input class="form-control margin-bottom-20" type="text" name="name" maxlength="50"> 
						</div>
						<div class="col-xs-6">
							<label>Họ</label> 
							<input class="form-control margin-bottom-20" type="text" name="lastName" maxlength="50"> 
						</div>
						<div class="col-xs-6">
						
							<label style="display: block !important;">Giới tính</label> 
							<label class="radio-inline">
							  <input type="radio" name="gender"  value="Nữ"> Nữ
							</label>
							<label class="radio-inline">
							  <input type="radio" name="gender" value="Nam"> Nam
							</label>
						</div>
						<div class="col-xs-6">
						
							<label style="display: block !important;">Ngày sinh</label> 
							<span style="float: left;width: 30%">
								<select class="">
								  <option>DD</option>
								  <option>1</option>
								  <option>2</option>
								  <option>3</option>
								  <option>4</option>
								  <option>5</option>
								</select>
								<label>Ngày</label>
							</span>
							<span style="float: left;width: 30%">
								<select class="">
								  <option>MM</option>
								  <option>1</option>
								  <option>2</option>
								  <option>3</option>
								  <option>4</option>
								  <option>5</option>
								</select>
								<label>Tháng</label>
							</span>
							<span style="float: left;width: 30%">
								<select class="">
								  <option>YYYY</option>
								  <option>1</option>
								  <option>2</option>
								  <option>3</option>
								  <option>4</option>
								  <option>5</option>
								</select>
								<label>Năm</label>
							</span>
						</div>
						<div class="col-xs-6">
							<label style="display: block !important;">Đăng ký bản tin điện tử</label>
							<div class="checkbox">
							  <label>
							    <input type="checkbox" value="">
							   	ROSA
							  </label>
							</div>
							<div class="checkbox disabled">
							  <label>
							    <input type="checkbox" value="" >
							    Marketplace
							  </label>
							</div>
						</div>
						<div class="col-xs-6">
						 <button class="btn btn-default btn-block"  type="submit" style="    background: rgb(47, 96, 173);
    padding: 10px 40px 10px 40px;
    color: #fff;
   
    margin-top: 20px;">HOÀN TẤT</button>
    					<div class="checkbox">
                                  <label class="text-primary">
                                      <input type="checkbox" name="rememberRegister" id="rememberRegister"> Giữ trạng thái đăng nhập
                                  </label>
                             
                              </div>
                             
						</div>
						
					</div>
					
					
						
					 <p class="text-primary" style="font-size: 13px;margin-top: 10px;text-align: right;">* Mục bắt buộc</p>
				
				</form:form>
			</div>
			<!-- End Register Box -->
		</div>
	</div>
</div>