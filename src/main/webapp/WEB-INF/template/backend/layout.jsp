<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="cp" value="${pageContext.request.servletContext.contextPath}" scope="request"/>
<html ng-app="app">
<head>
    <title><tiles:insertAttribute name="title"/></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <meta name="description" content="top menu &amp; navigation"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
     <link rel="shortcut icon" type="image/x-icon" href="${cp}/backend/dist/img/favicon.ico"/>
    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="${cp}/backend/dist/css/bootstrap.min.css"/>
    <link rel="stylesheet" href="${cp}/backend/dist/css/font-awesome-4.4.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="${cp}/backend/dist/css/jquery.gritter.min.css"/>
    <link rel="stylesheet" href="${cp}/backend/dist/css/chosen.min.css"/>
  
    <link rel="stylesheet" href="${cp}/backend/dist/css/ace-fonts.min.css"/>
    <link rel="stylesheet" href="${cp}/backend/dist/css/ace.min.css"/>
    <link rel="stylesheet" href="${cp}/backend/dist/css/tuvanhoatuoi.css"/>


    <%-- <script src="${cp}/backend/dist/js/ace-extra.min.js"></script> --%>
    <%-- <script src="${cp}/backend/assets/js/ace-extra.js"></script> --%>
    <script src="${cp}/backend/dist/js/jQuery-2.1.4.min.js"></script>
    <script src="${cp}/backend/dist/js/bootstrap.min.js"></script>
    <script src="${cp}/backend/dist/js/angular.js"></script>
    <!-- Treeview style -->
    <link href="${cp}/backend/dist/js/boottrap-treeview/treeview.css" rel="stylesheet" type="text/css"/>
    <link href="${cp}/backend/dist/js/bootstrap-modal-customer/bootstrap-dialog.min.css" rel="stylesheet"
          type="text/css"/>

    <link href="${cp}/backend/dist/js/data-tables/datatables-bootstrap.css" rel="stylesheet" type="text/css"/>
    <script src="${cp}/backend/dist/js/data-tables/jquery-datatables.min.js"></script>
    <script src="${cp}/backend/dist/js/data-tables/datatables-bootstrap.js" type="text/javascript"></script>
    <script src="${cp}/backend/dist/js/data-tables/angulardatatables.min.js"></script>


</head>
<body class="no-skin">
<tiles:insertAttribute name="navbar"/>

<div class="main-container" id="main-container">
    <tiles:insertAttribute name="sidebar"/>

    <div class="main-content">
        <div class="page-content">
            <!-- setting box goes here if needed -->
            <div class="row">
                <div class="col-xs-12">
                    <tiles:insertAttribute name="content"/>
                </div>
            </div>
        </div>
    </div>
    <div class="footer">
        <div class="footer-inner">
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
        </div>
    </div>
</div>

<script type="text/javascript">
    if ('ontouchstart' in document.documentElement) document.write("<script src='${cp}/backend/assets/js/jquery.mobile.custom.js'>" + "<" + "/script>");
</script>
<%-- 
		<script src="${cp}/backend/dist/js/ace/elements.scroller.min.js"></script>
		<script src="${cp}/backend/dist/js/ace/elements.aside.min.js"></script>
		<script src="${cp}/backend/dist/js/ace/ace.min.js"></script>

		<script src="${cp}/backend/dist/js/ace/ace.sidebar.min.js"></script>
		<script src="${cp}/backend/dist/js/ace/ace.sidebar-scroll-1.min.js"></script>
		<script src="${cp}/backend/dist/js/ace/ace.submenu-hover.min.js"></script>
		<script src="${cp}/backend/dist/js/ace/ace.widget-box.min.js"></script>
		 --%>

<script src="${cp}/backend/dist/js/ace/ace.js"></script>
<script src="${cp}/backend/dist/js/ace/ace.widget-box.js"></script>

<!-- Treeview -->
<script src="${cp}/backend/dist/js/boottrap-treeview/bootstrap-treeview.js" type="text/javascript"></script>

<script src="${cp}/backend/dist/js/bootstrap-modal-customer/bootstrap-dialog.min.js"></script>


<!-- ckEditor -->
<script src="${cp}/backend/dist/js/ckeditor/ckeditor.js"></script>
<script src="${cp}/backend/dist/js/ckeditor/ng-ckeditor.js"></script>

<script src="${cp}/backend/dist/js/paging.js"></script>

<script src="${cp}/backend/dist/js/jquery.gritter.min.js"></script>
<script src="${cp}/backend/dist/js/chosen.jquery.min.js"></script>
<!-- BOOTSTRAP MODAL -->
<script>
    $(document).ready(function () {
        BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_DEFAULT] = '<spring:message code="message.title.information" />';
        BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_INFO] = '<spring:message code="message.title.information" />';
        BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_PRIMARY] = '<spring:message code="message.title.information" />';
        BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_SUCCESS] = '<spring:message code="message.title.success" />';
        BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_WARNING] = '<spring:message code="message.title.warning" />';
        BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_DANGER] = '<spring:message code="message.title.danger" />';
        BootstrapDialog.DEFAULT_TEXTS['OK'] = '<spring:message code="message.button.yes" />';
        BootstrapDialog.DEFAULT_TEXTS['CANCEL'] = '<spring:message code="message.button.cancel" />';
    });
    
	function themHieuUngXoay(element) {
		 $( element ).addClass( "fa-spin");
	}
	
	function xoaHieuUngXoay(element) {
		 $( element ).removeClass( "fa-spin");
	}

</script>
<script>
var thongBao;
thongBao={
		   luuTruThanhCong : function() {
				$.gritter.add({
					title: 'Thông báo',
					text: 'Lưu trữ thành công',
					image: '${cp}/backend/dist/img/avatar3.png',
					sticky: false,
					class_name: ('gritter-success')
				});   
			},
			chinhSuaThanhCong : function() {
				$.gritter.add({
					title: 'Thông báo',
					text: 'Chỉnh sửa thành công',
					image: '${cp}/backend/dist/img/avatar4.png',
					sticky: false,
					class_name: ('gritter-success')
				});   
			},
			xoaThanhCong : function() {
				$.gritter.add({
					title: 'Thông báo',
					text: 'Xóa thành công',
					image: '${cp}/backend/dist/img/avatar.png',
					sticky: false,
					class_name: ('gritter-success')
				});   
			},
			xoaKhongThanhCong : function() {
				$.gritter.add({
					title: 'Thông báo',
					text: 'Xóa không thành công',
					image: '${cp}/backend/dist/img/avatar.png',
					sticky: false,
					class_name: ('gritter-red')
				});   
			},
			taoMoiThuMuc : function(tenThuMucCha) {
				$.gritter.add({
					title: 'Thông báo',
					text: '<h6>Bạn tạo mới thư mục con trong thư mục <strong class="orange2">'+tenThuMucCha+'</strong></h6><p>Bạn có thể chọn nhiều hình ảnh một lần.</p><p> Khi chọn hình ảnh sẽ tự động upload server</p>',
					image: "${cp}/backend/dist/img/avatar5.png",
					sticky: false,
					class_name: ('gritter-warning')
				});   
			},
			sanPhamTonTai : function(tenThuMucCha) {
				$.gritter.add({
					title: 'Thông báo',
					text: 'Sản phẩm đã tồn tại',
					image: "${cp}/backend/dist/img/avatar4.png",
					sticky: false,
					class_name: ('gritter-warning')
				});   
			},
			taoMoi : function(name) {
				$.gritter.add({
					title: 'Thông báo',
					text: 'Vui lòng nhập thông tin để tạo mới <strong class="orange2">'+name + '</strong>',
					image: "${cp}/backend/dist/img/avatar4.png",
					sticky: false,
					class_name: ('gritter-info')
				});   
			},
}

</script>
</body>
</html>
