<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="cp" value="${pageContext.request.servletContext.contextPath}" scope="request" />
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="cp" value="${pageContext.request.servletContext.contextPath}" scope="request" />
<html ng-app="app"> 
   <head>      
   		<title><tiles:insertAttribute name="title" /></title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
		<meta charset="utf-8" />
		<meta name="description" content="top menu &amp; navigation" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
		<!-- bootstrap & fontawesome -->
		<link rel="stylesheet" href="${cp}/backend/dist/css/bootstrap.min.css" />
		<link rel="stylesheet" href="${cp}/backend/dist/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${cp}/backend/dist/css/ace-fonts.min.css" />
		<%-- <link rel="stylesheet" href="${cp}/backend/dist/css/ace.min.css" /> --%>
		<link rel="stylesheet" href="${cp}/backend/assets/css/ace.css" />

		<style>body {
		  font-family: "Lucida Grande",Verdana,Arial,Helvetica,sans-serif;
		  font-size: 13px;
		}</style>
 </head>
 <body class="no-skin">
    <div class="main-container" id="main-container">
     <div class="main-content">
      <div class="page-content">
        <!-- setting box goes here if needed -->
		<div class="row">
          <div class="col-xs-12">
           	<div class="error-container">
									<div class="well">
										<h1 class="grey lighter smaller">
											<span class="blue bigger-125">
												<i class="ace-icon fa fa-random"></i>
												500
											</span>
											Something Went Wrong
										</h1>

										<hr>
										<h3 class="lighter smaller">
											But we are working
											<i class="ace-icon fa fa-wrench icon-animated-wrench bigger-125"></i>
											on it!
										</h3>

										<div class="space"></div>

										<div>
											<h4 class="lighter smaller">Meanwhile, try one of the following:</h4>

											<ul class="list-unstyled spaced inline bigger-110 margin-15">
												<li>
													<i class="ace-icon fa fa-hand-o-right blue"></i>
													Read the faq
												</li>

												<li>
													<i class="ace-icon fa fa-hand-o-right blue"></i>
													Give us more info on how this specific error occurred!
												</li>
											</ul>
										</div>

										<hr>
										<div class="space"></div>

										<div class="center">
											<a href="javascript:history.back()" class="btn btn-grey">
												<i class="ace-icon fa fa-arrow-left"></i>
												Go Back
											</a>

											<a href="#" class="btn btn-primary">
												<i class="ace-icon fa fa-home"></i>
												Trang chủ
											</a>
										</div>
									</div>
								</div>
          </div><!-- /.col -->
        </div><!-- /.row -->

      </div><!-- /.page-content -->
     </div><!-- /.main-content -->
	 
     <!-- footer area -->
		<div class="footer">
				<div class="footer-inner">
					<!-- #section:basics/footer -->
					<div class="footer-content">
						<span class="bigger-120">
							<span class="blue bolder">Sips</span>
							Application © 2015-2016
						</span>

						&nbsp; &nbsp;
						<span class="action-buttons">
							<a href="#">
								<i class="ace-icon fa fa-twitter-square light-blue bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-facebook-square text-primary bigger-150"></i>
							</a>

							<a href="#">
								<i class="ace-icon fa fa-rss-square orange bigger-150"></i>
							</a>
						</span>
					</div>

					<!-- /section:basics/footer -->
				</div>
			</div>
   </div><!-- /.main-container -->


 </body>
</html>
