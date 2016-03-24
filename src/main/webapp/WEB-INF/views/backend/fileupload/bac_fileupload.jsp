<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<script src="${cp}/backend/dist/js/angular-file-upload.min.js"
	type="text/javascript"></script>

<style>
.form-group .error-msg {
	display: none;
}

.form-group.has-error .error-msg {
	display: block;
}

.image-galary .image-item {
	width: 104px;
	height: 174px;
	padding: 2px;
	float: left;
	text-align: center;
	margin: 10px;
	cursor: pointer;
	color: #000;
}

.image-galary .image-item:hover {
	background-color: #428BCA;
}

.image-galary a.selected, #treeFolder a.selected {
   background-color: #428BCA;
   color: #fff;
}

.image-galary .image-item img {
	width: 100px;
	height: 100px;
	margin-bottom: 5px;
}

.image-galary .image-item img {
	font-size: 10px;
}

.image-galary .fa {
	font-size: 100px;
	color: #FEB902;
}

#treeFolder a:HOVER {
	color: #FFFFFF;
	background-color: #428BCA;
}

.my-drop-zone {
	border: dotted 3px lightgray;
	text-align: center;
	padding-top: 50px;
	padding-bottom: 50px;
}

.nv-file-over {
	border: dotted 3px red;
} /* Default class applied to drop zones on over */
.another-file-over-class {
	border: dotted 3px green;
}

.widget-color-dark a {
	color: #fff
}

#treeFolder a {
	color: #525754;
}
</style>

<div class="content-wrapper" ng-controller="FileUploadController as todoList" uploader="uploader" filters="queueLimit, customFilter"  ng-init="todoList.tooltip()">
	<div class="col-md-3">
		<div class="widget-box widget-color-dark">
			<div class="widget-header">
				<h5 class="widget-title">Thư Mục</h5>

				<div class="widget-toolbar">
					<a href="#" ng-click="todoList.createNewFolder()"  class="tooltip-success" data-toggle="tooltip"
                        title="Tạo mới thư mục"><i
						class="ace-icon fa green fa-plus bigger-125"></i> </a> <a href="#"
						data-action="fullscreen" class="orange2"> <i
						class="ace-icon fa fa-expand bigger-125 hidden"></i>
					</a> <a href="#" data-action="collapse"> <i
						class="ace-icon fa fa-chevron-up bigger-125"></i>
					</a>

				</div>
			</div>

			<div class="widget-body">
				<div class="widget-main" id="treeFolder" compile="treeViewFolders">
				</div>
			</div>

		</div>

	</div>
	<div class="col-md-9">
		<div class="widget-box widget-color-dark">
			<div class="widget-header">
				<h5 class="widget-title" compile="folderBreadcrumb"></h5>
				<div class="widget-toolbar">
					<a href="#" data-action="fullscreen" class="orange2"> <i
						class="ace-icon fa fa-expand bigger-125"></i>
					</a> <a href="#" data-action="collapse" id="collapse2"> <i
						class="ace-icon fa fa-chevron-up bigger-125"></i>
					</a>

				</div>

				<div class="widget-toolbar no-border" style="margin-top: 4px">
					<button class="btn btn-xs btn-danger bigger"
						ng-show="detailFs != null && detailFs.id != null && detailFs.parent != null"
						ng-click="todoList.deleteFileSystem()">
						<i class="ace-icon fa fa-recycle"></i>
						<spring:message code="message.button.delete"></spring:message>
					</button>

					<button class="btn btn-xs bigger btn-primary" id='btnSubmit'
						type="button" class="btn btn-primary btn-flat"
						ng-if="detailFs != null"
						ng-disabled="detailFs == null || detailFs.name == '' || detailFs.url == '/'"
						ng-click="todoList.save();">
						<spring:message code="message.button.save"></spring:message>
						<i class="ace-icon fa fa-save icon-on-right"></i>
					</button>
				</div>
			</div>

			<div class="widget-body" id="info-body">
				<div class="widget-main">
					<div class="form-group">
						<label> Tên </label> <input type="text" ng-model="detailFs.name"
							ng-blur="todoList.checkFsName()" class="form-control"
							placeholder="Tên không được để rỗng" />
					</div>

					<div class="form-group">
						<label>URL </label> <input type="text"
							value="${dataDomain}{{ detailFs.url != null ? detailFs.url : selectedFolder.url }}"
							class="form-control" disabled="true" style="cursor: text" />
					</div>

					<div class="form-group">
						<label>Upload File</label> <input type="file" class="form-control"
							nv-file-select="" uploader="uploader" multiple />
					</div>
				</div>
			</div>
		</div>
		<div class="well">
			<div id="image-galary" class="box-body image-galary"
				ng-click="todoList.clickOutsiteImageItem();">

				<a ng-repeat="item in uploader.queue" id="img-item-{{item.fs.id}}"
					class="image-item"
					ng-click="todoList.clickFileSystem($event, item.fs)">

					<p class="img">
						<img src="${dataDomain}{{item.fs.url}}">
					</p>
					<div class="progress" style="margin-bottom: 0;"
						ng-hide="item.isSuccess">
						<div class="progress-bar" role="progressbar"
							ng-style="{ 'width': item.progress + '%' }"></div>
					</div>

				</a> <a ng-repeat="fs in selectedFolder.children"
					ng-click="todoList.clickFileSystem($event, fs)"
					ng-dblclick="todoList.selectFolder(fs)" id="img-item-{{fs.id}}"
					class="image-item">

					<p ng-if="fs.folder">
						<i class="fa fa-folder-open"></i>
					</p>
					<p ng-if="fs.folder" class='folder-ediable'>{{fs.name}}</p> <img
					ng-if="!fs.folder" src="${dataDomain}{{fs.url}}" />
					<p ng-if="!fs.folder" class="name">{{ fs.name }}</p>

				</a>
				<div style="clear: both"></div>

			</div>
		</div>
	</div>
</div>

<jsp:include page="fileuploadController.jsp" />
