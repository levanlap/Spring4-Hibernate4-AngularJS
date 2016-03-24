<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<div class="content-wrapper" ng-controller="CompanyListController as todoList">
	<div class="widget-box widget-color-dark">
			<div class="widget-header">
				<h5 class="widget-title">Shop</h5>


				<div class="widget-toolbar">
													<a href="#" data-action="collapse">
														<i class="1 ace-icon fa fa-chevron-up bigger-125"></i>
													</a>
												</div>
			</div>

			<div class="widget-body">
				<div class="widget-main">
					<form name="companyForm" class="row">
                           <div class="col-xs-6">
                           <div class="widget-box widget-color-green2 collapsed">
                           <div class="widget-header">
                              <h5 class="widget-title">Chi nhánh chính</h5>
                              <div class="widget-toolbar">
                              <a href="#" data-action="fullscreen" class="orange2">
                                 <i class="ace-icon fa fa-expand bigger-125"></i>
                              </a>
                              <a href="#" data-action="collapse">
                                    <i class="ace-icon fa fa-chevron-down bigger-125"></i>
                              </a>
      
                           </div>
                           </div>
         
                           <div class="widget-body">
                              <div class="widget-main">
                                 <%-- Name --%>
                     <div class="form-group" ng-class="{ 'has-error' : companyForm.name.$invalid &amp;&amp; !companyForm.name.$pristine }">
                        <label>
                           Tên Công Ty 
                           <span style="color: #f56954">(*)</span>
                        </label> 
                        <input type="text" name="name" 
                              class="form-control ng-dirty ng-valid ng-valid-required" required=""
                              ng-model="company.name" 
                              maxlength="100"
                              placeholder="Vui lòng nhâp tên công ty">
                        <p ng-show="companyForm.name.$invalid &amp;&amp; !companyForm.name.$pristine" class="help-block ng-hide">
                           Tên công ty thì bắt buộc
                        </p>
                     </div>
                     
                     <%-- Phone --%>
                     <div class="form-group" ng-class="{ 'has-error' : companyForm.phone.$invalid &amp;&amp; !companyForm.phone.$pristine }">
                        <label>
                           Điện Thoaị
                           <span style="color: #f56954">(*)</span>
                        </label> 
                        <input type="text" name="phone" 
                              class="form-control ng-dirty ng-valid ng-valid-required" required=""
                              ng-model="company.phone" 
                              maxlength="100"
                              placeholder="Vui lòng nhâp số điện thoại">
                        <p ng-show="companyForm.phone.$invalid &amp;&amp; !companyForm.phone.$pristine" class="help-block ng-hide">
                           Số điện thoại thì bắt buộc
                        </p>
                     </div>
                     
                     <%-- Email --%>
                     <div class="form-group" ng-class="{ 'has-error' : companyForm.email.$invalid &amp;&amp; !companyForm.email.$pristine }">
                        <label>
                           Email
                           <span style="color: #f56954">(*)</span>
                        </label> 
                        <input type="text" name="email" 
                              class="form-control ng-dirty ng-valid ng-valid-required" required=""
                              ng-model="company.email" 
                              maxlength="100"
                              placeholder="Vui lòng nhâp tên email">
                        <p ng-show="companyForm.email.$invalid &amp;&amp; !companyForm.email.$pristine" class="help-block ng-hide">
                           Email thì bắt buộc
                        </p>
                     </div>
                     
                     <%-- Address --%>
                     <div class="form-group" ng-class="{ 'has-error' : companyForm.address.$invalid &amp;&amp; !companyForm.address.$pristine }">
                        <label>
                           Địa Chỉ 
                           <span style="color: #f56954">(*)</span>
                        </label> 
                        <input type="text" name="address" 
                              class="form-control ng-dirty ng-valid ng-valid-required" required=""
                              ng-model="company.address" 
                              maxlength="100"
                              placeholder="Vui lòng nhâp địa chỉ">
                        <p ng-show="companyForm.address.$invalid &amp;&amp; !companyForm.address.$pristine" class="help-block ng-hide">
                           Địa chỉ thì bắt buộc
                        </p>
                     </div>
                     
                     <%-- Longitude --%>
                     <div class="form-group" ng-class="{ 'has-error' : companyForm.longitude.$invalid &amp;&amp; !companyForm.longitude.$pristine }">
                        <label>
                           Kinh Độ 
                           <span style="color: #f56954">(*)</span>
                        </label> 
                        <input type="text" name="longitude" 
                              class="form-control ng-dirty ng-valid ng-valid-required" required=""
                              ng-model="company.longitude" 
                              maxlength="100"
                              placeholder="Vui lòng nhâp vĩ độ">
                        <p ng-show="companyForm.longitude.$invalid &amp;&amp; !companyForm.longitude.$pristine" class="help-block ng-hide">
                           Kinh độ thì bắt buộc
                        </p>
                     </div>
                     
                     <%-- Latitude --%>
                     <div class="form-group" ng-class="{ 'has-error' : companyForm.latitude.$invalid &amp;&amp; !companyForm.latitude.$pristine }">
                        <label>
                           Vĩ Độ
                           <span style="color: #f56954">(*)</span>
                        </label> 
                        <input type="text" name="latitude" 
                              class="form-control ng-dirty ng-valid ng-valid-required" required=""
                              ng-model="company.latitude" 
                              maxlength="100"
                              placeholder="Vui lòng nhâp vĩ độ">
                        <p ng-show="companyForm.latitude.$invalid &amp;&amp; !companyForm.latitude.$pristine" class="help-block ng-hide">
                           Vĩ độ thì bắt buộc
                        </p>
                     </div>
                              </div>
                           </div>
                     </div>
							
							</div>
							<div ng-repeat="brand in company.brands track by $index" class="col-xs-6">
                           <div class="widget-box widget-color-green2 collapsed" ng-init="todoList.tooltip()">
                                 <div class="widget-header">
                                    <h5 class="widget-title">Chi nhánh {{$index +1}}</h5>
                                    <div class="widget-toolbar">
                                       <a href="#" class="tooltip-error"
					data-toggle="tooltip" title="Xóa chi nhánh" ng-click="todoList.removeBrand($index);">
                                          <i class="ace-icon fa red fa-recycle bigger-125"></i>
                                       </a>
                                       <a href="#" data-action="collapse">
										<i class="ace-icon fa fa-chevron-down bigger-125"></i>
								</a>
               
                                    </div>
                                 </div>
               
                                 <div class="widget-body">
                                    <div class="widget-main">
                                          <div class="form-group">
                           <label>
                              Tên Chi Nhánh
                           </label> 
                           <input type="text"
                                 class="form-control" 
                                 ng-model="brand.name" 
                                 maxlength="100"
                                 placeholder="Vui lòng nhâp tên chi nhánh">
                        </div>
                        
                        <div class="form-group">
                           <label>
                              Điện Thoaị
                           </label> 
                           <input type="text"
                                 class="form-control"
                                 ng-model="brand.phone" 
                                 maxlength="100"
                                 placeholder="Vui lòng nhâp số điện thoại">
                        </div>
                        
                        <div class="form-group">
                           <label>
                              Địa Chỉ 
                           </label> 
                           <input type="text" name="address" 
                                 class="form-control"
                                 ng-model="brand.address" 
                                 maxlength="100"
                                 placeholder="Vui lòng nhâp địa chỉ">
                        </div>
                        
                        <div class="form-group">
                           <label>
                              Kinh Độ 
                           </label> 
                           <input type="text" name="longitude" 
                                 class="form-control"
                                 ng-model="brand.longitude" 
                                 maxlength="100"
                                 placeholder="Vui lòng nhâp vĩ độ">
                        </div>
                        
                        <div class="form-group">
                           <label>
                              Vĩ Độ
                           </label> 
                           <input type="text" name="latitude" 
                                 class="form-control"
                                 ng-model="brand.latitude" 
                                 maxlength="100"
                                 placeholder="Vui lòng nhâp vĩ độ">
                        </div>
                                    </div>
                                 </div>
                           </div>
								
								
							</div>
							
							
						</form>
				</div>
				<div class="widget-toolbox padding-8 clearfix">
					<button type="button" class="btn btn-app btn-primary btn-xs radius-4 pull-left" style="width: 135px" ng-click="todoList.addBrand();"
							ng-disabled="todoList.disabledSaveButton();">
							<i class="ace-icon fa fa-plus bigger-160"></i>
							Thêm Chi Nhánh
						</button>
					<button type="button" class="btn btn-app btn-grey btn-xs radius-4 pull-right" ng-click="todoList.save()" 
							ng-disabled="todoList.disabledSaveButton();">
							<i class="ace-icon fa fa-floppy-o bigger-160"></i>
							<spring:message code="message.button.save"></spring:message>
						</button>
				</div>
			</div>
	</div>
	<!-- /.content -->
</div>
<!-- /.right-side -->
<script>
angular.module('app',[]).controller('CompanyListController',CompanyListController);

function CompanyListController($scope, $http) {
	
	var todoList = this;
	
  	$http.get('getCompany/1').success(function(company){
  		 $scope.company = company;
    });
  	
  	todoList.save = function() {
		 $http.post('saveCompany', $scope.company).success(function(company){
			 $scope.company = company;
			 thongBao.luuTruThanhCong();
		 }); 
	};
  	
	todoList.disabledSaveButton = function(){
		return ( $scope.company == null
				|| $scope.company.name == null || $scope.company.name == ''
				|| $scope.company.phone == null || $scope.company.phone == ''
				|| $scope.company.email == null || $scope.company.email == ''
				|| $scope.company.address == null || $scope.company.address == ''
				|| $scope.company.longitude == null || $scope.company.longitude == ''
				|| $scope.company.latitude == null || $scope.company.latitude == ''

		);
	};
	
	todoList.addBrand = function(){
		$scope.company.brands.push({});
	};
	
	todoList.removeBrand = function(index){
		$scope.company.brands.splice(index, 1);
		thongBao.xoaThanhCong();
	};
	
	todoList.tooltip = function() {
		$('[data-toggle="tooltip"]').tooltip();
	};
	
}

</script>
