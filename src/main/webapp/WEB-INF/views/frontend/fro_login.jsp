<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div id="content">
	<div class="container background-white bottom-border">

         <h2 class="text-center text-primary big-title margin-vert-30">Đăng nhập</h2>

         <div style="width: 40%; float: left; height: 368px" class="left-to-right">
            <h5 class="text-primary small-title-left no-margin">1.Đăng nhập bằng</h5>
                   <div class="well">
                 <a href="#" class="btn btn-primary margin-top-20" style="margin-left: 33px"><i class="flaticon-facebook24 glyph-icon-20" ></i> Đăng nhập với Facebook</a>
                 <a href="#" class="btn btn-danger  margin-top-20" style="width: 208px;margin-left: 33px"><i class="flaticon-logo29 glyph-icon-20" ></i>   Đăng nhập với Google +</a>
                 </div>
      
               </div>

         <div style="width: 60%; float: left; height: 368px" class="left-to-right right-border">
                      <h5 class="text-primary small-title-left no-margin">2.Đăng nhập bằng tài khoàn tư vấn hoa tươi</h5>
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
                                      <input type="checkbox" name="remember" id="remember" style="margin-top: 7px"> Giữ trạng thái đăng nhập
                                  </label>
                                  <button class="btn btn-lg btn-primary-customer pull-right"  type="submit">
                      <i class="glyphicon glyphicon-log-in pull-left"></i><span>Đăng nhập<br><small>Đăng nhập để tiếp tục mua hàng</small></span></button>
                                 
                             
                              </div>
                            
                         </form:form>
                         </div>
         </div>
<div class="margin-vert-10" style="background: rgb(221, 243, 254);padding: 10px 30px 0px 0px;clear: both;height:150px">
            </div>


	</div>
</div>