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
   id="partner-container"
   class="content-wrapper"
   ng-controller="todoListController as todoList">
   <div
      class="widget-box widget-color-dark"
      id="body-partner">
      <div class="widget-header">
         <h5 class="widget-title">Danh sách</h5>
         <div class="widget-toolbar">
            <a
               href="#" class="tooltip-success" data-toggle="tooltip" title="Tạo mới đối tác"
               ng-click="todoList.createNew()"> <i class="ace-icon fa green fa-plus bigger-125"></i></a> <a
               href="#"
               data-action="fullscreen"
               class="orange2"> <i class="ace-icon fa fa-expand bigger-125"></i></a> <a
               href="#"
               data-action="collapse"> <i class="ace-icon fa fa-chevron-up bigger-125"></i>
            </a>
         </div>
      </div>
      <div class="widget-body">
         <div class="widget-main no-padding">
            <table class="table table-striped table-bordered table-hover">
               <thead class="primary">
                  <tr>
                     <th>Tên</th>
                     <th>Link</th>
                     <th class="text-center"><spring:message code="customer.action" /></th>
                  </tr>
               </thead>
               <tbody>
                  <tr ng-repeat="partner in partners track by $index">
                     <td>{{ partner.name }}</td>
                     <td>{{ partner.link }}</td>
                     <td
                        class="text-center"
                        ng-init="todoList.tooltip()"><span
                        class="tooltip-info"
                        onmouseover="themHieuUngXoay(this)"
                        onmouseout="xoaHieuUngXoay(this)"
                        ng-click="todoList.edit(partner.id)"
                        data-toggle="tooltip"
                        title="<spring:message code="message.button.edit"></spring:message>"> <i
                           class="ace-icon fa blue fa-pencil-square-o bigger-150"></i>
                     </span> <span
                        class="tooltip-error"
                        onmouseover="themHieuUngXoay(this)"
                        onmouseout="xoaHieuUngXoay(this)"
                        ng-click="todoList.delete(partner.id)"
                        data-toggle="tooltip"
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
      id="detailPartner">
      <div class="modal-dialog">
         <form
            name="partnerForm"
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
                           ng-model="partner.name"
                           required> <input
                           type="hidden"
                           name="linkImage"
                           class="form-control"
                           ng-model="partner.linkImage"
                           required> <span
                           style="color: red"
                           ng-show="partnerForm.name.$dirty && partnerForm.name.$invalid"> <span ng-show="partnerForm.name.$error.required"><spring:message
                                 code="customer.name.required" /> </span>
                        </span>
                     </div>
                     <div class="form-group">
                        <label>URL : <span style="color: #f56954">(*)</span></label> <a
                           ng-click="todoList.selectPartnerImage()"
                           style="font-size: 10px; cursor: pointer"> <spring:message code="slideimage.choose.image.from.galary" />
                        </a>
                        <div>
                           <img
                              id="imageLink"
                              alt=""
                              src="${dataDomain}{{partner.imageLink.url}}"
                              style="width: 150px; height: 71px; margin: 10px; border-radius: 0"
                              class="img-rounded">
                        </div>
                     </div>
                     <div class="form-group">
                        <label>link <span style="color: #f56954">(*)</span></label> <input
                           type="text"
                           name="link"
                           class="form-control"
                           ng-model="partner.link"
                           required> <span
                           style="color: red"
                           ng-show="partnerForm.name.$dirty && partnerForm.name.$invalid"> <span ng-show="partnerForm.link.$error.required">Link
                              là bắt buộc</span>
                        </span>
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
                     ng-disabled="partnerForm.name.$invalid || partnerForm.link.$invalid || partnerForm.linkImage.$invalid">
                     <i class="ace-icon fa fa-floppy-o bigger-160"></i>
                     <spring:message code="message.button.save"></spring:message>
                  </button>
                  <button
                     type="button"
                     class="btn btn-app btn-warning btn-xs radius-4 pull-left"
                     style="width: 150px"
                     onclick="$('#detailPartner').modal('hide');">
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
var app = angular.module('app',['datatables']);
app.controller('todoListController',todoListController);

function todoListController($rootScope, $scope, $http) {

	var todoList = this;

	$scope.$on('selectFile', function(event, dataResponse) {
		if(dataResponse != null && dataResponse.data != null){
			 $scope.partner.imageLink = dataResponse.data;
			 $scope.partner.linkImage =  $scope.partner.imageLink.id;
		}
	});

	todoList.loadPartner = function(id) {
		$http.get('find_conect_link_by_type'+"/BEST_CATALOG").success(function(data){
	  		$scope.partners = data;
        });
	};
  	
	todoList.loadPartner();
	
	todoList.edit = function(id) {
		for(i in $scope.partners) {
            if($scope.partners[i].id == id) {
                $scope.partner = angular.copy($scope.partners[i]);
                angular.forEach($scope.images, function(temp) {
               	 if(temp.id==$scope.partner.linkImage){
               		 $scope.partner.imageLink = angular.copy(temp);
               	 }
               	});
          		$("#detailPartner").modal();
            }
        }
	};

	todoList.createNew = function(){
		$scope.partner = {};
		$scope.partner.type = "BEST_CATALOG";
		$("#detailPartner").modal();
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
      	       			 angular.forEach($scope.partners,function(obj, index) {
      	       		          if(obj.id == id){
      	       		        	  $scope.partners.splice(index, 1);
      	       		          }
      	       		      });
      	       	        });
                }
            }
        });
	};

	todoList.save = function() {
		var copyPartner = angular.copy($scope.partner);
		copyPartner.linkImage = copyPartner.imageLink.id;
		delete copyPartner.imageLink;
		 $http.post('update_connect_link',copyPartner).success(function(data){
			 $("#detailPartner").modal('hide');
			 if(copyPartner.id == null){
				 thongBao.luuTruThanhCong();
			 }else{
				 thongBao.chinhSuaThanhCong();
			 }
			 todoList.loadPartner();
	        });

	};

    /* call tooltip */
	todoList.tooltip = function() {
		$('[data-toggle="tooltip"]').tooltip();
	};

	/* Display the gallery image popup to select new main image for product */
	todoList.selectPartnerImage = function(){
		$rootScope.$broadcast('showFileUpload', {boxId : 'partner-container'});
	}

}

</script>
<jsp:include page="fileupload/fileupload-fragment.jsp" />
