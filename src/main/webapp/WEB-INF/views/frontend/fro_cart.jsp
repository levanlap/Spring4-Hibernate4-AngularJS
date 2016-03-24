<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="${cp}/backend/dist/js/angular.js"></script>

<style>
@media only screen and (max-width: 800px) {
	#flip-scroll .cf:after {
		visibility: hidden;
		display: block;
		font-size: 0;
		content: " ";
		clear: both;
		height: 0;
	}
	#flip-scroll * html .cf {
		zoom: 1;
	}
	#flip-scroll *:first-child+html .cf {
		zoom: 1;
	}
	#flip-scroll table {
		width: 100%;
		border-collapse: collapse;
		border-spacing: 0;
	}
	#flip-scroll th, #flip-scroll td {
		margin: 0;
		vertical-align: top;
	}
	#flip-scroll th {
		text-align: left;
	}
	#flip-scroll table {
		display: block;
		position: relative;
		width: 100%;
	}
	#flip-scroll thead {
		display: block;
		float: left;
	}
	#flip-scroll tbody {
		display: block;
		width: auto;
		position: relative;
		overflow-x: auto;
		white-space: nowrap;
	}
	#flip-scroll thead tr {
		display: block;
	}
	#flip-scroll th {
		display: block;
		text-align: right;
	}
	#flip-scroll tbody tr {
		display: inline-block;
		vertical-align: top;
	}
	#flip-scroll td {
		display: block;
		min-height: 1.25em;
		text-align: left;
	}

	/* sort out borders */
	#flip-scroll th {
		border-bottom: 0;
		border-left: 0;
	}
	#flip-scroll td {
		border-left: 0;
		border-right: 0;
		border-bottom: 0;
	}
	#flip-scroll tbody tr {
		border-left: 1px solid #babcbf;
	}
	#flip-scroll th:last-child, #flip-scroll td:last-child {
		border-bottom: 1px solid #babcbf;
	}
}

.fa-15x {
	font-size: 1.5em
}

label {
	font-weight: normal
}
</style>
<style>
.hiddenStepInfo {
	display: none;
}

.activeStepInfo {
	display: block !important;
}

.underline {
	text-decoration: underline;
}

.step {
	margin-top: 27px;
}

.progress {
	position: relative;
	height: 25px;
}

.progress>.progress-type {
	position: absolute;
	left: 0px;
	font-weight: 800;
	padding: 3px 30px 2px 10px;
	color: rgb(255, 255, 255);
	background-color: rgba(25, 25, 25, 0.2);
}

.progress>.progress-completed {
	position: absolute;
	right: 0px;
	font-weight: 800;
	padding: 3px 10px 2px;
}

.step {
	text-align: center;
}

.step .col-md-2 {
	background-color: #fff;
	border: 1px solid #C0C0C0;
	border-right: none;
}

.step .col-md-2:last-child {
	border: 1px solid #C0C0C0;
}

.step .col-md-2:first-child {
	border-radius: 5px 0 0 5px;
}

.step .col-md-2:last-child {
	border-radius: 0 5px 5px 0;
}

.step .col-md-2:hover {
	color: #F58723;
	cursor: pointer;
}



.step .fa {
	padding-top: 15px;
	font-size: 40px;
}
</style>

<div id="content" ng-app="app">
	<div class="container background-white bottom-border" ng-controller="CartController as todoList">

      <div class="row no-margin">
         <div class="col-xs-12 margin-vert-10" style="background: rgb(221, 243, 254);padding: 10px 0px 1px 0px;">
            <h2 class="text-center text-primary">Giỏ hàng</h2>
         </div>
      </div>


		<div class="row" >
          <div class="col-xs-5">
         <img src="${ cp }/frontend/img/cart_left_panel.jpg" alt="dangky-tuvanhoatuoi"  >
          </div>
          <div class="col-xs-7 margin-top-20">
            <table class="table">
               <thead>
                  <tr>
                     <th>Tên sản phẩm</th>
                     <th>Giá tiền</th>
                     <th>SL</th>
                     <th>Thành tiền</th>
                  </tr>
               </thead>
               <tbody>
                  <tr>
                     <th>Dịu ngọt</th>
                     <td>450,000 VND</td>
                     <td>1</td>
                     <td>450,000 VND</td>
                  </tr>
                  <tr>
                     <th>Dịu ngọt</th>
                     <td>450,000 VND</td>
                     <td>1</td>
                     <td>450,000 VND</td>
                  </tr>
                   <tr>
                     <th colspan="3" style="text-align: right;">Tổng cộng : </th>
                     <td style="color: red">900,000 VND</td>
                  </tr>
               </tbody>
            </table>
            <div style="display: block;width:100%;text-align: right">
               <a class="button btn-info-customer" type="button" ><span>Cập nhập giỏ hàng</span></a>
               <a class="button btn-info-customer" type="button" ><span>Xóa giỏ hàng</span></a>
            </div>
            <a type="button" class="button btn-primary-customer margin-vert-10 pull-right">
                     <span>Thanh toán</span>
                  </a>
            
         </div>
		</div>
		
        <h2 class="text-center text-primary big-title margin-vert-10">Thanh Toán</h2>
      <form class="payment">

            <div style="width:33%;float: left;height: 368px" class="left-to-right">
               <h5 class="text-primary small-title-left no-margin">1.Thông tin người gửi</h5>
               <label class="text-primary">* Họ tên</label> <input
                  class="form-control margin-bottom-20"
                  type="text"
                  name="name">
                  <div style="width: 48%;float: left">  <label class="text-primary">* Email</label><input
                  class="form-control margin-bottom-20"
                  type="text"
                  name="name"></div>
                   <div style="width: 50%;float: left;margin-left: 5px">  <label class="text-primary">* Điện thoại</label><input
                  class="form-control margin-bottom-20"
                  type="text"
                  name="name"></div>
            </div>
            <div style="width:33%;float: left;height: 368px" class="left-to-right">
                <h5 class="text-primary small-title-left no-margin">2.Thông tin người nhận</h5>
                 
                  <div style="width: 48%;float: left">  <label class="text-primary">* Họ tên</label><input
                  class="form-control margin-bottom-20"
                  type="text"
                  name="name"></div>
                  
                   <div style="width: 50%;float: left;margin-left: 5px">  <label class="text-primary">* Điện thoại</label><input
                  class="form-control margin-bottom-20"
                  type="text"
                  name="name"></div>
                  
                  <label class="text-primary">* Địa chỉ</label> <input
                  class="form-control margin-bottom-20"
                  type="text"
                  name="name">
                  
                     <div style="width: 48%; float: left">
                        <div class="form-group">
                           <label class="text-primary">* Quốc gia</label> <select class="form-control">
                              <option value="">Vui lòng chọn</option>
                              <option>2</option>
                              <option>3</option>
                           </select>
                        </div>
                     </div>
                     
                  <div style="width: 50%;float: left;margin-left: 5px">  
                        <div class="form-group">
                          <label class="text-primary">* Tỉnh thành</label>
                          <select class="form-control">
                             <option value="">Vui lòng chọn</option>
                            <option>2</option>
                            <option>3</option>
                          </select>
                        </div>
                     </div>
                     
                     <div style="width: 48%; float: left">
                        <div class="form-group">
                           <label class="text-primary">* Quận huyện</label> <select class="form-control">
                              <option value="">Vui lòng chọn</option>
                              <option>2</option>
                              <option>3</option>
                           </select>
                        </div>
                     </div>
                     
                  <div style="width: 50%;float: left;margin-left: 5px">  
                        <div class="form-group">
                          <label class="text-primary">* Phường/Xã</label>
                          <select class="form-control">
                             <option value="">Vui lòng chọn</option>
                            <option>2</option>
                            <option>3</option>
                          </select>
                        </div>
                     </div>
                  
                  
                 
            </div>
            <div style="width:34%;float: left;height: 368px" class="left-to-right right-border">
               <h5 class="text-primary small-title-left no-margin">3.Thông tin sản phẩm</h5>
               <strong class="pull-right no-margin">Đơn vị tiền tệ : VND</strong>
                <table class="table">
               <tbody>
                  <tr>
                     <th>Sản phẩm</th>
                     <th>Giá tiền</th>
                     <th>SL</th>
                     <th>Thành tiền</th>
                  </tr>
                  <tr>
                     <td>Dịu ngọt</td>
                     <td>450,000</td>
                     <td>1</td>
                     <td>450,000</td>
                  </tr>
                  <tr>
                     <td>Dịu ngọt</td>
                     <td>450,000</td>
                     <td>1</td>
                     <td>450,000</td>
                  </tr>
                   <tr>
                     <th colspan="3" style="text-align: right;">Tổng cộng : </th>
                     <td style="color: red">900,000 VND</td>
                  </tr>
               </tbody>
            </table>
            </div>
            
             <div style="width:33%;float: left;height: 207px" class="left-to-right">
               <h5 class="text-primary small-title-left no-margin">4.Thông tin khác</h5>
               <p class="no-margin">Thời gian giao hàng</p>
                  <div style="width: 48%;float: left">  <label class="text-primary">* Ngày</label><input
                  class="form-control margin-bottom-20"
                  type="text"
                  name="name"></div>
                   <div style="width: 50%;float: left;margin-left: 5px">  <label class="text-primary">* Giờ</label><input
                  class="form-control margin-bottom-20"
                  type="text"
                  name="name"></div>
            </div>
            
            <div style="width:33%;float: left;height: 207px" class="left-to-right">
               <h5 class="text-primary small-title-left no-margin">5.Phương thức thanh toán</h5>
               <div class="radio">
                 <label>
                   <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>
                  Thanh toán online qua ATM
                 </label>
               </div>
               <div class="radio">
                 <label>
                   <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">
                   Thanh toán online qua Visa-MasterCard
                 </label>
               </div>
               <div class="radio disabled">
                 <label>
                   <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3" disabled>
                   Thanh toán qua Paypal
                 </label>
               </div>
                <div class="radio disabled">
                 <label>
                   <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3" disabled>
                   Chuyển khoản ngân hàng
                 </label>
               </div>
                <div class="radio disabled">
                 <label>
                   <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3" disabled>
                   Thanh toán trực tiếp khi nhận hàng (COD)
                 </label>
               </div>
            </div>
            
            <div style="width:34%;float: left;height: 207px" class="left-to-right right-border">
               <h5 class="text-primary small-title-left no-margin"> 6. <input type="checkbox" style="height:12px !important"> Xuất hóa đơn công ty</h5>
              
            </div>
            <div class="margin-vert-10" style="background: rgb(221, 243, 254);padding: 10px 30px 0px 0px;clear: both;height:150px">
                   <a class="btn btn-lg btn-primary-customer pull-right" href="#">
                      <i class="glyphicon glyphicon-usd pull-left"></i><span>Thanh toán<br><small>Cảm ơn bạn đã mua hàng</small></span></a>
            </div>
   
      </form>
      <%-- 1. Order --%>
		<div class="row activeStepInfo" id="step-1">
			<div class="col-xs-12">
				<div class="col-md-12">
					<div class="box box-primary box-solid">
		                <div class="box-header with-border" style="background: #000">
		                  <i class="flaticon-shopping100" ></i> <h2 class="box-title" style="color: #fff;text-transform: uppercase !important;"> Giỏ hàng</h2>
		                  <div class="box-tools pull-right">
		                    <button class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
		                  </div><!-- /.box-tools -->
		                </div><!-- /.box-header -->
		                <div class="box-body">
		                  <div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>Sản phẩm</th>
											<th>Giá</th>
											<th>Số lượng</th>
											<th>Thành tiền</th>
										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="order in transaction.orders">
											<td><img src="${dataDomain}{{ order.product.imageLink.url }}" alt=""
												width="100px" height="100px" /></td>
											<td>{{ order.price | number }}đ</td>
											<td>
												<i class="glyph-icon-20 flaticon-mathematics7" style="cursor: pointer;" ng-click="todoList.decreaseQty(order)"></i> 
												<input type="number" min="1" max="1000" ng-model="order.qty" style="width: 50px; text-align: center" /> 
												<i class="glyph-icon-20 flaticon-plussign8" style="cursor: pointer;"  ng-click="todoList.increaseQty(order)"></i>
											</td>
											<td>{{ order.price * order.qty | number}}đ</td>
										</tr>
									</tbody>
								</table>
							</div>
		                </div><!-- /.box-body -->
		                <div class="box-footer">
		                  <button
								class="btn btn-lg btn-primary pull-right padding-horiz-30"
								type="button"
								ng-disabled="todoList.disabledBtnGoToUserOrderInfo()"
								ng-click="todoList.resetActive(event, 20, 'step-2');">
								<i class="fa fa-arrow-right"></i> Bước tiếp theo
							</button>
		                </div>
		              </div>
		
				</div>
			</div>
		</div>
		
		<%-- 2. User order info --%>
		<div class="row hiddenStepInfo" id="step-2">
			<div class="col-xs-12">
				<div class="col-md-12">
					<div class="panel panel-aqua">
						<div class="panel-heading">
							<h3 class="panel-title">Thông tin người đặt</h3>
						</div>
						<div class="panel-body">


							<form>
								<div class="radio-inline">
									<label> <input type="radio" name="paymentmethod" value="BANK_TRANSER" ng-model="transaction.paymentMethod">
										Chuyển khoản 
									</label>
								</div>
								<div class="radio-inline">
									<label> <input type="radio" name="paymentmethod" value="DELIVERY_CASH" ng-model="transaction.paymentMethod" 
										checked="checked"> Giao hàng và nhận tiền
									</label>
								</div>
								<div class="form-group">
									<label>Tên</label> <input type="text" ng-model="transaction.customerName"
										class="form-control" maxlength="50">
								</div>
								<div class="form-group">
									<label>Điện thoại</label> <input type="text" ng-model="transaction.customerPhone"
										class="form-control" maxlength="20">
								</div>
								<div class="form-group">
									<label>Địa chỉ Email</label> <input type="email" ng-model="transaction.customerEmail"
										class="form-control" maxlength="50">
								</div>
								<div class="form-group">
									<label>Địa chỉ</label>
									<textarea type="email" class="form-control" ng-model="transaction.customerAddress" maxlength="100"></textarea>
								</div>

							</form>
							<div class="clearfix padding-bottom-30"></div>
							<button
								class="btn btn-lg btn-primary pull-right padding-horiz-30"
								type="button"
								ng-disabled="todoList.disabledBtnGoToReceiverInfo()"
								ng-click="todoList.resetActive(event, 40, 'step-3');">
								<i class="fa fa-arrow-right"></i> Bước tiếp theo
							</button>

						</div>
					</div>
				</div>
			</div>
		</div>
		
		<%-- 3. User receiver --%>
		<div class="row hiddenStepInfo" id="step-3">
			<div class="col-xs-12">
				<div class="col-md-12">
					<div class="panel panel-aqua">
						<div class="panel-heading">
							<h3 class="panel-title">Thông tin người nhận</h3>
						</div>
						<div class="panel-body">


							<form>
								<div class="checkbox">
									<label> <input type="checkbox" ng-model="copyFromUserOrder" ng-change="todoList.copyUserInfo()">
										Giống thông tin người đặt
									</label>
								</div>
								<div class="form-group">
									<label>Tên</label> <input type="text" ng-model="transaction.receiverName"
										class="form-control">
								</div>
								<div class="form-group">
									<label>Điện thoại</label> <input type="text" ng-model="transaction.receiverPhone"
										class="form-control">
								</div>
								<div class="form-group">
									<label>Địa chỉ Email</label> <input type="email" ng-model="transaction.receiverEmail"
										class="form-control">
								</div>
								<div class="form-group">
									<label>Địa chỉ</label>
									<textarea type="email" class="form-control" ng-model="transaction.receiverAddress"></textarea>
								</div>

							</form>
							<div class="clearfix padding-bottom-30"></div>
							<button
								class="btn btn-lg btn-primary pull-right padding-horiz-30"
								type="button"
								ng-disabled="todoList.disabledBtnGoPaymentInfo()"
								ng-click="todoList.resetActive(event, 60, 'step-4');">
								<i class="fa fa-arrow-right"></i> Bước tiếp theo
							</button>

						</div>
					</div>
				</div>
			</div>
		</div>
		
		<%-- 4. Payment info --%>
		<div class="row hiddenStepInfo" id="step-4">
			<div class="col-xs-12">
				<div class="col-md-12">
					<div class="panel panel-aqua">
						<div class="panel-heading">
							<h3 class="panel-title">Thông tin thanh toán</h3>
						</div>
						<div class="panel-body">


							<blockquote>
								<p>
									<em>Tiền giỏ hàng</em> <em class="pull-right">{{todoList.totalMoney()}}đ</em>
								</p>
							</blockquote>
							<blockquote>
								<p>
									<em>Giảm giá</em> <em class="pull-right">0đ</em>
								</p>
							</blockquote>
							<hr />

							<div class="clearfix padding-bottom-20"></div>
							<h3 class="pull-right">
								Tổng tiền: <strong class="text-danger">{{todoList.totalMoney()}}đ</strong>
							</h3>
							<div class="clearfix padding-bottom-30"></div>
							<button
								class="btn btn-lg btn-primary pull-right padding-horiz-30"
								type="button"
								ng-click="todoList.order();">
								<i class="fa fa-shopping-cart"></i> Đặt hàng
							</button>

						</div>
					</div>
				</div>
			</div>
		</div>
		
		<%-- 5. Summary --%>
		<div class="row hiddenStepInfo" id="step-5">
			<div class="col-xs-12">
				<div class="col-md-12">
					<div class="panel panel-aqua">
						<div class="panel-heading">
							<h3 class="panel-title">Hóa đơn</h3>
						</div>
						<div class="panel-body">

							<blockquote>
								<p>
									<em>Mã hóa đơn</em> <em class="pull-right">MS&#35;{{transaction.id}}</em>
								</p>
							</blockquote>
							<blockquote>
								<p>
									<em>Tên người nhận</em> <em class="pull-right">{{transaction.receiverName}}</em>
								</p>
							</blockquote>
							<blockquote>
								<p>
									<em>Điện thoại</em> <em class="pull-right">{{transaction.receiverPhone}}</em>
								</p>
							</blockquote>
							<blockquote>
								<p>
									<em>Email</em> <em class="pull-right">{{transaction.receiverEmail}}</em>
								</p>
							</blockquote>
							<blockquote>
								<p>
									<em>Địa chỉ giao hàng</em> <em class="pull-right">{{transaction.receiverAddress}}</em>
								</p>
							</blockquote>
							<hr />
							<div class="table-responsive">
								<table class="table">
									<thead>
										<tr>
											<th>Sản phẩm</th>
											<th>Số lượng</th>
										</tr>
									</thead>
									<tbody>
										<tr ng-repeat="order in transaction.orders">

											<td>{{order.product.name}}</td>
											<td>{{order.qty}}</td>
										</tr>
									</tbody>
								</table>


							</div>
							<div class="clearfix padding-bottom-20"></div>
							<h3 class="pull-right">
								Tổng tiền: <strong class="text-danger">{{todoList.totalMoney()}}đ</strong>
							</h3>
							<div class="clearfix padding-bottom-30"></div>
							<button
								class="btn btn-lg btn-primary pull-right padding-horiz-30"
								type="button"
								onclick="window.location.href='${ cp }/san-pham'">
								<i class="fa fa-home"></i> Tiếp tục mua hàng
							</button>
						</div>
					</div>
				</div>
			</div>
		</div>


	</div>
</div>

<script type="text/javascript">

	var module = angular.module('app', []).controller('CartController',CartController);
	
	function CartController($scope, $http) {
		var todoList = this;
		
		$http.get('transaction').success(function(data){
	  		$scope.transaction = data;
	    });
		
		todoList.decreaseQty = function(order){
			if(order.qty > 1){
				order.qty --;
			}
		};
		
		todoList.increaseQty = function(order){
			if(order.qty < 1000){
				order.qty ++;
			}
		};
		
		todoList.increaseQty = function(order){
			if(order.qty < 1000){
				order.qty ++;
			}
		};
		
		todoList.copyUserInfo = function(){
			if($scope.copyFromUserOrder){
				$scope.transaction.receiverName = $scope.transaction.customerName;
				$scope.transaction.receiverPhone = $scope.transaction.customerPhone;
				$scope.transaction.receiverEmail = $scope.transaction.customerEmail;
				$scope.transaction.receiverAddress = $scope.transaction.customerAddress;
			}
		};
		
		todoList.totalMoney = function(){
			var total = 0;
			if($scope.transaction != null 
					&& $scope.transaction.orders != null){
				angular.forEach($scope.transaction.orders, function(order) {
	   		          total += (order.price * order.qty);
	   		    });
			}
			return total;
		};
		
		todoList.disabledBtnGoToUserOrderInfo = function(){
			return ($scope.transaction == null
					|| $scope.transaction.orders == null
					|| $scope.transaction.orders.length == 0);
		};
		
		todoList.disabledBtnGoToReceiverInfo = function(){
			return ($scope.transaction == null
					|| $scope.transaction.customerName == null
					|| $scope.transaction.customerName == ''
					|| $scope.transaction.customerPhone == null
					|| $scope.transaction.customerPhone == ''
					|| $scope.transaction.customerEmail == null
					|| $scope.transaction.customerEmail == ''
					|| $scope.transaction.customerAddress == null
					|| $scope.transaction.customerAddress == ''
					|| $scope.transaction.paymentMethod == null);
		};
		
		todoList.disabledBtnGoPaymentInfo = function(){
			return ($scope.transaction == null
					|| $scope.transaction.receiverName == null
					|| $scope.transaction.receiverName == ''
					|| $scope.transaction.receiverPhone == null
					|| $scope.transaction.receiverPhone == ''
					|| $scope.transaction.receiverEmail == null
					|| $scope.transaction.receiverEmail == ''
					|| $scope.transaction.receiverAddress == null
					|| $scope.transaction.receiverAddress == '');
		};
		
		todoList.order = function(){
			$http.post('${cp}/saveCart', $scope.transaction).success(function(data){
				$scope.transaction.id = data.id;
				todoList.resetActive(event, 80, 'step-5');
	        }).error(function(data, status, headers, config){
	        	//console.log(data);
	        });
		};
		
		todoList.resetActive = function(event, percent, step){
			$(".progress-bar").css("width", percent + "%").attr("aria-valuenow",
					percent);
			$(".progress-completed").text(percent + "%");

			$("span").each(function() {
				if ($(this).hasClass("activestep")) {
					$(this).removeClass("activestep");
				}
			});
			var u = "#" + step + "-small";
			$(u).addClass("activestep");
			todoList.hideSteps();
			todoList.showCurrentStepInfo(step);
		};
		
		todoList.hideSteps = function() {
			$("div").each(function() {
				if ($(this).hasClass("activeStepInfo")) {
					$(this).removeClass("activeStepInfo");
					$(this).addClass("hiddenStepInfo");
				}
			});
		}

		todoList.showCurrentStepInfo = function(step) {
			var id = "#" + step;
			$(id).addClass("activeStepInfo");
		}
		
	};

	
</script>