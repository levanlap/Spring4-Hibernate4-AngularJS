<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="cp" value="${pageContext.request.servletContext.contextPath}" scope="request" />


	
<style>
			/* some elements used in demo only */
			.dropdown-preview ul li{
				margin: 0 5px;
				display: block;
				margin-left: -20px;
			}
			.dropdown-preview ul li:before{
			font: normal normal normal 14px/1 FontAwesome;
				content: "\f0da";
				margin-right: 5px;
				color: #438EB9;
			}
		</style>
<div class="content-wrapper" ng-controller="PageListController as pageList">
	<!-- Main content -->
	<section class="content">
	<!-- #section:elements.dropdown -->
									
	
		<div class="row">
			<div class="col-md-3" id="pageBodyTree" style="display: none">
				<div class="widget-box widget-color-dark" ng-init="pageList.tooltip()">
						<div class="widget-header">
							<h5 class="widget-title">Trang</h5>

		
							<div class="widget-toolbar">
								<a href="#" ng-click="pageList.createNew()" class="tooltip-success"
               data-toggle="tooltip" title="Thêm trang mới">
									<i class="ace-icon fa green fa-plus bigger-125"></i>
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
							<div class="widget-main" >
								<div class="dropdown-preview"  id="treeCatalog" compile="pageList.getHtml(messages)"></div>
							</div>
						</div>
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col (left) -->
			<div class="col-md-9" style="display: none" id="pageBodyDetail">
				<div class="widget-box widget-color-dark">
						<div class="widget-header">
							<h5 class="widget-title">{{pageBodyTitle}}</h5>

		
							<div class="widget-toolbar">
								
								<a href="#" data-action="fullscreen" class="orange2">
									<i class="ace-icon fa fa-expand bigger-125"></i>
								</a>
								<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up bigger-125"></i>
								</a>

							</div>
						</div>

						<div class="widget-body"><form name="pageForm" ng-submit="pageList.save()" novalidate="">
							<div class="widget-main">
								
						
										
										<%-- Name --%>
										<div class="form-group" ng-class="{ 'has-error' : pageForm.name.$invalid &amp;&amp; !pageForm.name.$pristine }">
											<label>Tên Trang <span style="color: #f56954">(*)</span></label> 
												<input type="text" maxlength="100" ng-disabled="(page.id==1 || page.id==2 || page.id==4 )" name="name" class="form-control ng-dirty ng-valid ng-valid-required" 
												ng-model="page.name" required="" ng-blur="pageList.makeFriendURL()"
												placeholder="Tên trang">
											<p ng-show="pageForm.name.$invalid &amp;&amp; !pageForm.name.$pristine" class="help-block ng-hide">
												Tên trang thì bắt buộc
											</p>
										</div>
										
										<%-- FriendURL --%>
										<div class="form-group" style="margin-bottom: 0;">
											<label>
												SEO <span style="color: #f56954">(*)</span>
												<i style="font-size: 12px;">Mục này được tự động tạo bởi tên trang</i>
											</label>
										</div>
										<div class="input-group" style="margin-bottom: 15px">
											<span class="input-group-addon">http://tuvanhoatuoi.com/</span>
											<input type="text" id="friendURL" name="friendURL" class="form-control" 
												ng-model="page.friendURL">
										</div>
										
										<%-- Order --%>
										<div class="form-group">
											<label for="name">Thứ tự </label> 
											<input type="number" class="form-control" id="sortOrder" name="sortOrder" ng-model="page.sortOrder" 
												placeholder="Thứ tự trang">
										</div>
										
										<%-- Content --%>
										<div class="form-group" style="margin-bottom: 0;">
											<label> Nội dung  <span style="color: #f56954">(*)</span></label> 
										</div>
										<div>
											<textarea name="content" ckeditor="editorOptions" ng-model="page.content"></textarea>
										</div>
										
							</div>
							<div class="widget-toolbox padding-8 clearfix">

								<button id='btnSubmit' type="submit" class="btn btn-app btn-grey btn-xs radius-4 pull-right" ng-disabled="pageList.disableSaveButton();">
									<i class="ace-icon fa fa-floppy-o bigger-160"></i>
									<spring:message code="message.button.save"></spring:message>
								</button>
								<button class="btn btn-app btn-danger btn-xs radius-4 pull-right" type="button" ng-show="page.id != null" ng-click="pageList.delete(page.id)" >
									<i class="ace-icon fa fa-recycle bigger-160"></i>
									<spring:message code="message.button.delete"></spring:message>
								</button>
										
							</div>
							</form>
						</div>
				</div>
			</div>
		</div>
		<!-- Small modal -->
		<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-hidden="true" id="info-modal">
			<div class="modal-dialog modal-sm" style="width: 300px">
				<div class="modal-content">
					<div class="box box-info" style="margin-bottom: 0px">
						<div class="box-header">
							<h3 class="box-title">
								<spring:message code="message.delete.title" />
							</h3>
							<div class="box-tools pull-right">
								<button class="btn btn-info btn-xs" data-dismiss="modal">
									<i class="fa fa-times"></i>
								</button>
							</div>
						</div>
						<div class="box-body">
							<p class="text-green">
								<spring:message code="message.delete.title"></spring:message>
								:
								<code>{{deleteName}}</code>
							</p>
							<spring:message code="message.delete.content" />
						</div>
						<!-- /.box-body -->
						<div class="box-footer" style="text-align: right;">
							<button class="btn btn-default btn-sm" data-dismiss="modal">
								<spring:message code="message.button.cancel" />
							</button>
							<button class="btn btn-primary btn-sm" ng-click="pageList.delete(deleteId)">
								<spring:message code="message.button.yes" />
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- /.content -->
</div>
<!-- /.right-side -->
<script>
angular.module('app',['ngCkeditor'])
.controller('PageListController',PageListController)
.directive('compile',compile);

function PageListController($scope, $http) {
	
    $scope.editorOptions = {
            language: 'vi'
        };
    
	var pageList = this;
	$scope.pageBodyTitle='Tạo Mới';
	$("#pageBodyDetail").show("slow");
	
    pageList.buildPageTreeView = function() {
		$http.get('buildPageTreeView').success(function(data){
	  		$scope.treeViewPages = data.JSON;
	    });
	};
	
	pageList.tooltip = function() {
		$('[data-toggle="tooltip"]').tooltip();
	};
	
    pageList.getHtml = function(html){
        return $scope.treeViewPages;
    };
    
	pageList.loadListPages = function() {
		$http.get('listPages').success(function(data){
	  		$scope.availableParentPages = data;
	    });
	};
	
	pageList.loadListPages();
	pageList.buildPageTreeView();
	
	pageList.edit = function(id) {
		$http.get('findPage/'+id).success(function(response){
			$scope.page = response;
			$scope.pageBodyTitle='Chi Tiết';
			$("#pageBodyDetail").show("slow");
        });
	};
	
	pageList.delete = function(id) {
		BootstrapDialog.confirm({
            message: '<spring:message code="message.delete.content" />',
            type: BootstrapDialog.TYPE_WARNING,
            btnOKClass: 'btn-warning',
            callback: function(result) {
                if(result) {
                	$http.delete('deletePage/'+id).success(function(response){
           			 if(response.JSON != 'ERROR'){
           				$scope.treeViewPages = response.JSON;
           				pageList.createNew();
           				thongBao.xoaThanhCong();
           				pageList.loadListPages();
           			 }else{
           				thongBao.xoaKhongThanhCong();
           			 }
           	        });
                }
            }
        });
	};
	
	pageList.createNew = function() {
		$scope.page={};
		$scope.pageBodyTitle='Tạo Mới';
		$scope.pageForm.$setPristine();
		$scope.pageForm.$setValidity();
		$("#pageBodyDetail").show("slow");
		thongBao.taoMoi("Trang");
	};
	
	pageList.disableSaveButton = function(){
		return (
				$scope.page == null
				|| $scope.page.name == null || $scope.page.name == ''
				|| $scope.page.content == null || $scope.page.content == ''
		);
	};
	
	pageList.save = function() {
		console.log( JSON.stringify($scope.page) );
		$scope.page.friendURL = "trang/"+$scope.page.friendURL;
	 	$http.post('savePage',$scope.page).success(function(data){
	 		thongBao.luuTruThanhCong();
			 pageList.loadListPages();
			 pageList.buildPageTreeView();
			 $scope.page = data;
			 $scope.pageBodyTitle='Chi Tiết';
        });
	};
	
	pageList.makeFriendURL = function(){
		$http.post('makePageFriendURL',$scope.page).success(function(data){
			$scope.page.friendURL = data.friendURL;
			$("#friendURL").val( $scope.page.friendURL );
        });
	}

}

function compile($compile) {
	return function(scope, element, attrs) {
        scope.$watch(
            function(scope) {
                return scope.$eval(attrs.compile);
            },
            function(value) {
                element.html(value);
                $compile(element.contents())(scope);
                $('#treePage').treed({openedClass : 'glyphicon-folder-open', closedClass : 'glyphicon-folder-close'});
                $("#pageBodyTree").show("slow");
            }
        );
    };
}
</script>