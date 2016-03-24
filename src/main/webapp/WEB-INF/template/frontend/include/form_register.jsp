<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div id="mini_register_form">
	<div class="signup-header">
		<h4>
			<i class="flaticon-user117"></i> Đăng ký tài khoản
		</h4>
	</div>
	<form:form id="registryForm" method="POST" action="${ cp }/register">
		<div class="signup-page">
			<div class="form-group has-feedback" style="width: 45%; float: left">
				<input class="form-control" type="text" name="name" maxlength="50"
					placeholder="Tên *"> <span
					class="glyphicon glyphicon-user form-control-feedback"></span>
			</div>

			<div class="form-group has-feedback"
				style="width: 45%; float: left; margin-left: 10%">
				<input class="form-control" type="text" name="email" maxlength="50"
					placeholder="Email *"> <span
					class="glyphicon glyphicon-envelope form-control-feedback"></span>
			</div>

			<div class="form-group has-feedback" style="width: 45%; float: left">
				<input class="form-control" type="password" name="password"
					maxlength="50" placeholder="Mật khẩu *"> <span
					class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>

			<div class="form-group has-feedback"
				style="width: 45%; float: left; margin-left: 10%">
				<input class="form-control" type="password" name="confirmPassword"
					maxlength="50" placeholder="Gõ lại mật khẩu *"> <span
					class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>

			<div class="form-group has-feedback" style="width: 45%; float: left">
				<input class="form-control" type="text" name="phone" maxlength="20"
					placeholder="Điện thoại *"> <span
					class="glyphicon glyphicon-phone-alt form-control-feedback"></span>
			</div>

			<div class="form-group has-feedback" style="clear: both;">
				<textarea class="form-control" type="text" name="address"
					maxlength="100" placeholder="Địa chỉ *"></textarea>
				<span
					class="glyph-icon-20 flaticon-direction23 form-control-feedback"></span>
			</div>

			<hr>
			<div class="row padding-horiz-20 text-right">
				<button class="button" type="submit"><span>Đăng
					ký</span></button>
			</div>
			<div></div>
		</div>
	</form:form>
</div>