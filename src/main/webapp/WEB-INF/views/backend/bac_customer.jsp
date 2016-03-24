<%@ page
   language="java"
   contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib
   uri="http://java.sun.com/jsp/jstl/core"
   prefix="c"%>
<%@ taglib
   prefix="spring"
   uri="http://www.springframework.org/tags"%>
<div
   class="content-wrapper"
   ng-controller="CustomerListController as customerList"
   ng-init="customerList.init()">
   <!-- ========================LIST CUSTOMER===================================================================== -->
   <div
      class="widget-box widget-color-dark"
      id="body-customer">
      <!-- #section:custom/widget-box.options -->
      <div class="widget-header">
         <h5 class="widget-title">
            <i class="ace-icon fa fa-table"></i> Khách hàng
         </h5>
         <div class="widget-toolbar">
            <a
               href="#"
               data-action="fullscreen"
               class="orange2"> <i class="ace-icon fa fa-expand bigger-125"></i>
            </a> <a
               href="#"
               data-action="collapse"> <i class="ace-icon fa fa-chevron-up bigger-125"></i>
            </a>
         </div>
         <div class="widget-toolbar">
            <div
               class="input-group"
               style="width: 300px; float: left; margin-top: 2px">
               <span class="input-group-addon"> <i class="ace-icon fa fa-check"></i>
               </span> <input
                  type="text"
                  class="form-control search-query"
                  ng-model="name"
                  placeholder="Tìm theo tựa đề"> <span class="input-group-btn">
                  <button
                     type="button"
                     class="btn btn-purple btn-sm"
                     ng-click="todoList.findByName()">
                     <span class="ace-icon fa fa-search icon-on-right bigger-110"></span> Search
                  </button>
               </span>
            </div>
         </div>
      </div>
      <div class="widget-body">
         <div class="widget-main no-padding">
            <table
               id="simple-table"
               class="table table-striped table-bordered table-hover"
               ng-cloak="true">
               <thead class="primary">
                  <tr>
                     <th><i class="menu-icon fa fa-user"></i> <spring:message code="customer.name" /></th>
                     <th><i class="menu-icon fa fa-envelope"></i> <spring:message code="customer.email" /></th>
                     <th><i class="menu-icon fa fa-street-view"></i> <spring:message code="customer.address" /></th>
                     <th><i class="menu-icon fa fa-fax"></i> <spring:message code="customer.phone" /></th>
                     <th class="text-center"><i class="menu-icon fa fa-check"></i> Active</th>
                     <th width="30"><i class="menu-icon fa fa-tasks"></i> Nghiệp vụ</th>
                  </tr>
               </thead>
               <tbody>
                  <tr ng-repeat="customer in customers track by $index">
                     <td>{{ customer.name }}</td>
                     <td>{{ customer.email }}</td>
                     <td>{{ customer.address }}</td>
                     <td>{{ customer.phone }}</td>
                     <td class="text-center"><span
                        class="label label-success arrowed arrowed-right"
                        ng-if="customer.status ==1">Đã kích hoạt</span> <span
                        class="label label-warning arrowed-in-right arrowed-in"
                        ng-if="customer.status !=1">Chưa kích hoạt</span></td>
                     <td class="text-center" ng-init="customerList.tooltip()">
                           <span
                              class="tooltip-success"
                              data-toggle="tooltip"
                              title="Thây đổi mật khẩu"
                              onmouseover="themHieuUngXoay(this)"
                              onmouseout="xoaHieuUngXoay(this)"
                              ng-click="customerList.editPassword(customer.id)"> <i class="ace-icon fa green fa-key bigger-150"></i>
                           </span> <span
                              class="tooltip-info"
                              data-toggle="tooltip"
                              title="Chỉnh sữa"
                              onmouseover="themHieuUngXoay(this)"
                              onmouseout="xoaHieuUngXoay(this)"
                              ng-click="customerList.edit(customer.id)"> <i class="ace-icon fa blue fa-pencil bigger-150"></i>
                           </span> <span
                              class="tooltip-error"
                              data-toggle="tooltip"
                              title="Xóa khỏi danh sách"
                              onmouseover="themHieuUngXoay(this)"
                              onmouseout="xoaHieuUngXoay(this)"
                              ng-click="customerList.delete(customer.id)"> <i class="ace-icon fa red fa-recycle bigger-150"></i>
                           </span> <span
                              class="tooltip-warning"
                              ng-show="customer.status == 0"
                              data-toggle="tooltip"
                              title="Cho phép hoạt động"
                              onmouseover="themHieuUngXoay(this)"
                              onmouseout="xoaHieuUngXoay(this)"
                              ng-click="customerList.active(customer.id)"> <i class="ace-icon fa orange fa-unlock bigger-150"></i>
                           </span> <span
                              class="tooltip-warning"
                              ng-show="customer.status == 1"
                              data-toggle="tooltip"
                              title="Ngừng hoạt động"
                              onmouseover="themHieuUngXoay(this)"
                              onmouseout="xoaHieuUngXoay(this)"
                              ng-click="customerList.nonActive(customer.id)"> <i class="ace-icon fa orange fa-lock bigger-150"></i>
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
               paging-action="customerList.DoCtrlPagingAct( page, pageSize)" />
         </div>
      </div>
   </div>
   <!-- ========================POPOUP EDIT CUSTOMER===================================================================== -->
   <div
      class="bootbox modal fade in"
      id="detail-customer">
      <div class="modal-dialog">
         <form
            name="customerForm"
            ng-submit="customerList.save()"
            novalidate="">
            <div class="modal-content">
               <div class="modal-header">
                  <button
                     type="button"
                     class="close"
                     data-dismiss="modal"
                     aria-hidden="true">×</button>
                  <h3 class="smaller lighter blue no-margin">
                     <spring:message code="customer.detail" />
                  </h3>
               </div>
               <div class="modal-body">
                  <div class="bootbox-body">
                     <div class="row">
                        <div class="form-group col-xs-3">
                           <label><spring:message code="customer.name" /> <span style="color: #f56954">(*)</span></label> <input
                              type="text"
                              name="name"
                              class="form-control"
                              ng-model="customer.name"
                              required> <span
                              style="color: red"
                              ng-show="customerForm.name.$dirty && customerForm.name.$invalid"> <span
                              ng-show="customerForm.name.$error.required"><spring:message code="customer.name.required" /> </span>
                           </span>
                        </div>
                        <div class="form-group col-xs-5">
                           <label><spring:message code="customer.email" /> <span style="color: #f56954">(*)</span></label> <input
                              type="email"
                              name="email"
                              class="form-control"
                              ng-model="customer.email"
                              required> <span
                              style="color: red"
                              ng-show="customerForm.email.$dirty && customerForm.email.$invalid"> <span
                              ng-show="customerForm.email.$error.required"><spring:message code="customer.email.required" /> </span> <span
                              ng-show="customerForm.email.$error.email"><spring:message code="customer.email.not.valid" /> </span>
                           </span>
                        </div>
                        <div class="form-group col-xs-4">
                           <label><spring:message code="customer.phone" /></label> <input
                              type="text"
                              class="form-control"
                              ng-model="customer.phone">
                        </div>
                     </div>
                     <div class="row">
                        <div class="form-group col-xs-12">
                           <label><spring:message code="customer.address" /></label>
                           <textarea
                              class="form-control"
                              rows="3"
                              ng-model="customer.address"></textarea>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="modal-footer">
                  <button
                     id='btnSubmit'
                     type="submit"
                     class="btn btn-app btn-grey btn-xs radius-4 pull-right"
                     style="width: 150px"
                     ng-disabled="userForm.name.$invalid || userForm.email.$invalid">
                     <i class="ace-icon fa fa-floppy-o bigger-160"></i>
                     <spring:message code="message.button.save"></spring:message>
                  </button>
                  <button
                     type="button"
                     class="btn btn-app btn-warning btn-xs radius-4 pull-left"
                     style="width: 150px"
                     onclick="$('#detail-customer').modal('hide');">
                     <i class="ace-icon fa fa-undo bigger-160"></i> Trở lại
                  </button>
               </div>
            </div>
         </form>
      </div>
   </div>
   <!-- ========================POPOUP EDIT CUSTOMER PASSWORD===================================================================== -->
   <div
      class="bootbox modal fade in"
      id="detail-customer-password">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <button
                  type="button"
                  class="close"
                  data-dismiss="modal"
                  aria-hidden="true">×</button>
               <h3 class="smaller lighter blue no-margin">Thay Đổi Mật Khẩu</h3>
            </div>
            <div class="modal-body">
               <form
                  name="customerPasswordForm"
                  novalidate>
                  <div class="form-group">
                     <label>Mật khẩu mới <span style="color: #f56954">(*)</span></label> <input
                        type="password"
                        name="newPassword"
                        class="form-control"
                        ng-model="customer.newPassword"
                        required> <span
                        style="color: red"
                        ng-show="customerPasswordForm.newPassword.$dirty && customerPasswordForm.newPassword.$invalid"> <span
                        ng-show="customerPasswordForm.newPassword.$error.required">Mật khẩu thì bắt buộc </span>
                     </span>
                  </div>
                  <div class="form-group">
                     <label>Nhập lại mật khẩu <span style="color: #f56954">(*)</span></label> <input
                        type="password"
                        name="renewPassword"
                        class="form-control"
                        ng-model="customer.renewPassword"
                        required> <span
                        style="color: red; display: block;"
                        ng-show="customerPasswordForm.renewPassword.$dirty && customerPasswordForm.renewPassword.$invalid"> <span
                        ng-show="customerPasswordForm.renewPassword.$error.required"> Vui lòng nhập lại mật khẩu </span>
                     </span> <span
                        style="color: red; display: block;"
                        ng-show="customer.renewPassword != customer.newPassword"> <span> Hai mật khẩu không trùng khớp </span>
                     </span>
                  </div>
               </form>
            </div>
         <div class="modal-footer">
            <button
               id='btnSubmit'
               type="button"
               class="btn btn-app btn-grey btn-xs radius-4 pull-right"
               style="width: 150px"
               ng-click="customerList.save()"
               ng-disabled="customerList.disabledSavePassword()"
               ng-disabled="userForm.name.$invalid || userForm.email.$invalid">
               <i class="ace-icon fa fa-floppy-o bigger-160"></i>
               <spring:message code="message.button.save"></spring:message>
            </button>
            <button
               type="button"
               class="btn btn-app btn-warning btn-xs radius-4 pull-left"
               style="width: 150px"
               onclick="$('#detail-customer-password').modal('hide');">
               <i class="ace-icon fa fa-undo bigger-160"></i> Trở lại
            </button>
         </div>
      </div>
   </div>
</div>
<!-- /.right-side -->
<script>
angular.module('app',['bw.paging']).controller('CustomerListController',CustomerListController);

function CustomerListController($scope, $http) {
	
	var customerList = this;
	
	customerList.init = function(){
		$scope.paging={total:${total },currentPage:1,pageSize:10};
		customerList.loadCustomers();
	}
	
	customerList.loadCustomers = function(){
		$http.get('listCustomer/'+$scope.paging.currentPage+"/"+$scope.paging.pageSize).success(function(data){
	  		$scope.customers = data;
	 		$('#body-customer').show();
        });
	}

	customerList.edit = function(id) {
		for(i in $scope.customers) {
            if($scope.customers[i].id == id) {
                $scope.customer = angular.copy($scope.customers[i]);
          		$("#detail-customer").modal();
            }
        }
	};
	
	customerList.editPassword = function(id) {
		for(i in $scope.customers) {
            if($scope.customers[i].id == id) {
                $scope.customer = angular.copy($scope.customers[i]);
          		$("#detail-customer-password").modal();
            }
        }
	};
	
	customerList.delete = function(id) {
		BootstrapDialog.confirm({
            message: '<spring:message code="message.delete.content" />',
            type: BootstrapDialog.TYPE_WARNING,
            btnOKClass: 'btn-warning',
            callback: function(result) {
                if(result) {
                	$http.delete('deleteCustomer/'+id).success(function(response){
      	       			 angular.forEach($scope.customers,function(obj, index) {
      	       		          if(obj.id == id){
      	       		        	  $scope.customers.splice(index, 1);
      	       		          }
      	       		      });
      	       	        });
                }
            }
        });
	};
		
	customerList.save = function() {
		var copyCustomer = angular.copy($scope.customer);
		delete copyCustomer['renewPassword'];
	 	$http.post('updateCustomer',copyCustomer).success(function(data){
			 $("#detail-customer").modal('hide');
			 customerList.loadCustomers();
        });

	};
	
	customerList.active = function(id) {
	 	for(i in $scope.customers) {
            if($scope.customers[i].id == id) {
            	$scope.customer = $scope.customers[i];
            }
        }   
	 	$scope.customer.status = 1;
	 	customerList.save();
	};
	
	customerList.nonActive = function(id) {
	 	for(i in $scope.customers) {
	            if($scope.customers[i].id == id) {
	            	$scope.customer = $scope.customers[i];
	            }
        }   
	 	$scope.customer.status = 0;
	 	customerList.save();
	};
	
	customerList.disabledSavePassword = function(){
		return ($scope.customer == null 
				|| $scope.customer.newPassword == null || $scope.customer.newPassword == ''
				|| $scope.customer.renewPassword == null || $scope.customer.renewPassword == ''
				|| $scope.customer.renewPassword != $scope.customer.newPassword);
	}
	

    /* call tooltip */
	customerList.tooltip = function() {
		$('[data-toggle="tooltip"]').tooltip();
	};
	
	customerList.DoCtrlPagingAct = function( page, pageSize){
		$scope.paging.currentPage = page;
		$scope.paging.pageSize = pageSize;
		customerList.loadCustomers();
    };
}

</script>
