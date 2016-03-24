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
   ng-controller="todoListController as todoList">
   <div
      class="widget-box widget-color-dark"
      id="body-menu">
      <div class="widget-header">
         <h5 class="widget-title">Menu Footer Two</h5>
         <div class="widget-toolbar">
            <a
               href="#" class="tooltip-success" data-toggle="tooltip" title="Tạo mới menu footer"
               ng-click="todoList.createNew()"> <i class="ace-icon fa green fa-plus bigger-125"></i>
            </a> <a
               href="#"
               data-action="fullscreen"
               class="orange2"> <i class="ace-icon fa fa-expand bigger-125"></i>
            </a> <a
               href="#"
               data-action="collapse"> <i class="ace-icon fa fa-chevron-up bigger-125"></i>
            </a>
         </div>
      </div>
      <div class="widget-body">
         <div class="widget-main no-padding">
            <table
               class="table table-striped table-bordered table-hover"
               ng-cloak="true">
               <thead>
                  <tr>
                     <th>Tên</th>
                      <th>Liên kết</th>
                     <th>Thứ tự hiển thị</th>
                     <th class="text-center"><spring:message code="customer.action" /></th>
                  </tr>
               </thead>
               <tbody>
                  <tr ng-repeat="menu in menus track by $index">
                     <td>{{ menu.name }}</td>
                     <td>{{ menu.link }}</td>
                      <td>{{ menu.sortOrder }}</td>
                     <td
                        class="text-center"
                        ng-init="todoList.tooltip()"><span
                        class="tooltip-info"
                        ng-click="todoList.edit(menu.id)"
                        data-toggle="tooltip"
                        onmouseover="themHieuUngXoay(this)"
                        onmouseout="xoaHieuUngXoay(this)"
                        title="<spring:message code="message.button.edit"></spring:message>"> <i class="ace-icon fa blue fa-pencil-square-o bigger-150"></i>
                     </span> <span
                        class="tooltip-error"
                        ng-click="todoList.delete(menu.id)"
                        data-toggle="tooltip"
                        onmouseover="themHieuUngXoay(this)"
                        onmouseout="xoaHieuUngXoay(this)"
                        title="<spring:message code="message.button.delete"></spring:message>"> <i
                           class="ace-icon fa red fa-recycle bigger-150"></i>
                     </span></td>
                  </tr>
               </tbody>
            </table>
         </div>
      </div>
   </div>
   <div
      class="bootbox modal fade in"
      id="detailMenu">
      <div class="modal-dialog" style="width:700px">
         <form
            name="menuForm"
            novalidate>
            <div class="modal-content">
               <div class="modal-header">
                  <button
                     type="button"
                     class="close"
                     data-dismiss="modal"
                     aria-hidden="true">×</button>
                  <h3 class="smaller lighter blue no-margin">Chi tiết</h3>
               </div>
               <div class="modal-body">
                  <div class="bootbox-body">
                     <div class="form-group">
                        <label><spring:message code="customer.name" /> <span style="color: #f56954">(*)</span></label> <input
                           type="text"
                           name="name"
                           class="form-control"
                           ng-model="menu.name"
                           required> <span
                           style="color: red"
                           ng-show="menuForm.name.$dirty && menuForm.name.$invalid"> <span ng-show="menuForm.name.$error.required">Tên
                              là bắt buộc</span>
                        </span>
                     </div>
                      <div class="form-group">
                     <div class="col-xs-6" style="margin-left: -12px">
                        <label>Trang</label> <select
                           class="form-control"
                           ng-model="menu.link">
                           <c:forEach
                              items="${pages }"
                              var="page">
                              <option value="${page.friendURL}">${page.name }</option>
                           </c:forEach>
                        </select>
                        </div>
                         <div class="col-xs-6" style="margin-bottom: 10px"><label style="display: block;">Liên kết *</label> 
                         <span style="float: left;margin-left: 10px;margin-top: 7px" class="blue">http://${cp }/</span>
                        <input
                           type="text"
                           name="link"
                           class=" col-xs-10 col-sm-6"
                           ng-model="menu.link"> <span
                           style="color: red"
                           ng-show="menuForm.link.$dirty && menuForm.link.$invalid"> <span ng-show="menuForm.link.$error.required">Link
                              là bắt buộc</span>
                        </span></div>
                     </div>
                     <input
                        type="hidden"
                        name="type"
                        class="form-control"
                        ng-model="menu.type" />
                      <div class="form-group">
                        <label>Thứ tự *</label> 
                        <input type="number" class="form-control" id="sortOrder" name="sortOrder" ng-model="menu.sortOrder" 
                                    placeholder="Thứ tự hiển thị">
                        </div>
                  </div>
               </div>
               <div class="modal-footer">
                  <button
                     id='btnSubmit'
                     type="button"
                     class="btn btn-app btn-grey btn-xs radius-4 pull-right"
                     style="width: 150px"
                     ng-click="todoList.save()"
                     ng-disabled="menuForm.name.$invalid || menuForm.link.$invalid">
                     <i class="ace-icon fa fa-floppy-o bigger-160"></i>
                     <spring:message code="message.button.save"></spring:message>
                  </button>
                  <button
                     type="button"
                     class="btn btn-app btn-warning btn-xs radius-4 pull-left"
                     style="width: 150px"
                     onclick="$('#detailMenu').modal('hide');">
                     <i class="ace-icon fa fa-undo bigger-160"></i> Trở lại
                  </button>
               </div>
            </div>
         </form>
      </div>
   </div>
</div>
<!-- /.right-side -->
<script>
angular.module('app',['datatables']).controller('todoListController',todoListController);

function todoListController($scope, $http) {
	
	var todoList = this;
	
	todoList.loadMenu = function(id) {
		$http.get('find_conect_link_by_type'+"/MENU_FOOTER_TWO").success(function(data){
	  		$scope.menus = data;
        });
	};
  	
	todoList.loadMenu();
	todoList.edit = function(id) {
		for(i in $scope.menus) {
            if($scope.menus[i].id == id) {
                $scope.menu = angular.copy($scope.menus[i]);
          		$("#detailMenu").modal();
            }
        }
	};
	
	todoList.createNew = function(){
		$scope.menu = {};
		$scope.menu.type = "MENU_FOOTER_TWO";
		$("#detailMenu").modal();
	};

	
	todoList.delete = function(id) {
		BootstrapDialog.confirm({
            message: '<spring:message code="message.delete.content" />',
            type: BootstrapDialog.TYPE_WARNING,
            btnOKClass: 'btn-warning',
            callback: function(result) {
                if(result) {
                	$http.delete('delete_connect_link/'+id).success(function(response){
                		thongBao.xoaThanhCong();
      	       			 angular.forEach($scope.menus,function(obj, index) {
      	       		          if(obj.id == id){
      	       		        	  $scope.menus.splice(index, 1);
      	       		          }
      	       		      });
      	       	        });
                }
            }
        });
	};
		
	todoList.save = function() {
		var copyMenu = angular.copy($scope.menu);
		console.log($scope.menu);
		 $http.post('update_connect_link',copyMenu).success(function(data){
			 $("#detailMenu").modal('hide');
			 if(copyMenu.id == null){
				 thongBao.luuTruThanhCong();
				 todoList.loadMenu();
			 }else{
				 thongBao.chinhSuaThanhCong();
				 for(i in $scope.menus) {
			            if($scope.menus[i].id == $scope.menu.id) {
			            	$scope.menus[i] = copyMenu;
			            }
			        }  
			 }
		 
	        });

	};
	
   /* call tooltip */
	todoList.tooltip = function() {
		$('[data-toggle="tooltip"]').tooltip();
	};
}

</script>
