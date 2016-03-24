<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div id="mini_login_form" class="zoomOutLeft animated animate">
	<div class="login-header">
		<h4 class="list-group-item-heading">
			<i class="flaticon-male80"></i> Đăng nhập
		</h4>
	</div>
	<c:if test="${ errorRegister != null }">
		<div style="color: red">
			<label class="error-msg"><i class="fa fa-times-circle-o"></i>
				${ errorRegister }</label>
			<c:remove var="errorRegister" scope="session" />
		</div>
	</c:if>
	<form:form id="loginForm" method="POST" action="${ cp }/checkLogin">
		<div class="login_popup">
			<div class="form-group has-feedback">
				<input class="form-control" type="text" name="email" maxlength="50"
					placeholder="Email"> <span
					class="glyphicon glyphicon-envelope form-control-feedback"></span>
			</div>

			<div class="form-group has-feedback">
				<input class="form-control" type="password" name="password"
					maxlength="50" placeholder="Gõ lại mật khẩu"> <span
					class="glyphicon glyphicon-lock form-control-feedback"></span>
			</div>
			<div class="row">
				<div class="col-sm-6"><a href="#" style="color: blue;">Quên mật khẩu ?</a></div>
				<div class="col-sm-6 text-right"><button class="button" type="submit"><span>Đăng
				nhập</span></button></div>
			</div>
		</div>
	</form:form>
</div>