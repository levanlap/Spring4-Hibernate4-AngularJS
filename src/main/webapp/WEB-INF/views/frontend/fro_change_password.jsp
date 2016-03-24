<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div id="content">
	<div class="container background-white bottom-border">

		<div class="row margin-vert-30">
			<!-- Login Box -->
			<div class="col-md-6 col-md-offset-3 col-sm-offset-3">
				<form:form class="login-page" action="${ cp }/changePassword" method="post">
					<div class="login-header margin-bottom-30">
						<h2>
							<i class="fa fa-edit"></i> Thay đổi mật khẩu
						</h2>
					</div>
					
					<c:if test="${ error != null }">
						<div style="color: red">
							<label class="error-msg"><i class="fa fa-times-circle-o"></i>
								${ error }</label>
							<c:remove var="error" scope="session" />
						</div>
					</c:if>
					<c:if test="${ success != null }">
						<div style="color: green">
							<label class="control-label" for="inputSuccess"><i class="fa fa-check"></i> ${ success }</label>
							 <c:remove var="success" scope="session" />
						</div>
					</c:if>
					
					<div class="input-group margin-bottom-20">
						<span class="input-group-addon"> <i
							class="glyphicon glyphicon-lock"></i>
						</span> <input placeholder="Mật khẩu cũ" class="form-control"
							type="password" name="oldpassword" maxlength="50">
					</div>
					<div class="input-group margin-bottom-20">
						<span class="input-group-addon"> <span
							class="glyphicon glyphicon-log-in"></span>
						</span> <input placeholder="Mật khẩu mới" class="form-control"
							type="password" name="newpassword" maxlength="50">
					</div>
					<div class="input-group margin-bottom-20">
						<span class="input-group-addon"> <span
							class="glyphicon glyphicon-repeat"></span>
						</span> <input placeholder="Lặp lại mật khẩu mới" class="form-control"
							type="password" name="confirmnewpassword" maxlength="50">
					</div>
					<hr>
					<div class="row">
						<div class="col-md-12 text-right">
							<button class="btn btn-lg btn-primary padding-horiz-30"
								type="submit">Cập nhập</button>
						</div>
					</div>

				</form:form>
			</div>
			<!-- End Login Box -->
		</div>

	</div>
</div>