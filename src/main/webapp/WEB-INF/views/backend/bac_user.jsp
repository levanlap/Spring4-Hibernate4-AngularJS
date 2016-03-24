<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="content-wrapper" ng-controller="UserListController as userList" ng-init="userList.init()">
	<div class="widget-box widget-color-dark" id="body-user">
			<div class="widget-header">
				<h5 class="widget-title"><spring:message code="user.list" /></h5>
				<div class="widget-toolbar">
					<a href="#" ng-click="userList.createNew()" class="tooltip-success" data-toggle="tooltip" title="Tạo mới nhân viên">
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
				<div class="widget-main no-padding">
					<table class="table table-striped table-bordered table-hover" ng-cloak="true">
							<thead class="primary">
								<tr>
									<th class="center"><label class="pos-rel"> <i
										class="menu-icon fa fa-flag"></i> No.
									</label></th>
									<th><i class="menu-icon fa fa-user"></i> <spring:message code="user.name" /></th>
									<th><i class="menu-icon fa fa-sign-in"></i> <spring:message code="user.username" /></th>
									<th><i class="menu-icon fa fa-envelope"></i> <spring:message code="user.email" /></th>
									<%--<th><spring:message code="user.role" /></th>--%>
									<th class="text-center"><i class="menu-icon fa fa-check"></i> <spring:message code="user.active" /></th>
									<th><i class="menu-icon fa fa-tasks"></i> <spring:message code="user.action" /></th>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="user in users track by $index">
									<td class="center"><label class="pos-rel"> <span
											class="lbl">{{$index+1}}</span>
										</label>
									</td>
									<td>{{ user.name }} <small class="badge pull-right bg-green" ng-show="!user.enabled">new</small></td>
									<td>{{ user.username }}</td>
									<td>{{ user.email }}</td>
									<%--<td><span ng-repeat="role in user.userRole"><i class="fa fa-fw fa-pencil"></i> {{role.role}}</span></td>--%>
									<td class="text-center"><span class="label label-success arrowed arrowed-right" ng-if="user.enabled ==1">Đã kích hoạt</span>
									<span class="label label-warning arrowed-in-right arrowed-in" ng-if="user.enabled !=1">Chưa kích hoạt</span></td>
									
								 
									<td  class="text-center"  ng-init="userList.tooltip()">

										<span class="tooltip-info"
											data-toggle="tooltip" title="Chỉnh sữa"
											ng-click="userList.edit(user.username)">
											<i class="ace-icon fa blue fa-pencil-square-o bigger-150" onmouseover="themHieuUngXoay(this)" onmouseout="xoaHieuUngXoay(this)"></i>
										</span>
	
										<span class="tooltip-error"
											data-toggle="tooltip" title="Xóa khỏi danh sách"
											ng-click="userList.delete(user.username)" >
											<i class="ace-icon fa red fa-recycle bigger-150" onmouseover="themHieuUngXoay(this)" onmouseout="xoaHieuUngXoay(this)"></i>
										</span>
	
										<span class="tooltip-warning" 
										ng-show="user.enabled == 0" data-toggle="tooltip"
												title="Cho phép hoạt động"
												ng-click="userList.active(user.username)">
											<i class="ace-icon fa orange fa-unlock bigger-150" onmouseover="themHieuUngXoay(this)" onmouseout="xoaHieuUngXoay(this)"></i>
										</span>
										
										<span class="tooltip-warning" 
										ng-show="user.enabled == 1" data-toggle="tooltip"
											title="Ngừng hoạt động nhân viên này"
											ng-click="userList.nonActive(user.username)">
											<i class="ace-icon fa orange fa-lock bigger-150" onmouseover="themHieuUngXoay(this)" onmouseout="xoaHieuUngXoay(this)"></i>
										</span>

									</td>
								</tr>
							</tbody>
						</table>
				</div>
				<div class="modal-footer no-margin-top">
				<paging page="paging.currentPage" page-size="paging.pageSize"
					hide-if-empty="true" show-prev-next="true" total="paging.total"
					ul-class="pagination paging-customer"
					paging-action="userList.DoCtrlPagingAct( page, pageSize)" />
			</div>
			</div>
	</div>


	<div class="bootbox modal fade in" id="detail-user">
		<div class="modal-dialog">	<form name="userForm" ng-submit="userList.save()" novalidate="">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					<h3 class="smaller lighter blue no-margin">{{userBodyTitle}}</h3>
				</div>
				<div class="modal-body">
					<div class="bootbox-body">
					
								
										<!-- USERNAME -->
										<div class="form-group"">
											<label><spring:message code="user.username"/> <span style="color: #f56954">(*)</span></label> 
											<input type="text" maxlength="100" name="username" class="form-control" ng-model="user.username">
										</div>
										
										<!-- NAME -->
										<div class="form-group" ng-class="{ 'has-error' : userForm.name.$invalid &amp;&amp; !userForm.name.$pristine }">
											<label><spring:message code="user.name"/> <span style="color: #f56954">(*)</span></label> <input type="text" maxlength="100" name="name" class="form-control ng-dirty ng-valid ng-valid-required" ng-model="user.name" required="">
											<p ng-show="userForm.name.$invalid &amp;&amp; !userForm.name.$pristine" class="help-block ng-hide">
												<spring:message code="user.name.required" />
											</p>
										</div>
										
										<!-- ROLE -->
										<%--<div class="form-group">
											<label><spring:message code="user.role"/> <span style="color: #f56954">(*)</span></label>
											<div>
											<input type="checkbox" name="role" ng-model="checkboxModel.value1" ><span style="margin-left: 10px;color: green;">USER</span>
											<input type="checkbox" name="role" ng-model="checkboxModel.value2" ><span style="margin-left: 10px;color: green;">SALE</span>
											</div>
			                            </div> --%>
										
										<!-- EMAIL -->
										<div class="form-group" ng-class="{ 'has-error' : userForm.email.$invalid &amp;&amp; !userForm.email.$pristine }">
								            <label><spring:message code="user.email"/> <span style="color: #f56954">(*)</span></label>
								            <input type="email" name="email" class="form-control ng-pristine ng-valid ng-valid-email" ng-model="user.email" required>
								            <p ng-show="userForm.email.$invalid &amp;&amp; !userForm.email.$pristine" class="help-block ng-hide"><spring:message code="user.email.invalid" /></p>
								        </div>
			        
										<!-- PASSWORD -->
										<div class="form-group">
											<label><spring:message code="user.password"/> </label> <input type="text" maxlength="8" name="newPassword" class="form-control ng-dirty ng-valid ng-valid-required" ng-model="user.newPassword" >
										</div>
										
										<%-- <div class="box-footer" style="text-align: right">
											<a class="btn btn-default btn-flat" onclick="$('#detail-user').hide();$('#body-user').show('slow')"> <i class="fa fa-user"></i> <spring:message code="user.list" /></a> 
											<button id='btnSubmit' type="submit" class="btn btn-default btn-flat" ng-disabled="userForm.name.$invalid || userForm.email.$invalid">
												<i class="fa fa-save"></i> <spring:message code="message.button.save"></spring:message>
											</button>
										</div> --%>
								
							
						
					</div>
				</div>
				<div class="modal-footer">
						<button id='btnSubmit' type="submit" class="btn btn-app btn-grey btn-xs radius-4 pull-right" style="width: 150px" 
						ng-disabled="userForm.name.$invalid || userForm.email.$invalid">
													<i class="ace-icon fa fa-floppy-o bigger-160"></i>
													<spring:message code="message.button.save"></spring:message>
												</button>
								<button  type="button" class="btn btn-app btn-warning btn-xs radius-4 pull-left" style="width: 150px" onclick="$('#detail-user').modal('hide');">
									<i class="ace-icon fa fa-undo bigger-160"></i>
									Trở lại
								</button>
				</div>
			</div></form>
		</div>
	</div>


</div>

<script>
angular.module('app',["bw.paging"]).controller('UserListController',UserListController);

function UserListController($scope, $http) {
    
	var userList = this;

	userList.init = function(){
		$scope.paging={total:${total },currentPage:1,pageSize:10};
		userList.loadUsers();
	}
	
	$scope.checkboxModel = {
       value1 : false,
       value2 : false
	};
	 
	userList.loadUsers = function(){
		$http.get('listUser/'+$scope.paging.currentPage+"/"+$scope.paging.pageSize).success(function(data){
	  		$scope.users = data;
	 		$('#body-user').show();
        });
	}

	userList.edit = function(username) {
		for(i in $scope.users) {
            if($scope.users[i].username == username) {
                $scope.user = angular.copy($scope.users[i]);
            	/* angular.forEach($scope.user.userRole,function(obj) {
  		          if(obj.role == "ROLE_USER"){
  		        	$scope.checkboxModel.value1 = true;
  		        	console.log($scope.checkboxModel);
  		        	 $scope.checkboxModel = {
  		    		       value1 : true,
  		    		       value2 : false
  		    		     };
  		          }
  		      	}); */
                $scope.userBodyTitle='<spring:message code="user.detail"/>';
                $('#detail-user').modal();
          		
          		//$('#body-user').hide('slow');
            }
        }
	};
	
	userList.choose = function(username) {
		  angular.forEach($scope.users,function(obj) {
	          if(obj.username == username){
	       	   	$scope.user = obj;
	       	 	$("#info-modal").modal();
	          }
	      });
		};
		
	userList.save = function() {
		var copyUser = angular.copy($scope.user);
	 	$http.post('updateUser',copyUser).success(function(data){
			userList.loadUsers();
		 	$("#detail-user").modal('hide');
        });
		 
	};
	
	userList.delete = function(id) {
		BootstrapDialog.confirm({
            message: '<spring:message code="message.delete.content" />',
            type: BootstrapDialog.TYPE_WARNING,
            btnOKClass: 'btn-warning',
            callback: function(result) {
                if(result) {
                	$http.delete('deleteuser/'+id).users(function(response){
      	       			 angular.forEach($scope.customers,function(obj, index) {
      	       		          if(obj.id == id){
      	       		        	  $scope.users.splice(index, 1);
      	       		          }
      	       		      });
      	       	        });
                }
            }
        });
		
	};
	
	userList.active = function(username) {
	 	for(i in $scope.users) {
	            if($scope.users[i].username == username) {
	            	$scope.user = $scope.users[i];
	            }
        }   
	 	$scope.user.enabled = 1;
	 	userList.save();
	};
	
	userList.nonActive = function(username) {
	 	for(i in $scope.users) {
	            if($scope.users[i].username == username) {
	            	$scope.user = $scope.users[i];
	            }
        }   
	 	$scope.user.enabled = 0;
	 	userList.save();
	};
	
	userList.createNew = function() {
		$scope.user={enabled:1};
		$scope.userBodyTitle='<spring:message code="user.new"/>';
		$scope.userForm.$setPristine();
		$scope.userForm.$setValidity();
		$("#detail-user").modal();
	};
	

    /* call tooltip */
	userList.tooltip = function() {
		$('[data-toggle="tooltip"]').tooltip();
	};
	
	userList.DoCtrlPagingAct = function( page, pageSize){
		$scope.paging.currentPage = page;
		$scope.paging.pageSize = pageSize;
		userList.loadUsers();
    };
}

</script>
