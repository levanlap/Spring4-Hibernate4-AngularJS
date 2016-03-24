<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="cp" value="${pageContext.request.servletContext.contextPath}" scope="request" />

<style type="text/css">

.image-galary .image-item{
	width: 104px; 
	height: 174px; 
	padding: 2px;
	float: left; 
	text-align: center; 
	margin: 10px;
	cursor: pointer;
}

.image-galary .image-item:hover{
	background-color: #3c8dbc;
	color: #FFFFFF;
	opacity: .4;
}

.image-galary a.selected{
	background-color: #3c8dbc;
	color: #FFFFFF;
}

.image-galary .image-item img{
	width: 100px; 
	height: 100px; 
	margin-bottom: 5px;
}

.image-galary .image-item img{
	font-size: 10px;
}

</style>
<aside class="right-side" ng-controller="GeneralController as todoList">
<%-- Header --%>
	<section class="content-header">
		<h1>
			<spring:message code="menu.backend.general.setting" />
			<small><spring:message code="message.control.panel" /></small>
		</h1>
		<ol class="breadcrumb">

			<li class="active"><i class="fa fa-user"></i> <spring:message
					code="menu.backend.general.setting" /></li>
		</ol>
	</section>

	<%-- End Header --%>
	<!-- Main content -->
	<section class="content">
		<div class="row">
			<!-- /.col (left) -->
			<div class="col-md-12" id="detailGeneral" style="display: none">
				<div class="box box-success">
					<div class="box-header">
						<h3 class="box-title">Cài đặt thông số chung</h3>
					</div>
					<div class="box-body">
						<form role="form">
						<div class="nav-tabs-custom">
                                <ul class="nav nav-tabs pull-right">
                                    <li class="active"><a href="#tab_1-1" data-toggle="tab">Màu sắc cho trang web</a></li>
                                    <li><a href="#tab_2-2" data-toggle="tab">Background content</a></li>
                                   	<li><a href="#tab_3-3" data-toggle="tab">Background header</a></li>
                                    <li class="pull-left header"><i class="fa fa-th"></i> General</li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_1-1">
                                       <div class="form-group">
											<label>Chọn màu sắc cho trang web</label> 
                                            <select
												class="form-control" ng-model="general.styleColor">
												<option value="#985051">Màu nâu</option>
												<option value="#653d87">Màu tím</option>
												<option value="#4FBFA8">Màu xanh ngọc</option>
												<option value="#01A147">Màu xanh lá cây</option>
												<option value="#da4d4d">Màu đỏ</option>
												<option value="#82b440">Màu lá chuối</option>
												
											</select>
										</div>
										 <div class="form-group">
										 	<label>Hiển thị màu sắc</label> 
	                                        <div  style="font-size: 200%;;background-color:{{general.styleColor}};">
	                                        	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	                                        </div>
										</div>
                                    </div><!-- /.tab-pane -->
                                    <div class="tab-pane" id="tab_2-2">
                                       <div class="form-group">
			                                 <label>
												Background content
												<span style="color: #f56954">(*)</span>
											</label>
			                                 <a ng-click="todoList.selectBlogImage(1)" style="font-size: 10px; cursor: pointer"><spring:message code="blog.select.image.from.galary" /></a>
			                                 <div ng-if="general.backgroundLink != null">
			                                 	<img id="blogImage" alt="" src="${dataDomain}{{general.backgroundLink.image}}" style="margin: 10px;" class="img-rounded"> 
			                                 </div>
			                            </div>
			                            <div class="form-group">
			                            	<label>
												Thuộc tính Background<span style="color: #f56954">(*)</span>
											</label>
				                             <select class="form-control" ng-model="general.backgroundContentRepeat">
												<option value="repeat">Lặp lại toàn bộ</option>
												<option value="repeat-x">Lặp lại theo chiều ngang</option>
											</select>
			                            </div>
                                    </div><!-- /.tab-pane -->
                                     <div class="tab-pane" id="tab_3-3">
                                        <div class="form-group">
			                                 <label>
												Background header
												<span style="color: #f56954">(*)</span>
											</label>
			                                 <a ng-click="todoList.selectBlogImage(2)" style="font-size: 10px; cursor: pointer"><spring:message code="blog.select.image.from.galary" /></a>
			                                 <div ng-if="general.preHeaderBg != null">
			                                 	<img id="blogImage" alt="" src="${dataDomain}{{general.preHeaderBg.image}}" style="margin: 10px;" class="img-rounded"> 
			                                 </div>
			                            </div>
                                    </div><!-- /.tab-pane -->
                                </div><!-- /.tab-content -->
                            </div>
						</form>
					</div>
					<!-- /.box-body -->
					<div class="box-footer" style="text-align: right">
						<a class="btn btn-primary btn-flat" ng-click="todoList.save()"> 
								<i class="fa fa-save"></i> <spring:message code="message.button.save" />
						</a>
					
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="bac_image_galary_popup.jsp" />
	</section>
	<!-- /.content -->
</aside>
<!-- /.right-side -->
<script>
angular.module('app',[])
.controller('GeneralController',GeneralController);

function GeneralController($scope, $http, $sce) {
	
 	BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_DEFAULT] = '<spring:message code="message.title.information" />';
    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_INFO] = '<spring:message code="message.title.information" />';
    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_PRIMARY] = '<spring:message code="message.title.information" />';
    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_SUCCESS] = '<spring:message code="message.title.success" />';
    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_WARNING] = '<spring:message code="message.title.warning" />';
    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_DANGER] = '<spring:message code="message.title.danger" />';
    BootstrapDialog.DEFAULT_TEXTS['OK'] = '<spring:message code="message.button.yes" />';
    BootstrapDialog.DEFAULT_TEXTS['CANCEL'] = '<spring:message code="message.button.cancel" />';
    
	var todoList = this;
	$("#detailGeneral").show("slow");
	$scope.general={
			id:'${generalSetting.id}',
			styleColor:'${generalSetting.styleColor}', 
			backgroundLink: {image:'${generalSetting.backgroundLink}'}, 
			preHeaderBg: {image:'${generalSetting.preHeaderBg}'},
			backgroundContentRepeat:'${generalSetting.backgroundContentRepeat}',
	};
	$http.get('${cp}/admin/listImages').success(function(data){
  		$scope.images = data;
    }).error(function() {
    	alert('<spring:message code="message.http.error.message"></spring:message>');
    });
	
	todoList.save = function() {
		var data = angular.copy($scope.general);
		data.backgroundLink = data.backgroundLink.image;
		data.preHeaderBg = data.preHeaderBg.image;
		 $http.post('saveGeneral',data).success(function(data){
			 BootstrapDialog.show({
		            message: '<spring:message code="message.save.success" />',
		            type: BootstrapDialog.TYPE_SUCCESS,
		            buttons: [{
		                label: '<spring:message code="message.button.cancel" />',
		                action: function(dialogItself){
		                    dialogItself.close();
		                }
		            }]
	        	});
			 }
		); 
	};
	
	$scope.typeBackground = null;
	/* Display the gallery image popup to select new main image for product */
	todoList.selectBlogImage = function(type){
		$scope.typeBackground = type;
		$("a.selected").removeClass('selected');
		$scope.MULTI_SELECT = false;
		if( $scope.blog != null && $scope.blog.image != null ){
			$("#img-item-" + $scope.blog.image.id).addClass('selected');
		}
		$scope.selectedImage = null;
		todoList.showImageGalary();
	}
	
	todoList.showImageGalary = function(){
		$("#detailGeneral").hide('slow');
		$("#image-galary").show('slow');
	} 
	
	todoList.hideImageGalary = function(){
		$("#detailGeneral").show('slow');
		$("#image-galary").hide('slow');
		$("html, body").animate({ scrollTop: 0 }, "slow");
	};
	
	todoList.selectImage = function($event, image){
		
		// Get current element selecting
		$("a.selected").removeClass('selected');
		var el = $("#img-item-" + image.id);
		$scope.selectedImage = image;
		// Check if the element has selected already
		if(el.hasClass('selected')){
			// Unmark select it
			el.removeClass('selected');
		}
		else{
			// Mark selecte it
			el.addClass('selected');
		}
		// Prevent don't allow outsite click event
		$event.stopPropagation();
	}
	
	todoList.clickOutsiteImageItem = function(){
		$("a.selected").removeClass('selected');
		$scope.selectedImage = null;
		BootstrapDialog.show({
            message: '<spring:message code="message.clean.image.selection" />',
            type: BootstrapDialog.TYPE_SUCCESS,
            buttons: [{
                label: '<spring:message code="message.button.cancel" />',
                action: function(dialogItself){
                    dialogItself.close();
                }
            }]
    	});
	};
	
	todoList.disabledBtnAsignImage = function(){
		return ($scope.selectedImage == 'undefined' 
				|| $scope.selectedImage == null);
	};
	
	todoList.asignImage = function(){
		if($scope.typeBackground == 1)
			$scope.general.backgroundLink = angular.copy( $scope.selectedImage );
		if($scope.typeBackground == 2)
			$scope.general.preHeaderBg = angular.copy( $scope.selectedImage );
		todoList.hideImageGalary();
	};
}

</script>