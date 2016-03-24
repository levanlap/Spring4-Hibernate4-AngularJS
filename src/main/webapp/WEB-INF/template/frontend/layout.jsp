<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<c:set var="cp" value="${pageContext.request.servletContext.contextPath}" scope="request" />

<html>
<head>
<title>
	<tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
</title>
<meta http-equiv="refresh" content="1740;url=http://tuvanhoatuoi.com" />
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="">
<meta name="author" content="">
<!-- FAVICON -->
<!-- <link href="favicon.ico" rel="shortcut icon"> -->

<!-- GOOGLE FONTS-->
<link href="http://fonts.googleapis.com/css?family=Roboto+Condensed:400,300" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300italic,700&subset=latin,cyrillic-ext,latin-ext,cyrillic' rel='stylesheet' type='text/css'>
<!-- TEMPLATE CSS -->
<link rel="stylesheet" href="${ cp }/frontend/css/bootstrap.css">

<%-- <link rel="stylesheet" href="${ cp }/frontend/css/font-awesome.css"> --%>
<link rel="stylesheet" href="${ cp }/frontend/css/skitter.styles.css" media="all"  />
<link rel="stylesheet" href="${ cp }/frontend/css//nexus.green.css">
<%-- <link rel="stylesheet" href="${ cp }/frontend/css/responsive.css"> --%>
<link rel="stylesheet" href="${ cp }/frontend/css/owl.carousel.css">
<link rel="stylesheet" href="${ cp }/frontend/css/owl.theme.css">
<link rel="stylesheet" href="${ cp }/frontend/css/box.css">
<%-- <link rel="stylesheet" href="${ cp }/frontend/css/menu/fhmm.css"> --%>
<%-- <link rel="stylesheet" href="${ cp }/frontend/css/menu/menu.css"> --%>
<%-- <link rel="stylesheet" href="${ cp }/frontend/css/menu_mobile/push-menu.css"> --%>
<link rel="stylesheet" href="${ cp }/frontend/css/flaticon/flaticon.css">
<link rel="stylesheet" href="${ cp }/frontend/css/non-responsive.css">

<link rel="stylesheet" href="${ cp }/frontend/css/datedropper.css">
<link rel="stylesheet" href="${ cp }/frontend/css/custom.css">

<!-- JS -->
<script type="text/javascript" src="${ cp }/frontend/js/jquery.min.js" type="text/javascript"></script>
<script type="text/javascript" src="${ cp }/frontend/js/bootstrap.min.js" type="text/javascript"></script>

<!-- MODERNIZR -->
<script src="${ cp }/frontend/js/modernizr.custom.js" type="text/javascript"></script>
 <!-- SKITTER	 -->
<script type="text/javascript" src="${ cp }/frontend/js/jquery.easing.1.3.js"></script> 
<%-- <script type="text/javascript" src="${ cp }/frontend/js/jquery.skitter.min.js"></script> --%>
<script type="text/javascript" src="http://www.skitter-slider.net/js/jquery.skitter.min.js"></script>

<script type="text/javascript" src="${ cp }/frontend/js/owl.carousel.js"></script>
 <script type="text/javascript" src="${ cp }/frontend/js/jquery.navgoco.js"></script>
<script type="text/javascript" src="${ cp }/frontend/js/scripts.js"></script>
<script type="text/javascript" src="${ cp }/frontend/js/menu/bootstrap-hover-dropdown.js"></script>
<script type="text/javascript" src="${ cp }/frontend/js/menu/fitdivs.js"></script> 
 <script type="text/javascript" src="${ cp }/frontend/js/menu_mobile/push-menu.js"></script> 
<script src="${ cp }/frontend/js/datedropper.js"></script>
<!-- END JS -->
</head>
<body id="top">
	<div id="body-bg">
 	<tiles:insertAttribute name="logo" />
		 <tiles:insertAttribute name="menu" />
		<tiles:insertAttribute name="content" /> 
		<tiles:insertAttribute name="footer" />
	</div>
	<script type="text/javascript" src="${ cp }/frontend/js/menu/call_menu.js"></script>
</body>
</html>
