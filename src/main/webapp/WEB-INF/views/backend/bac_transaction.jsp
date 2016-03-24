<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
	.form-group .error-msg{
		display: none;
	}
	.form-group.has-error .error-msg{
		display: block;
	}
	table {
		font-size: 13px
	}
	.paging-customer{
		margin-top: 0px !important;
		margin-bottom: 0px !important;
	}
	
</style>

<div class="content-wrapper" ng-controller="TransactionListController as transactionList" ng-init="transactionList.init()">
		<div class="widget-box widget-color-dark" id="body-transaction">
	<div class="widget-header">
		<h5 class="widget-title"><spring:message code="transaction.list"/></h5>
		<div class="widget-toolbar">
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
			<table id="simple-table" class="table table-striped table-bordered table-hover" ng-cloak="true">
				<thead class="primary">
				<tr>
					<th class="center"><label class="pos-rel"> <i class="menu-icon fa fa-flag"></i> No.</label></th>
					<th><i class="menu-icon fa fa-user"></i> <spring:message code="transation.customer.name"/></th>
					<th><i class="menu-icon fa fa-envelope"></i> <spring:message code="transation.customer.email"/></th>
					<th><i class="menu-icon fa fa-fax"></i> <spring:message code="transation.customer.phone"/></th>
					<th><i class="menu-icon fa fa-calendar"></i> <spring:message code="transation.create.date"/></th>
					<th><i class="menu-icon fa fa-commenting"></i> Status</th>
					<th width="120"><i class="menu-icon fa fa-tasks"></i> Nghiệp vụ</th>
				</tr>
				</thead>
				<tbody>
				<tr  ng-repeat="transaction in transactions track by $index">
					<td class="center"><label class="pos-rel"> <span
							class="lbl">{{$index+1}}</span>
					</label></td>
					<td>{{ transaction.customerName }}</td>
					<td>{{ transaction.customerEmail }}</td>
					<td>{{ transaction.customerPhone }}</td>
					<td>{{transaction.createdDate | date:'dd/MM/yyyy' }}</td>
					<td>
						<span class="label label-success" ng-show="transaction.status">Hoàn thành</span>
						<span class="label label-warning arrowed-in" ng-show="!transaction.status">Chưa hoàn thành</span>
					</td>
					<td class="text-center" ng-init="transactionList.tooltip()">
							<span class="tooltip-info"
									data-toggle="tooltip" title="Chi tiết"
                                     onmouseover="themHieuUngXoay(this)"
                                 onmouseout="xoaHieuUngXoay(this)"
									ng-click="transactionList.editTransaction(transaction)">
								<i class="ace-icon fa blue fa-link bigger-150"></i>
							</span>

							<span class="tooltip-error"
									data-toggle="tooltip" title="Xóa khỏi danh sách"
                            onmouseover="themHieuUngXoay(this)"
                        onmouseout="xoaHieuUngXoay(this)"
									ng-click="transactionList.deleteTransaction(transaction)">
								<i class="ace-icon fa red fa-recycle bigger-150"></i>
							</span>
					</td>
				</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
	<div class="widget-box widget-color-dark" id="detailTransaction" style="display: none">
		<div class="widget-header">
			<h5 class="widget-title"><spring:message code="transaction.detail"/></h5>
			<div class="widget-toolbar">
				<a href="#" data-action="fullscreen" class="orange2">
					<i class="ace-icon fa fa-expand bigger-125"></i>
				</a>
				<a href="#" data-action="collapse">
					<i class="ace-icon fa fa-chevron-up bigger-125"></i>
				</a>

			</div>
		</div>

		<div class="widget-body">
				<div class="widget-main">
					<div class="widget-box transparent">
											<div class="widget-header widget-header-large">
												<h3 class="widget-title grey lighter">
													<i class="ace-icon fa fa-leaf green"></i>
													Đơn đặt hàng
												</h3>

												<!-- #section:pages/invoice.info -->
												<div class="widget-toolbar no-border invoice-info" style="border-left: 1px solid #D9D9D9">
													<span class="invoice-info-label">Mã đơn hàng:</span>
													<span class="red">#121212</span>

													<br>
													<span class="invoice-info-label">Ngày đặt:</span>
													<span class="blue">04/04/2014</span>
												</div>

												<!-- /section:pages/invoice.info -->
											</div>

											<div class="widget-body">
												<div class="widget-main padding-24">
													<div class="row">
														<div class="col-sm-6">
															<div class="row">
																<div class="col-xs-11 label label-lg label-info arrowed-in arrowed-right">
																	<b>Thông tin người đặt hàng</b>
																</div>
															</div>

															<div>
																<ul class="list-unstyled spaced">
																	<li>
																		<i class="ace-icon fa fa-caret-right blue"></i><strong>Tên người đặt:</strong> {{transaction.customerName}}
																	</li>

																	<li>
																		<i class="ace-icon fa fa-caret-right red"></i><strong>Số điện thoại:</strong> {{transaction.customerPhone}}
																	</li>

																	<li>
																		<i class="ace-icon fa fa-caret-right blue"></i><strong>Email:</strong> {{transaction.customerEmail}}
																	</li>
																	<li>
																		<i class="ace-icon fa fa-caret-right blue"></i><strong>Địa chỉ:</strong> {{transaction.customerAddress}}
																	</li>


																	<li class="divider"></li>

																	<li>
																		<i class="ace-icon fa fa-caret-right blue"></i>
																		<strong>Phương thức thanh toán:</strong> {{transaction.paymenyMethod}}
																	</li>
																</ul>
															</div>
														</div><!-- /.col -->

														<div class="col-sm-6">
															<div class="row">
																<div class="col-xs-11 label label-lg label-success arrowed-in arrowed-right">
																	<b>Thông tin người nhận hàng</b>
																</div>
															</div>

															<div>
																<ul class="list-unstyled  spaced">
																	<li>
																		<i class="ace-icon fa fa-caret-right green"></i><strong>Tên người nhận:</strong> {{transaction.receiverName}}
																	</li>

																	<li>
																		<i class="ace-icon fa fa-caret-right red"></i><strong>Số điện thoại:</strong> {{transaction.receiverPhone}}
																	</li>

																	<li>
																		<i class="ace-icon fa fa-caret-right green"></i><strong>Email:</strong> {{transaction.receiverEmail}}
																	</li>
																	<li>
																		<i class="ace-icon fa fa-caret-right green"></i><strong>Địa chỉ:</strong> {{transaction.receiverAddress}}
																	</li>
																</ul>
															</div>
														</div><!-- /.col -->
													</div><!-- /.row -->

													<div class="space"></div>

													<div>
														<table class="table table-striped table-bordered">
															<thead>
																<tr>
																	<th class="center">#</th>
																	<th>Tên sản phẩm</th>
																	<th>Giá sản phẩm</th>
																	<th>Số lượng</th>
																	<th>Tổng</th>
																</tr>
															</thead>

															<tbody>
															<tr ng-repeat="order in transaction.orders track by order.id" >
																<td class="center">{{$index+1}}</td>
																<td class="cart_name">
																	<p>{{ order.product.name }}</p>
																</td>
																<td class="cart_price">
																	<p>{{ order.price }} VND</p>
																</td>
																<td class="cart_quantity">
																	<p>{{ order.qty }}</p>
																</td>
																<td class="cart_total">
																	<p class="cart_total_price">{{ order.price * order.qty }} VND</p>
																</td>
															</tr>
																
															</tbody>
														</table>
													</div>

													<div class="hr hr8 hr-double hr-dotted"></div>

													<div class="row">
														<div class="col-sm-5 pull-right">
															<h4 class="pull-right">
																Tổng số tiền :
																<span class="red">{{ transactionList.getTotal() }} VND</span>
															</h4>
														</div>
													</div>

												</div>
											</div>
										</div>
				</div>
				<div class="widget-toolbox padding-8 clearfix">

				<button ng-click="transactionList.resolveTransaction()" ng-if="!transaction.status" style="width: 200px"  type="submit" class="btn btn-app btn-success btn-xs radius-4 pull-right" ng-disabled="catalogForm.name.$invalid">
					<i class="ace-icon fa fa-cloud-download bigger-160"></i>
					Đơn hàng đã giải quyết
				</button>
					<button  type="button" class="btn btn-app btn-warning btn-xs radius-4 pull-left" style="width: 90px" ng-click="transactionList.comeBackList()">
						<i class="ace-icon fa fa-list bigger-160"></i>
						<spring:message code="message.button.list" />
					</button>

			</div>
		</div>
	</div>

</div>
<script>
angular.module('app',['datatables']).controller('TransactionListController', TransactionListController);

function TransactionListController($scope, $http) {
	
	var transactionList = this;
	
	transactionList.init = function(){
		$scope.paging={total:${total },currentPage:1,pageSize:10};
		transactionList.loadTransactions();
	}
	
	transactionList.loadTransactions = function(){
		$http.get('listTransactions/'+$scope.paging.currentPage+"/"+$scope.paging.pageSize).success(function(data){
	  		$scope.transactions = data;
	 		$('#body-transaction').show();
        });
	}
	
	/* Edit transaction */
	transactionList.editTransaction = function(transaction) {
		
		$scope.transaction = transaction;
		
		$("#closeListTransactions").click();
  		$("#detailTransaction").show('slow');
  		$('#body-transaction').hide('slow');
  		
  		/* Load listTransactions */
  		$http.get('${cp}/admin/listOrdersByTransaction?transactionId=' + transaction.id).
  		then(function(data) {
  	    	$scope.transaction.orders = data.data;
  		});
  		
	};
	
	/* call tooltip */
	transactionList.tooltip = function() {
		$('[data-toggle="tooltip"]').tooltip();
	};
	
	/* Save transaction */
	transactionList.save = function() {
		$http.post('saveTransaction', $scope.transaction).success(function(data){
			$scope.transaction.status = true;
			transactionList.popupSucces();
       	});
	};
	
	/* Delete Transaction*/
	transactionList.deleteTransaction = function(transaction) {
		BootstrapDialog.confirm({
            message: '<spring:message code="message.delete.content" />',
            type: BootstrapDialog.TYPE_WARNING,
            btnOKClass: 'btn-warning',
            callback: function(result) {
                if(result) {
                	$http.delete('deleteTransaction/' + transaction.id).success(function(response){
                		// Remove on GUI
            			angular.forEach($scope.transactions,function(obj, index) {
							if(obj.id == transaction.id){
								$scope.transactions.splice(index, 1);
							}
	   	       		    });
   	       	        });
                }
            }
        });
	};
	
	
	/* Resolve Transaction*/
	transactionList.resolveTransaction = function(){
		$scope.transaction.orders = null;
		$http.post('resolveTransaction/' + $scope.transaction.id).success(function(data){
			$scope.transaction.status = true;
			transactionList.popupSucces();
       	});
	};
	
	transactionList.getTax = function(){
	    return transactionList.getTotal() * 0.1;//Math.round((transactionList.getTotal() * 0.1)); // Tax 10%
	};
	
	transactionList.getTotal = function(){
		
		if( $scope.transaction == null || $scope.transaction.orders == null ){
			return 0;
		}
		
	    var total = 0;
	    for(var i = 0; i < $scope.transaction.orders.length; i++){
	        var order = $scope.transaction.orders[i];
	        total += (order.price * order.qty);
	    }
	    return total;
	};
	
	transactionList.popupSucces = function(){
		 BootstrapDialog.show({
	            message: 'Hành động của bạn đã được xử lý thành công',
	            type: BootstrapDialog.TYPE_SUCCESS,
	            buttons: [{
	                label: '<spring:message code="message.button.yes" />',
	                action: function(dialogItself){
	                    dialogItself.close();
	                }
	            }]
    	});
	};
	
	transactionList.popupError = function(){
		 BootstrapDialog.show({
	            message: '<spring:message code="message.http.error.message" />',
	            type: BootstrapDialog.TYPE_DANGER,
	            buttons: [{
	                label: '<spring:message code="message.button.cancel" />',
	                action: function(dialogItself){
	                    dialogItself.close();
	                }
	            }]
   		});
	};
	
	transactionList.comeBackList = function(){
		$('#detailTransaction').hide('slow');
		$('#body-transaction').show('slow');
		$("html, body").animate({ scrollTop: 0 }, "slow");
	};
};

</script>
