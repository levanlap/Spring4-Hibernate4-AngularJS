<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="content-wrapper" ng-controller="CatalogListController as catalogList">
	<!-- Main content -->
			<div class="col-md-3" id="catalogBodyTree">
				<div class="widget-box widget-color-dark"  ng-init="catalogList.tooltip()">
						<div class="widget-header">
							<h5 class="widget-title">Danh sách</h5>
							<div class="widget-toolbar">
								<a href="#" ng-click="catalogList.createNew()" class="tooltip-success"
               data-toggle="tooltip" title="Thêm cataloge mới">
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
							<div class="widget-main"  id="treeCatalog" compile="catalogList.getHtml(messages)">
							</div>
						</div>
				</div>

			</div>
			<!-- /.col (left) -->
			<div class="col-md-9" style="display: none" id="catalogBodyDetail">
				<div class="widget-box widget-color-dark">
						<div class="widget-header">
							<h5 class="widget-title">{{catalogBodyTitle}}</h5>

							<!-- #section:custom/widget-box.toolbar -->
							<div class="widget-toolbar">
								<a href="#" data-action="fullscreen" class="orange2">
									<i class="ace-icon fa fa-expand bigger-125"></i>
								</a>
								<a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-up bigger-125"></i>
								</a>
								

							</div>

							<!-- /section:custom/widget-box.toolbar -->
						</div>

						<div class="widget-body">
							<div class="widget-main">
								<form name="catalogForm" ng-submit="catalogList.save()" novalidate="">
								
									<%-- Name --%>
									<div class="form-group" ng-class="{ 'has-error' : catalogForm.name.$invalid &amp;&amp; !catalogForm.name.$pristine }">
										<label><spring:message code="catalog.name"/> <span style="color: #f56954">(*)</span></label> 
											<input type="text" maxlength="100" name="name" class="form-control ng-dirty ng-valid ng-valid-required" 
											ng-model="catalog.name" required="" ng-blur="catalogList.makeFriendURL()"
											placeholder="<spring:message code="catalog.name.hint" />">
										<p ng-show="catalogForm.name.$invalid &amp;&amp; !catalogForm.name.$pristine" class="help-block ng-hide">
											<spring:message code="catalog.name.required" />
										</p>
									</div>
									
									<%-- FriendURL --%>
									<div class="form-group" style="margin-bottom: 0;">
										<label>
											<spring:message code="catalog.seo"/> <span style="color: #f56954">(*)</span>
											<i style="font-size: 12px;"><spring:message code="catalog.seo.hint" /></i>
										</label>
									</div>
									<div class="input-group" style="margin-bottom: 15px">
										<span class="input-group-addon">http://tuvanhoatuoi.com/san-pham/</span>
										<input type="text" id="friendURL" name="friendURL" class="form-control" 
											ng-model="catalog.friendURL" >
									</div>
									
									<%-- Parent --%>
									<div class="form-group" ng-class="{ 'has-error' : catalogForm.parentId.$invalid &amp;&amp; !catalogForm.parentId.$pristine }">
										<label><spring:message code="catalog.parent.name"/> <span style="color: #f56954">(*)</span></label> 
										<select class="form-control" id="parentId" name="parentId" ng-model="catalog.parentId">
											<option value=""><spring:message code="catalog.parent.hint" /></option>
											<option value="0">Root</option>
											<option ng-repeat="parentCatalog in availableParentCatalogs track by $index" value="{{ parentCatalog.id }}">{{ parentCatalog.name }}</option>
										</select>
										<p ng-show="catalogForm.parentId.$invalid &amp;&amp; !catalogForm.parentId.$pristine" class="help-block ng-hide">
											<spring:message code="catalog.parent.required" />
										</p>
									</div>
									
									<%-- Order --%>
									<div class="form-group">
										<label for="name"><spring:message code="catalog.parent.sortOrder"/> </label> 
										<input type="number" class="form-control" id="sortOrder" name="sortOrder" ng-model="catalog.sortOrder" 
											placeholder="<spring:message code="catalog.sortOrder.hint" />">
									</div>
									
							</form>
							</div>
							<div class="widget-toolbox padding-8 clearfix">

								<button id='btnSubmit' type="submit" class="btn btn-app btn-grey btn-xs radius-4 pull-right" ng-disabled="catalogForm.name.$invalid">
									<i class="ace-icon fa fa-floppy-o bigger-160"></i>
									<spring:message code="message.button.save"></spring:message>
								</button>
								<button class="btn btn-app btn-danger btn-xs radius-4 pull-right" type="button" ng-show="catalog.id != null" ng-click="catalogList.delete(catalog.id)" >
									<i class="ace-icon fa fa-recycle bigger-160"></i>
									<spring:message code="message.button.delete"></spring:message>
								</button>
										
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
							<button class="btn btn-primary btn-sm" ng-click="catalogList.delete(deleteId)">
								<spring:message code="message.button.yes" />
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- /.content -->
</div>
<!-- /.right-side -->
<script>
angular.module('app',[])
.controller('CatalogListController',CatalogListController)
.directive('compile',compile);

function CatalogListController($scope, $http) {
	$("#activebreadcrumb").html("Danh mục");
 
    
	var catalogList = this;
	$scope.catalogBodyTitle='<spring:message code="catalog.new"/>';
	$("#catalogBodyDetail").show("slow");
	
    catalogList.buildTreeView = function() {
		$http.get('buildTreeView').success(function(data){
	  		$scope.treeViewCatalogs = data.JSON;
	    });
	};
	
	catalogList.tooltip = function() {
		$('[data-toggle="tooltip"]').tooltip();
	};
	
    catalogList.getHtml = function(html){
        return $scope.treeViewCatalogs;
    };
    
	catalogList.loadListCatalogs = function() {
		$http.get('listCatalogs').success(function(data){
	  		$scope.availableParentCatalogs = data;
	    });
	};
	
	catalogList.loadListCatalogs();
	catalogList.buildTreeView();
	
	catalogList.edit = function(id) {
		$http.get('findCatalog/'+id).success(function(response){
			$scope.catalog = response;
			$scope.catalogBodyTitle='<spring:message code="catalog.detail"/>';
			$("#catalogBodyDetail").show("slow");
        });
	};
	
	catalogList.delete = function(id) {
		BootstrapDialog.confirm({
            message: '<spring:message code="message.delete.content" />',
            type: BootstrapDialog.TYPE_WARNING,
            btnOKClass: 'btn-warning',
            callback: function(result) {
                if(result) {
                	$http.delete('deleteCatalog/'+id).success(function(response){
           			 if(response.JSON != 'ERROR'){
           				 $scope.treeViewCatalogs = response.JSON;
           				catalogList.createNew();
           			 }else{
           				BootstrapDialog.show({
           		            message: '<spring:message code="catalog.can.not.delete" />',
           		            type: BootstrapDialog.TYPE_DANGER,
           		            buttons: [{
           		                label: '<spring:message code="message.button.cancel" />',
           		                action: function(dialogItself){
           		                    dialogItself.close();
           		                }
           		            }]
           	        	});
           			 }
           	        });
                }
            }
        });
	};
	
	catalogList.createNew = function() {
		$scope.catalog={};
		$scope.catalogBodyTitle='<spring:message code="catalog.new"/>';
		$scope.catalogForm.$setPristine();
		$scope.catalogForm.$setValidity();
		$("#catalogBodyDetail").show("slow");
		thongBao.taoMoi("Cataloge");
	};
	
	catalogList.save = function() {
	 	$http.post('saveCatalog',$scope.catalog).success(function(data){
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
			 catalogList.loadListCatalogs();
			 catalogList.buildTreeView();
			 $scope.catalog = data;
			 $scope.catalogBodyTitle='<spring:message code="catalog.detail"/>';
        });
	};
	
	catalogList.makeFriendURL = function(){
		$http.post('makeCatalogFriendURL',$scope.catalog).success(function(data){
			$scope.catalog.friendURL = data.friendURL;
			$("#friendURL").val( $scope.catalog.friendURL );
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
                $('#treeCatalog').treed({openedClass : 'icon-folder blue ace-icon fa fa-folder-open', closedClass : 'icon-folder blue ace-icon fa fa-folder'});
                $("#catalogBodyTree").show("slow");
            }
        );
    };
}
</script>

