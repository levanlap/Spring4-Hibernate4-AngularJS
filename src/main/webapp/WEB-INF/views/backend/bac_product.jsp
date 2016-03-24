<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	
<style type="text/css">
.form-group .error-msg {
	display: none;
}

.form-group.has-error .error-msg {
	display: block;
}
table {
	font-size: 13px
}
.paging-customer{
	margin-top: 0px !important;
	margin-bottom: 0px !important;
}
.bienMat{
position: absolute;
top:-3000px}
.hienLai{
position: static;
}
</style>
 
<div id="product-container" class="content-wrapper" ng-controller="ProductListController as todoList" ng-init="todoList.init()">
   
   <div class="widget-box widget-color-dark" id="body-product">
		<!-- #section:custom/widget-box.options -->
		<div class="widget-header">
			<h5 class="widget-title">
				<i class="ace-icon fa fa-table"></i> Sản phẩm
			</h5>
				<div class="widget-toolbar">
				<a href="#" ng-click="todoList.createNew()" class="tooltip-success"
					data-toggle="tooltip" title="Thêm sản phẩm mới"> <i
					class="ace-icon fa green fa-plus bigger-125"></i>
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
							<th> <i class="menu-icon fa fa-image"></i> <spring:message code="product.image" /></th>
									<th><i class="menu-icon fa fa-tasks"></i> <spring:message code="product.name" /></th>
									<th><i class="menu-icon fa fa-calendar"></i> <spring:message code="product.created.date" /></th>
									<th class="text-center"><i class="menu-icon fa fa-tasks"></i> <spring:message
											code="product.action" /></th>
						</tr>
					</thead>
					<tbody>
						<tr ng-repeat="p in products track by $index">
							<td><img ng-if="p.imageLink != null" src="${dataDomain}{{p.imageLink.url}}" style="width: 25px; height: 25px" /></td>
							<td>{{ p.name }}</td>
							<td>{{ p.createdDate | date:'dd/MM/yyyy' }}</td>
							<td class="text-center" ng-init="todoList.tooltip()">
								<span
									ng-click="todoList.edit(p.id)" data-toggle="tooltip"  class="tooltip-info"
                                    onmouseover="themHieuUngXoay(this)"
                                    onmouseout="xoaHieuUngXoay(this)"
									title="<spring:message code="message.button.edit"></spring:message>">
									<i class="ace-icon fa blue fa-pencil-square-o bigger-150"></i>
								</span>
								<span
									ng-click="todoList.delete(p.id)" 
									data-toggle="tooltip" 
                                    class="tooltip-error"
                                    onmouseover="themHieuUngXoay(this)"
                                    onmouseout="xoaHieuUngXoay(this)"
									title="<spring:message code="message.button.delete"></spring:message>">
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
	<section class="content">
		<div class="row">
			<%-- <div class="col-xs-12" id="body-product" style="display: none">
			
				<div class="box box-success box-solid">
					
					<div class="box-header">
						<h3 class="box-title">
							<spring:message code="product.list" />
						</h3>
						<div class="pull-right box-tools">
							<button class="btn-link"
								ng-click="todoList.createNew()">
								<i class="fa fa-plus"></i>
								<spring:message code="message.button.new" />
							</button>
						</div>
					</div>
					
					<div class="box-body">
					
						Table List Product
						<table datatable="ng" dt-options="todoList.dtOptions"
							dt-column-defs="todoList.dtColumnDefs"
							class="table table-bordered table-striped">

							<thead>
								<tr>
									<th><spring:message code="product.image" /></th>
									<th><spring:message code="product.name" /></th>
									<th><spring:message code="product.created.date" /></th>
									<th class="text-center"><spring:message
											code="product.action" /></th>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="p in products track by $index">
									<td><img ng-if="p.imageLink != null" src="${dataDomain}{{p.imageLink.url}}" style="width: 100px; height: 100px" /></td>
									<td>{{ p.name }}</td>
									<td>{{ p.createdDate | date:'dd/MM/yyyy' }}</td>
									<td class="text-center" ng-init="todoList.tooltip()">
										<span
											class="icon icon-wrench icon-black" 
											ng-click="todoList.edit(p.id)" data-toggle="tooltip" 
											title="<spring:message code="message.button.edit"></spring:message>">
											<i class="ace-icon fa fa-pencil-square-o bigger-120"></i>
										</span>
										<span class="icon icon-bin icon-black"
											ng-click="todoList.delete(p.id)" 
											data-toggle="tooltip" 
											title="<spring:message code="message.button.delete"></spring:message>">
											<i class="ace-icon fa fa-recycle bigger-120"></i>
										</span>
									</td>
								</tr>
							</tbody>
						</table>
                </div><!-- /.box-body -->
              </div><!-- /.box -->
            </div> --%>
            
            <%-- Detail product --%>
            
            <div class="widget-box widget-color-dark bienMat" id="detailProduct" >
						<div class="widget-header">
							<h5 class="widget-title"><spring:message code="product.detail" /></h5>
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
								<form id="productForm" name="productForm" method="POST">
						<div id="product-detail-tabs" class="tabbable box-body nav-tabs-custom">

							<ul class="nav nav-tabs">
								<li class="active"><a href="#product-info" data-toggle="tab">
									<spring:message code="product.tab.product.info" /></a></li>
									<li><a href="#product-price" data-toggle="tab">
									Giá</a></li>
								<li><a href="#product-images" data-toggle="tab">
									<spring:message code="product.tab.image" /></a></li>
								<li><a href="#product-detail-note" data-toggle="tab">
									<spring:message code="product.detail.note" /></a></li>
								<li><a href="#product-order-note" data-toggle="tab">
									<spring:message code="product.order.note" /></a></li>
								<li><a href="#product-detail" data-toggle="tab">
									<spring:message code="product.tab.description" /></a></li>
							</ul>
							
							<div class="tab-content" style="padding-top: 20px;border: 1px solid #c5d0dc;">
							
								<%-- Tab product-info --%>
							    <div id="product-info" class="tab-pane active row">
							    	<%-- Name --%>
							    	<div class="form-group col-md-6" ng-class="{ 'has-error' : productForm.name.$invalid &amp;&amp; !productForm.name.$pristine }">
										<label><spring:message code="product.name" /> <span style="color: #f56954">(*)</span></label> 
										<input type="text" maxlength="50" name="name" 
												class="form-control ng-dirty ng-valid ng-valid-required" required=""
												ng-model="product.name" 
												ng-blur="todoList.makeFriendURL()"
												placeholder="<spring:message code="product.name.validate.maxlength.50" />">
										<p ng-show="productForm.name.$invalid &amp;&amp; !productForm.name.$pristine" class="help-block ng-hide">
											<spring:message code="product.name.validate.maxlength.50" />
										</p>
									</div>
									
									<%-- Code --%>
							    	<div class="form-group col-md-6">
										<label><spring:message code="product.code" /> </label> 
										<input type="text" maxlength="50" name="code" 
												class="form-control"
												ng-model="product.code">
									</div>
									
									<%-- Friend URL --%>
									<div class="form-group col-md-12" style="margin-bottom: 0;">
										<label>
											<spring:message code="product.seo" /> <span style="color: #f56954">(*)</span>
											<i style="font-size: 12px;"><spring:message code="product.seo.hint" /></i>
										</label>
									</div>
									<div class="input-group" style="margin-bottom: 15px">
										<span class="input-group-addon">http://tuvanhoatuoi.com/chi-tiet-san-pham/</span>
										<input type="text" maxlength="50" name="friendURL" 
												class="form-control" 
												ng-model="product.friendURL"
												ng-disabled="false">
									</div>
									
									<%-- Status --%>
									<div class="form-group col-md-6" ng-class="{ 'has-error' : productForm.status.$invalid &amp;&amp; !productForm.status.$pristine }">
										<label><spring:message code="product.status" /> <span style="color: #f56954">(*)</span></label> 
										<select name="status" class="form-control ng-dirty ng-valid ng-valid-required" 
											required="" ng-model="product.status">
											<option value="NEW"><spring:message
													code="product.status.new" /></option>
											<option value="SALE"><spring:message
													code="product.status.discount" /></option>
											<option value="PUBLISHED"><spring:message
													code="product.status.published" /></option>
											<option value="DISABLED"><spring:message
													code="product.status.disabled" /></option>
										</select>
										<p ng-show="productForm.status.$invalid &amp;&amp; !productForm.status.$pristine" class="help-block ng-hide">
											<spring:message code="product.name.validate.maxlength.50" />
										</p>
									</div>
									
									<%-- Catalog --%>
									<div class="form-group col-md-6" ng-class="{ 'has-error' : productForm.catalog.$invalid &amp;&amp; !productForm.catalog.$pristine }">
										<label><spring:message code="product.catalog.name" /> <span style="color: #f56954">(*)</span></label> 
										<%-- <select name="catalog" class="form-control ng-dirty ng-valid ng-valid-required" required=""
											ng-model="product.catalog"
											ng-options="catalog.name for catalog in catalogs track by catalog.id">
											<option value="">--
												<spring:message code="product.choose.catalog.default" /> --
											</option>
										</select> --%>
										
                                       <div ng-bind-html="expression | to_trusted"></div>
                                                     
										
										<p ng-show="productForm.catalog.$invalid &amp;&amp; !productForm.catalog.$pristine" class="help-block ng-hide">
											<spring:message code="product.choose.catalog.default" />
										</p>										
									</div>
									
							    </div>
							    
							     <%-- Tab product-detail --%>
								<div class="tab-pane row" id="product-price">
									<%-- Small Price --%>
									<div class="form-group col-md-6">
										<label>Giá Loại Nhỏ</label> 
										<input type="number" class="form-control" name="smallPrice" ng-model="product.smallPrice"
											placeholder="<spring:message code="product.name.validate.price" />"></input>
									</div>
									
									<%-- Small Price Discount --%>
									<div class="form-group col-md-6">
										<label>Giá Loại Nhỏ Giảm</label> <input
											class="form-control" ng-model="product.discountSmallPrice"
											type="number"
											placeholder="Giá Loại Nhỏ Giảm..."></input>
									</div>
									
									<%-- Medium Price --%>
									<div class="form-group col-md-6">
										<label>Giá Loại Vừa</label> 
										<input type="number" class="form-control" name="mediumPrice" 
											ng-model="product.mediumPrice"
											placeholder="<spring:message code="product.name.validate.price" />"></input>
									</div>
									
									<%-- Medium Price Discount --%>
									<div class="form-group col-md-6">
										<label>Giá Loại Vừa Giảm</label> <input
											class="form-control" ng-model="product.discountMediumPrice"
											type="number"
											placeholder="Giá Loại Vừa Giảm..."></input>
									</div>
									
									<%-- Large Price --%>
									<div class="form-group col-md-6">
										<label>Giá Loại Lớn</label> 
										<input type="number" class="form-control" name="largePrice"
											ng-model="product.largePrice"
											placeholder="<spring:message code="product.name.validate.price" />"></input>
									</div>
									
									<%-- Medium Large Discount --%>
									<div class="form-group col-md-6">
										<label>Giá Loại Lớn Giảm</label> <input
											class="form-control" ng-model="product.discountLargePrice"
											type="number"
											placeholder="Giá Loại Lớn Giảm..."></input>
									</div>
									
							    </div>
							    
							    <%-- Tab product-images --%>
							    <div id="product-images" class="tab-pane row">
									<%-- Main Image --%>
									<div id="imageLink-group" class="form-group col-md-4">
										<label><spring:message code="product.image.basic" /><span style="color: #f56954">(*)</span>: </label>
										<a ng-click="todoList.selectImageLink()" class="blue"
											style="font-size: 10px; cursor: pointer"><spring:message
												code="product.choose.image.library" /></a>
										<div ng-if="product.imageLink != null">
											<img id="imageLink" alt=""
												src="${dataDomain}{{product.imageLink.url}}"
												style="width: 100px; height: 100px; margin: 10px;"
												class="img-rounded">
										</div>
										<label class="error-msg"><i class="fa fa-times-circle-o"></i>
										<spring:message code="product.choose.image.basic" /></label>
									</div>
									
									<%-- Other Images --%>
									<div class="form-group col-md-8">
										<label><spring:message code="product.image.orther" />:
										</label> <a ng-click="todoList.selectImageList()" class="blue"
											style="font-size: 10px; cursor: pointer"><spring:message
												code="product.choose.from.library" /></a>
										<div ng-repeat="image in product.imageList">
											<div
												style="text-align: center; float: left; width: 100px; margin: 10px;">
												<img alt="" src="${dataDomain}{{image.url}}"
													style="width: 100px; height: 100px" class="img-rounded">
												<a ng-click="todoList.removeImageList(image.id)"
													style="cursor: pointer"><spring:message
														code="message.button.delete" /> </a>
											</div>
										</div>
										<div style="clear: both"></div>
									</div>
							    </div>
							    
							    <%-- Tab product-detail --%>
								<div class="tab-pane" id="product-detail">
									<%-- Detail --%>
									<div class="form-group">
										<textarea name="productContent" ckeditor="editorOptions" ng-model="product.content"></textarea>
									</div>
							    </div>
							    
							    <%-- Tab product-note --%>
								<div class="tab-pane" id="product-detail-note">
									
									<%-- Detail Note --%>
									<div class="form-group">
										<textarea id="productDetailNote" ckeditor="editorOptions" name="productDetailNote" class="form-control" rows="3"
											ng-model="product.detailNote" maxlength="500"
											placeholder="<spring:message code="product.detail.note.hint" />"></textarea>
									</div>
									
							    </div>
							    <div class="tab-pane" id="product-order-note">
									
									<%-- Order Note --%>
									<div class="form-group">
										<textarea id="productOrderNote" ckeditor="editorOptions" name="productOrderNote" class="form-control" rows="3"
											ng-model="product.orderNote" maxlength="500" 
											placeholder="<spring:message code="product.order.note.hint" />"></textarea>
									</div>
									
							    </div>
							</div>	
							
							
						</div>
					
					</form>
							</div>
                     <div class="widget-toolbox padding-8 clearfix">

                       <button id='btnSubmit' type="button" class="btn btn-app btn-grey btn-xs radius-4 pull-right" ng-disabled="todoList.disabledBtnSave();"
									ng-click="todoList.save()">
									<i class="ace-icon fa fa-floppy-o bigger-160"></i>
									<spring:message code="message.button.save"></spring:message>
   								</button>
         				<button  type="button" class="btn btn-app btn-warning btn-xs radius-4 pull-left" style="width: 90px" onclick=" $('#detailProduct').addClass('bienMat').removeClass('hienLai');$('#body-product').show('slow')">
         					<i class="ace-icon fa fa-list bigger-160"></i>
         					<spring:message code="message.button.list" />
         				</button>
                              
                     </div>
						</div>
				</div>
			<%-- Detail product --%>

		</div>

	</section>
	<!-- /.content -->

</div>

<script>
	var app = angular.module('app',["bw.paging",'datatables', 'ngCkeditor']);
	app.filter('to_trusted', ['$sce', function($sce){
        return function(text) {
            return $sce.trustAsHtml(text);
        };
    }]);
	app.controller('ProductListController',ProductListController);
	
	function ProductListController($rootScope, $scope, $http) {
		var todoList = this;

		
		$scope.$on('selectFile', function(event, dataResponse) {
			console.log("=======================================selectFile");
			console.log(dataResponse);
			if(dataResponse != null && dataResponse.data != null){
				if($scope.MULTI_SELECT){
					$scope.product.imageList.push(dataResponse.data);
				}else{
					$scope.product.imageLink = dataResponse.data;
				}
			}
		}); 
		
		todoList.init = function(){
			$scope.paging={total:${total},currentPage:1,pageSize:10};
			$scope.editorOptions = {
	                language: 'vi',
	                height: "200"
	            };
			todoList.loadProducts();
		}
		
		todoList.loadProducts = function(){
			$http.get('listProducts/'+$scope.paging.currentPage+"/"+$scope.paging.pageSize).success(function(data){
		  		$scope.products = data;
		 		$('#body-product').show();
	        });
		}
		
		todoList.DoCtrlPagingAct = function( page, pageSize){
			$scope.paging.currentPage = page;
			$scope.paging.pageSize = pageSize;
			todoList.loadProducts();
	    };
		
	/* 	$http.get('listProducts').success(function(data){
	  		$scope.products = data;
	  		$('#body-product').show();
	    })
	 */
		
	    
		$http.get('listSelectionCatalogs').success(function(data){
			$scope.catalogs = data;
			var html = '<select style="width:350px;"  data-placeholder="Chọn một số cataloge..." id="mutise" class="chosen-select form-control tag-input-style" multiple tabindex="6"><option value=""></option>';
			var flag=true;
			angular.forEach($scope.catalogs, function(obj) {
				if(obj.id==32){
				    console.log(obj.parentId);
				}
				 if(obj.parentId==0){
					 if(flag==true){
						 html=html+'<optgroup label="'+obj.name+'">';
					 }else{
						 html=html+'</optgroup>';
						 html=html+'<optgroup label="'+obj.name+'">';
						 
					 }
						
						 flag=false;
				 }else{
					 html=html+'<option value="'+obj.id+'">'+obj.name+'</option>';
				 }
				});
			html=html+' </optgroup> </select>';
            $scope.expression=html;
        
	    })
			
	    /* call tooltip */
		todoList.tooltip = function() {
			$('[data-toggle="tooltip"]').tooltip();
		};
	    
		/* Edit product */
		todoList.edit = function(id) {
			
			for(i in $scope.products) {
	            if($scope.products[i].id == id) {
	                $scope.product = angular.copy($scope.products[i]);
	                $scope.productCatalogIds = [];
	                if( $scope.product.catalogs != null ){
	                	for( var inx in $scope.product.catalogs ){
	                		$scope.productCatalogIds.push($scope.product.catalogs[inx].id);
	                	}
	                	$('#mutise').val($scope.productCatalogIds);
               		    $('.chosen-select').chosen({allow_single_deselect:true}); 
               		 	$('.chosen-select').trigger('chosen:updated');
	                }
	                $("#detailProduct").removeClass('bienMat').addClass('hienLai');
	          		/* $("#detailProduct").show('slow'); */
	          		$('#body-product').hide('slow');
	          		$('#product-detail-tabs a:first').tab('show');
	            }
	        }
		};
		
		/* Delete Product*/
		todoList.delete = function(id) {
			BootstrapDialog.confirm({
	            message: '<spring:message code="message.delete.content" />',
	            type: BootstrapDialog.TYPE_WARNING,
	            btnOKClass: 'btn-warning',
	            callback: function(result) {
	                if(result) {
	                	$http.post('deleteProduct/'+id).success(function(response){
	                		if(response == null || response == 'null' || response == ''){
	                			// CAN NOT DELETE
	                			BootstrapDialog.show({
	        			            message: 'Không thể xóa sản phẩm này. Có lẽ sản phẩm này đã được đặt hàng',
	        			            type: BootstrapDialog.TYPE_DANGER,
	        			            buttons: [{
	        			                label: '<spring:message code="message.button.cancel" />',
	        			                action: function(dialogItself){
	        			                    dialogItself.close();
	        			                }
	        			            }]
	        		        	});
	                		}else{
	                			// DELETE SUCCESS
	                			angular.forEach($scope.products,function(obj, index) {
		      	       		          if(obj.id == id){
		      	       		        	  $scope.products.splice(index, 1);
		      	       		          }
		      	       		      });
	                		}
		      	       	 });	
	                }
	            }
	        });
		};
		
		/* Save product */
		todoList.save = function() {
			$scope.productCatalogIds =  $('#mutise').val();
			var catalogIds = "";
			for(var inx in $scope.productCatalogIds){
				catalogIds += (',' + $scope.productCatalogIds[inx]);
			}
			$scope.product.catalogIds = catalogIds;
			
			$http.post('saveProduct',$scope.product).success(function(response){
				
				if(response.status == 'SUCCESS'){
					 $("#detailProduct").addClass('bienMat').removeClass('hienLai');
		          	 $('#body-product').show();
					 if($scope.product.id == null){
						 $scope.products.unshift(response.data);
						 thongBao.luuTruThanhCong();
					 }else{
						 thongBao.chinhSuaThanhCong();
					 	for(i in $scope.products) {
				            if($scope.products[i].id == response.data.id) {
				            	$scope.products[i] = angular.copy(response.data);
				            }
				        }   
					 }
				}else{
					thongBao.sanPhamTonTai();
				}
				
	        });
		};
		
		/* Create New Product */
		todoList.createNew = function(){
			$scope.product = {};
			$scope.product.status = 'NEW';
			$scope.productCatalogIds = [];
			$('#mutise').val($scope.productCatalogIds);
   		    $('.chosen-select').chosen({allow_single_deselect:true}); 
   		 	$('.chosen-select').trigger('chosen:updated');
			$("#detailProduct").removeClass('bienMat').addClass('hienLai');
	  		$('#body-product').hide('slow');
		};
		
		todoList.makeFriendURL = function(){
			$http.post('makeProductFriendURL',$scope.product).success(function(data){
				$scope.product.friendURL = data.friendURL;
				$("#friendURL").val( $scope.product.friendURL );
	        });
		};
		
		todoList.disabledBtnSave = function(){
			return $scope.product == null 
				|| $scope.product.name == null || $scope.product.name == ''
				|| $scope.product.friendURL == null || $scope.product.friendURL == ''
				|| $scope.product.status == null || $scope.product.status == ''
				|| $scope.productCatalogIds == null || $scope.productCatalogIds.length == 0
				|| $scope.product.imageLink == null;
		}
		
		/* Display the gallery image popup to select new main image for product */
		todoList.selectImageLink = function(){
			$scope.MULTI_SELECT = false;
			$rootScope.$broadcast('showFileUpload', {boxId : 'product-container'});
		}
		
		/* Display the gallery image popup to select new list images for product */
		todoList.selectImageList = function(){
			$scope.MULTI_SELECT = true;
			$rootScope.$broadcast('showFileUpload', {boxId : 'product-container'});
		}
		
		/* Set new list images to product */
		todoList.removeImageList = function(id){
			var newImageList = [];
			angular.forEach($scope.product.imageList,function(obj) {
				if( obj.id != id ){
					newImageList.push(obj);
				}
		    });
			$scope.product.imageList = newImageList;
		};
		
		
	};
	
</script>
<jsp:include page="fileupload/fileupload-fragment.jsp" />

