<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<style>
table {
	font-size: 13px
}
.paging-customer{
	margin-top: 0px !important;
	margin-bottom: 0px !important;
}
</style>
<div id="blog-container" class="content-wrapper"
	ng-controller="BlogListController as todoList" ng-init="todoList.init()">
  
   <div class="widget-box widget-color-dark" id="body-blog">
		<!-- #section:custom/widget-box.options -->
		<div class="widget-header">
			<h5 class="widget-title">
				<i class="ace-icon fa fa-table"></i> Blogs
			</h5>
				<div class="widget-toolbar">
				<a href="#" ng-click="todoList.createNew()" class="tooltip-success"
					data-toggle="tooltip" title="Thêm blog mới"> <i
					class="ace-icon fa fa-plus bigger-125"></i>
				</a> <a href="#" data-action="fullscreen" class="orange2"> <i
					class="ace-icon fa fa-expand bigger-125"></i>
				</a> <a href="#" data-action="collapse"> <i
					class="ace-icon fa fa-chevron-up bigger-125"></i>
				</a>
			</div>
			<div class="widget-toolbar"><div class="input-group" style="width: 300px;float: left;margin-top: 2px">
				<span class="input-group-addon">
					<i class="ace-icon fa fa-check"></i>
				</span>

				<input type="text" class="form-control search-query" ng-model="name" placeholder="Tìm theo tựa đề">
				<span class="input-group-btn">
					<button type="button" class="btn btn-purple btn-sm" ng-click="todoList.findByName()">
						<span class="ace-icon fa fa-search icon-on-right bigger-110"></span>
						Search
					</button>
				</span>
			</div>
				
			</div>
		</div>
		<div class="widget-body">
			<div class="widget-main no-padding">
				<table id="simple-table"
					class="table table-striped table-bordered table-hover"
					ng-cloak="true">
					<thead class="primary">
						<tr>
							<th class="center"><label class="pos-rel"> <i
									class="menu-icon fa fa-flag"></i> No.
							</label></th>
							<th>
								<i class="menu-icon fa fa-picture-o"></i> <spring:message code="blog.image" /> 
							</th>
							<th><i class="menu-icon fa fa-newspaper-o"></i> <spring:message
									code="blog.title" /></th>

							<th class="text-center"><i class="menu-icon fa fa-tasks"></i> Nghiệp
								vụ</th>
						</tr>
					</thead>

					<tbody>
						<tr ng-repeat="blog in blogs track by $index">
							<td class="center"><label class="pos-rel"> <span
									class="lbl">{{$index+1}}</span>
							</label></td>

							<td>
								 <img src="${dataDomain}{{ blog.image.url }}"  style="width: 25px; height: 25px"/> 
							</td>
							<td>{{ blog.title }}</td>

							<td ng-init="todoList.tooltip()" class="text-center">
									<span class="tooltip-info"
										data-toggle="tooltip" title="Chỉnh sữa"
                                       onmouseover="themHieuUngXoay(this)"
                                       onmouseout="xoaHieuUngXoay(this)"
										ng-click="todoList.edit(blog.id)">
										<i class="ace-icon fa blue fa-pencil-square-o bigger-150"></i>
									</span>

									<span class="tooltip-error"
										data-toggle="tooltip" title="Xóa khỏi danh sách"
                              onmouseover="themHieuUngXoay(this)"
                                       onmouseout="xoaHieuUngXoay(this)"
										ng-click="todoList.delete(blog.id)">
										<i class="ace-icon fa red fa-recycle bigger-150"></i>
									</span>
							</td>
						</tr>

					</tbody>
				</table>
			</div>
			<div class="modal-footer no-margin-top">
				<paging
                    page="paging.currentPage" 
                    page-size="paging.pageSize" 
                    hide-if-empty="true"
                    show-prev-next="true"
                    total="paging.total"
                    ul-class="pagination paging-customer"
                    paging-action="todoList.DoCtrlPagingAct( page, pageSize)"/>
			</div>
		</div>
	</div>


	<!-- DETAIL -->
	<div class="widget-box widget-color-dark" id="detailBlog"
		style="display: none">
		<div class="widget-header">
			<h5 class="widget-title">
				<spring:message code="blog.detail" />
			</h5>
			<div class="widget-toolbar">
				 <a href="#" data-action="fullscreen" class="orange2"> <i
					class="ace-icon fa fa-expand bigger-125"></i>
				</a> <a href="#" data-action="collapse"> <i
					class="ace-icon fa fa-chevron-up bigger-125"></i>
				</a>

			</div>
		</div>

		<div class="widget-body">
			<div class="widget-main">
				
				<form name="blogForm" novalidate>
					<div class="tabbable">
						<ul class="nav nav-tabs" id="myTab">
							<li class="active"><a data-toggle="tab" href="#home"> <i
									class="green ace-icon fa fa-font bigger-120"></i> Tiêu đề
							</a></li>
							<li><a data-toggle="tab" href="#image"><i class="blue ace-icon fa fa-picture-o bigger-120"></i> Hình ảnh </a></li>
							<li><a data-toggle="tab" href="#messages"><i class="orange2 ace-icon fa fa-indent bigger-120"></i> Nội dung </a></li>
						</ul>

						<div class="tab-content" style="border: 1px solid #c5d0dc;">
							<div id="home" class="tab-pane fade in active">
								<%-- Name --%>
								<div class="form-group"
									ng-class="{ 'has-error' : blogForm.title.$invalid &amp;&amp; !blogForm.title.$pristine }">
									<label> <spring:message code="blog.title" /> <span
										style="color: #f56954">(*)</span>
									</label> <input type="text" name="title"
										class="form-control ng-dirty ng-valid ng-valid-required"
										required="" ng-model="blog.title"
										ng-blur="todoList.makeFriendURL()"
										placeholder="<spring:message code="blog.title.hint" />">
									<p
										ng-show="blogForm.title.$invalid &amp;&amp; !blogForm.title.$pristine"
										class="help-block ng-hide">
										<spring:message code="blog.title.required" />
									</p>
								</div>

								<%-- Friend URL --%>
								<div class="form-group" style="margin-bottom: 0;">
									<label> <spring:message code="blog.seo" /> <span
										style="color: #f56954">(*)</span> <i style="font-size: 12px;">
											<spring:message code="blog.seo.hint" />
									</i></label> </label>
								</div>
								<div class="input-group" style="margin-bottom: 15px">
									<span class="input-group-addon">http://tuvanhoatuoi.com/the-gioi-cac-loai-hoa/</span>
									<input type="text" maxlength="50" id="friendURL"
										name="friendURL" class="form-control"
										ng-model="blog.friendURL" ng-disabled="true">
								</div>
							</div>

							<div id="image" class="tab-pane fade">
								<%-- Image --%>
								<div class="form-group">
									<label> <spring:message code="blog.image" /> <span
										style="color: #f56954">(*)</span>
									</label> <a ng-click="todoList.selectBlogImage()"
										class="btn btn-link"><spring:message
											code="blog.select.image.from.galary" /></a>
									<div ng-if="blog.image != null">
										<img id="blogImage" alt=""
											src="${dataDomain}{{blog.image.url}}"
											style="width: 100px; height: 100px; margin: 10px;"
											class="img-rounded">
									</div>
								</div>
							</div>

							<div id="messages" class="tab-pane fade">
								<%-- Content --%>
								<div class="form-group"
									ng-class="{ 'has-error' : blogForm.content.$invalid &amp;&amp; !blogForm.content.$pristine }">
									<label> <spring:message code="blog.content" /> <span
										style="color: #f56954">(*)</span>
									</label>
									<textarea name="content" ckeditor="editorOptions"
										ng-model="blog.content"></textarea>
									<p
										ng-show="blogForm.content.$invalid &amp;&amp; !blogForm.content.$pristine"
										class="help-block ng-hide">
										<spring:message code="blog.content.required" />
									</p>
								</div>
							</div>

						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer no-margin-top">
				<button id='btnSubmit' type="button" class="btn btn-app btn-grey btn-xs radius-4 pull-right" ng-click="todoList.save()"
					ng-disabled="todoList.disabledSaveButton();">
									<i class="ace-icon fa fa-floppy-o bigger-160"></i>
									<spring:message code="message.button.save"></spring:message>
								</button>
				<button  type="button" class="btn btn-app btn-warning btn-xs radius-4 pull-left" style="width: 90px" onclick="$('#detailBlog').hide();$('#body-blog').show('slow')">
					<i class="ace-icon fa fa-list bigger-160"></i>
					<spring:message code="message.button.list" />
				</button>
				
			</div>
		</div>
	</div>

	<!-- /.content -->
</div>
<!-- /.right-side -->
<script>
var app = angular.module('app',["bw.paging",'ngCkeditor'])
app.controller('BlogListController',BlogListController);

function BlogListController($rootScope, $scope, $http) {

	var todoList = this;
	
	$scope.$on('selectFile', function(event, dataResponse) {
		console.log("=======================================selectFile");
		console.log(dataResponse);
		if(dataResponse != null && dataResponse.data != null){
			$scope.blog.image = dataResponse.data;			
		}
	}); 
	
	todoList.tooltip = function() {
		$('[data-toggle="tooltip"]').tooltip();
	};
	
	todoList.init = function(){
		$scope.paging={total:${total },currentPage:1,pageSize:10};
		$scope.editorOptions = {language: 'vi'};
		todoList.loadBlogs();
	}
	
	todoList.loadBlogs = function(){
		$http.get('listBlog/'+$scope.paging.currentPage+"/"+$scope.paging.pageSize).success(function(data){
	  		$scope.blogs = data;
	 		$('#body-blog').show();
        });
	}
	
	todoList.createNew = function(){
		$scope.blog = {id: null, title: null, image: null, content : null};
  		$("#detailBlog").show();
  		$('#body-blog').hide();
  		$("#alert-success").hide();
	};

	todoList.edit = function(id) {
		for(i in $scope.blogs) {
            if($scope.blogs[i].id == id) {
                $scope.blog = angular.copy($scope.blogs[i]);
          		$("#detailBlog").show('slow');
          		$('#body-blog').hide('slow');
            }
        }
	};
	
	todoList.delete = function(id) {
		BootstrapDialog.confirm({
            message: '<spring:message code="message.delete.content" />',
            type: BootstrapDialog.TYPE_WARNING,
            btnOKClass: 'btn-warning',
            callback: function(result) {
                if(result) {
                	$http.delete('deleteBlog/'+id).success(function(response){
      	       			 angular.forEach($scope.blogs,function(obj, index) {
      	       		          if(obj.id == id){
      	       		        	  $scope.blogs.splice(index, 1);
      	       		          }
      	       		      });
      	       	        });
                }
            }
        });
	};
		
	todoList.save = function() {
		 $http.post('saveBlog',$scope.blog).success(function(data){
			 BootstrapDialog.show({
		            message: '<spring:message code="message.save.success" />',
		            type: BootstrapDialog.TYPE_SUCCESS,
		            buttons: [{
		                label: '<spring:message code="message.button.yes" />',
		                action: function(dialogItself){
		                    dialogItself.close();
		                    todoList.loadBlogs();
		       			 	$("#detailBlog").hide();
		                }
		            }]
	        	});
			 
			
			 }
		); 
	};
	
	todoList.DoCtrlPagingAct = function( page, pageSize){
		$scope.paging.currentPage = page;
		$scope.paging.pageSize = pageSize;
		todoList.loadBlogs();
    };
	
    $scope.name = null;
    todoList.findByName = function(){
    	$scope.paging.currentPage = 1;
    	console.log($scope.name);
		$http.get('findByName/'+$scope.paging.currentPage+"/"+$scope.paging.pageSize+"/"+$scope.name).success(function(data){
	  		$scope.blogs = data;
        });
		$http.get('countByName/'+$scope.name).success(function(data){
	  		$scope.paging.total = data;
        });
	}
    
	todoList.disabledSaveButton = function(){
		return $scope.blog == null
				|| $scope.blog.title == null || $scope.blog.title == '' 
				|| $scope.blog.image == null 
				|| $scope.blog.content == null || $scope.blog.content == '';
	};
	
	todoList.makeFriendURL = function(){
		$http.post('makeBlogFriendURL',$scope.blog).success(function(data){
			$scope.blog.friendURL = data.friendURL;
			$("#friendURL").val( $scope.blog.friendURL );
        });
	};
	
	/* Display the gallery image popup to select new main image for product */
	todoList.selectBlogImage = function(){
		$rootScope.$broadcast('showFileUpload', {boxId : 'blog-container'});
	}
	
}

</script>
<jsp:include page="fileupload/fileupload-fragment.jsp" />
