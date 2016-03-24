<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div id="image-galary" class="box box-info image-galary" style="display: none">
	
	<div class="box-header">
		<h3 class="box-title">
			Lựa chọn hình ảnh
		</h3>
		
		<div style="clear: both; text-align: right; padding-right: 10px">
			<button class="btn btn-flat" ng-click="todoList.hideImageGalary();" >
				Không lựa chọn
			</button>
			<button class="btn btn-primary btn-flat" 
						ng-click="todoList.asignImage();" 
						ng-disabled="todoList.disabledBtnAsignImage();">
				Lựa chọn
			</button>
		</div>
	</div>
	
	<div class="box-body">
		<form id="imageGalleryForm">
			<div class="input-group">
            	<input type="text" ng-model="searchText" class="form-control" placeholder="Tìm kiếm hình ảnh...">
            	<span class="input-group-addon"><i class="fa fa-search"></i></span>
            </div>
            <div ng-click="todoList.clickOutsiteImageItem();">
				<a ng-repeat="image in images | filter:searchText"
					 ng-click="todoList.selectImage($event, image);"
					 ng-dblclick="todoList.asignImage();";
					 id="img-item-{{image.id}}" class="image-item" >
					<img alt="" src="${dataDomain}{{ image.url }}"/>
					<br />
					<span class="name">{{ image.name }}</span>
				</a>
				<div style="clear: both"></div>
			</div>
		</form>
		<div style="clear:both"></div>
	</div>
	
	<div class="box-footer" style="text-align: right;">
		<button class="btn btn-flat" ng-click="todoList.hideImageGalary();" >
			Không lựa chọn
		</button>
		<button class="btn btn-primary btn-flat" 
					ng-click="todoList.asignImage();" 
					ng-disabled="todoList.disabledBtnAsignImage();">
			Lựa chọn
		</button>
	</div>
</div>

<script type="text/javascript">




</script>
	