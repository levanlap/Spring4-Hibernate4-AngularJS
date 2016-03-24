<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style>
	.form-group .error-msg {
		display: none;
	}
	
	.form-group.has-error .error-msg {
		display: block;
	}
	
	.image-galary .image-item{
		width: 104px; 
		height: 174px; 
		padding: 2px;
		float: left; 
		text-align: center; 
		margin: 10px;
		cursor: pointer;
		color: #000;
	}
	
	.image-galary .image-item:hover{
		background-color: #3c8dbc;
	}
	
	.image-galary a.selected, #treeFolder a.selected{
		background-color: #3c8dbc;
	}
	
	.image-galary .image-item img{
		width: 100px; 
		height: 100px; 
		margin-bottom: 5px;
	}
	
	.image-galary .image-item img{
		font-size: 10px;
	}
	
	.image-galary .fa{
		font-size: 100px;
		color: #FEB902;
	}
	
	#treeFolder a:HOVER{
		color: #FFFFFF;
		background-color: #3c8dbc;
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
	.widget-color-dark a{
	color:#fff}
	#treeFolder a{
	color:#525754
	}
</style>

<div class="content-wrapper" id="file-upload-container" style="display: none" 
	ng-controller="FolderListController as todoList" >

	<div class="col-md-3">
		<div class="widget-box widget-color-dark">
				<div class="widget-header">
					<h5 class="widget-title">Thư Mục</h5>


					<div class="widget-toolbar">
						<a href="#" ng-click="todoList.createNewFolder()" onclick="$('#collapse2').click()"><i class="ace-icon fa fa-plus bigger-125"></i>
						</a>
						
						<a href="#" data-action="fullscreen" class="orange2">
							<i class="ace-icon fa fa-expand bigger-125"></i>
						</a>
						<a href="#" data-action="collapse">
								<i class="ace-icon fa fa-chevron-up bigger-125"></i>
						</a>

					</div>
				</div>

				<div class="widget-body">
					<div class="widget-main"  id="treeFolder" compile="treeViewFolders">

					</div>
				</div>
		</div>

	</div>
	
		<div class="col-md-9">
				<div class="widget-box widget-color-dark">
						<div class="widget-header">
							<h5 class="widget-title" compile="folderBreadcrumb"></h5>
							<div class="widget-toolbar">
								<a href="#" data-action="fullscreen" class="orange2">
									<i class="ace-icon fa fa-expand bigger-125"></i>
								</a>
								<a href="#" data-action="collapse" id="collapse2">
									<i class="ace-icon fa fa-chevron-up bigger-125"></i>
								</a>
							</div>
							
							<div class="widget-toolbar no-border" style="margin-top: 4px">
								<button class="btn btn-xs bigger btn-grey" id='btnSubmit' type="button" class="btn btn-primary btn-flat" 
								ng-click="todoList.cancelSelectFile();">
									<i class="ace-icon fa fa-arrow-left"></i>
									Back
								</button>
									<button class="btn btn-xs btn-primary bigger" ng-show="detailFs != null && !detailFs.folder" 
								ng-click="todoList.selectFile();">
									<i class="ace-icon fa fa-check"></i>
									Lựa chọn
								</button>
							</div>
						</div>

						<div class="widget-body" id="info-body">
							<div class="widget-main" style="padding:0px;margin-bottom:-20px">
								<div class="well">
									<div id="image-galary" class="box-body image-galary" ng-click="todoList.clickOutsiteImageItem();">
											
												<a ng-repeat="item in uploader.queue"
													 id="img-item-{{item.fs.id}}" class="image-item"
													 ng-click="todoList.clickFileSystem($event, item.fs)" >
										
													<p class="img"><img src="${dataDomain}{{item.fs.url}}" ></p>
													<div class="progress" style="margin-bottom: 0;" ng-hide="item.isSuccess">
									                     <div class="progress-bar" role="progressbar" ng-style="{ 'width': item.progress + '%' }"></div>
									                </div>
													
												</a>
											
												<a ng-repeat="fs in selectedFolder.children"
													 ng-click="todoList.clickFileSystem($event, fs)" 
													 ng-dblclick="todoList.selectFolder(fs)"
													 id="img-item-{{fs.id}}" class="image-item" >
													 
													<p ng-if="fs.folder"><i class="fa fa-folder-open"></i></p>
													<p ng-if="fs.folder" class='folder-ediable'>{{fs.name}}</p>
													
													<img ng-if="!fs.folder" ng-dblclick="todoList.selectFile();" src="${dataDomain}{{fs.url}}"/>
													<p ng-if="!fs.folder" class="name">{{ fs.name }}</p>
													
												</a>
												<div style="clear: both"></div>
											
											</div>
								</div>
							</div>
						</div>
				</div>
				
			</div>
	
	
</div>

<jsp:include page="fileuploadController-fragment.jsp" />
