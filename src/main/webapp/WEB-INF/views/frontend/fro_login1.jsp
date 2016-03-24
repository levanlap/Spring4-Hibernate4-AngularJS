<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<style>
body{
	background-color: #FFFFFF;
}
#body-bg{
	background-image: none !important;
}
</style>

<div id="content">
	<div class="container">
		<div class="container">
			<div class="row margin-vert-30">
				<!-- Login Box -->
				<div class="col-md-6 col-md-offset-3 col-sm-offset-3">
					<form:form id="loginForm" method="POST" action="${ cp }/checkLogin" class="login-page">
						<div class="login-header margin-bottom-30">
							<h2>Đăng nhập</h2>
						</div>
						<c:if test="${ errorLogin != null }">
							<div style="color: red">
	                            <label class="error-msg"><i class="fa fa-times-circle-o"></i> ${ errorLogin }</label>
	                            <c:remove var="errorLogin" scope="session" />
	                        </div>
                        </c:if>
						<div class="input-group margin-bottom-20">
							<span class="input-group-addon"> <i class="fa fa-user"></i>
							</span> <input name="email" type="email" placeholder="Email" class="form-control">
						</div>
						<div class="input-group margin-bottom-20">
							<span class="input-group-addon"> <i class="fa fa-lock"></i>
							</span> <input name="password" type="password"  placeholder="Mật khẩu" class="form-control">
						</div>
						<div class="row">
							<div class="col-md-12">
								<button class="btn btn-primary pull-right" type="submit">Đăng nhập</button>
							</div>
						</div>
						<hr>
					</form:form>
				</div>
				<!-- End Login Box -->
			</div>
		</div>
	</div>
</div>