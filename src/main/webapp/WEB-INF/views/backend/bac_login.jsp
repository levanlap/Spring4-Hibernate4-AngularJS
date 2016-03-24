<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<c:set var="cp"
	value="${pageContext.request.servletContext.contextPath}"
	scope="request" />
<!DOCTYPE html>
<html class="bg-black">
<head>
<meta charset="UTF-8">
<title>Admin</title>
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="${cp}/backend/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${cp}/backend/dist/css/font-awesome.min.css" />

		<!-- text fonts -->
		<link rel="stylesheet" href="${cp}/backend/dist/css/ace-fonts.min.css" />

		<!-- ace styles -->
		<link rel="stylesheet" href="${cp}/backend/dist/css/ace.min.css" />

		<link rel="stylesheet" href="css/ace-rtl.min.css" />
</head>

<body class="login-layout light-login">
		<div class="main-container">
			<div class="main-content">
				<div class="row">
					<div class="col-sm-10 col-sm-offset-1">
						<div class="login-container">
							<div class="center">
								<h1>
									<i class="ace-icon fa fa-leaf green"></i>
									<span class="red">Sips</span>
									<span class="white" id="id-text2">Application</span>
								</h1>
								<h4 class="blue" id="id-company-text">&copy; Tư Vấn Hoa Tươi</h4>
							</div>

							<div class="space-6"></div>

							<div class="position-relative">
								<div id="login-box" class="login-box visible widget-box no-border">
									<div class="widget-body">
										<div class="widget-main">
											<h4 class="header blue lighter bigger">
												<i class="ace-icon fa fa-coffee green"></i>
												Please Enter Your Information
											</h4>

											<div class="space-6"></div>
												<c:if test="${not empty error}">
													<p class="text-danger">
														<i class="fa fa-times-circle-o"></i> <span>${error}</span>
													</p>
												</c:if>
												<c:if test="${not empty msg}">
													<p class="text-warning">
														<i class="fa fa-check"></i> <span>${msg}</span>
													</p>
												</c:if>
												<form name='loginForm' action="<c:url value='/bac_login' />" method='POST'>
												<fieldset>
													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" name="username" class="form-control" placeholder="Username" />
															<i class="ace-icon fa fa-user"></i>
														</span>
													</label>

													<label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" name="password" class="form-control" placeholder="Password" />
															<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
													</label>

													<div class="space"></div>

													<div class="clearfix">

														<button type="submit" class="pull-right btn btn-block btn-primary">
															<span class="bigger-110">Login</span>
														</button>
													</div>

													<div class="space-4"></div>
												</fieldset>
											</form>

											<div class="social-or-login center">
												<span class="bigger-110">Or Login Using</span>
											</div>

											<div class="space-6"></div>

											<div class="social-login center">
												<a class="btn btn-primary">
													<i class="ace-icon fa fa-facebook"></i>
												</a>

												<a class="btn btn-info">
													<i class="ace-icon fa fa-twitter"></i>
												</a>

												<a class="btn btn-danger">
													<i class="ace-icon fa fa-google-plus"></i>
												</a>
											</div>
										</div><!-- /.widget-main -->

										<div class="toolbar clearfix" style="text-align: center;">
											<span class="bigger-120" >
												<span class="white bolder">Sips Application © 2015-2016</span>
											</span>
										</div>
									</div><!-- /.widget-body -->
								</div><!-- /.login-box -->

								

								
							</div><!-- /.position-relative -->


						</div>
					</div><!-- /.col -->
				</div><!-- /.row -->
			</div><!-- /.main-content -->
		</div><!-- /.main-container -->

		<!-- basic scripts -->

		<script src="${cp}/backend/dist/js/jQuery-2.1.4.min.js"></script>


	</body>
</html>