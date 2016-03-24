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
</style>

<div class="content-wrapper" ng-controller="ImageListController as imageList">
	<section class="content">
		<div class="row">
			<div class="col-xs-12" id="body-image" style="display: none">
			
				<div class="box box-success box-solid" id="body-image">
				
					<div class="box-header">
						<h3 class="box-title"> Hình ảnh</h3>
						<div class="pull-right box-tools" style="padding: 0 15px;">
							<button class="btn-link" ng-click="imageList.createNew()">
								<spring:message code="message.button.new"/>
							</button>
							
						</div>
					</div>
					
					<!-- /.box-header -->
					<div class="box-body">
						<table datatable="ng" dt-options="imageList.dtOptions" dt-column-defs="imageList.dtColumnDefs" class="table table-bordered table-striped">

							<thead>
								<tr>
									<th width="75px">Hình ảnh</th>
									<th>Tên hình ảnh</th>
									<th>Link URL</th>
									<th class="text-center">Nghiệp vụ</th>
								</tr>
							</thead>
							<tbody>
								<tr ng-repeat="image in images track by $index">
									<td class="text-center"><img src="${cp }/images/{{ image.url }}" style="width: 50px; height: 60px" class="img-rounded"/></td>
									<td>{{ image.name }}</td>
									<td>http://112.78.1.85/images/{{ image.url }}</td>
									<td class="text-center" ng-init="imageList.tooltip()"><span
												class="icon icon-wrench icon-black"  data-toggle="tooltip"  title="<spring:message code="message.button.edit"></spring:message>"
												ng-click="imageList.edit(image.id)">
											</span>
											<span class="icon icon-bin icon-black" data-toggle="tooltip" title="<spring:message code="message.button.delete"></spring:message>"
													ng-click="imageList.deleteImage(image)">
											</span>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<!-- /.box-body -->
					
				</div>
				<!-- /.box -->
				
				
				
			</div>
			<!-- /.col-xs-12 -->
			
			<!-- Detail image -->
			<div class="col-xs-12" id="detailImage" style="display: none">
			
				<div class="box box-info">
				
					<div class="box-header">
						<h3 class="box-title">Chi tiết hình ảnh</h3>
					</div>

					<form id="imageForm" name="imageForm" method="POST" enctype="multipart/form-data" accept-charset="UTF-8">
						<div class="box-body">
						
							<%-- File --%>
                            <div id="file-group" class="form-group" ng-if="image.id == null" 
                            	ng-class="{ 'has-error' : imageForm.file.$invalid &amp;&amp; !imageForm.file.$pristine }">
                               <label>Hình ảnh <span style="color: #f56954">(*)</span></label>
                               <input id="file" type="file" name="file" 
                               		class="form-control ng-dirty ng-valid ng-valid-required">
                               <p ng-show="imageForm.file.$invalid &amp;&amp; !imageForm.file.$pristine" class="help-block ng-hide">
									<spring:message code="image.file.required" />
								</p>
                            </div>
                                    
                            <%-- Name --%>
							<div class="form-group"
								ng-class="{ 'has-error' : imageForm.name.$invalid &amp;&amp; !imageForm.name.$pristine }">
                               <label>Tên hình ảnh <span style="color: #f56954">(*)</span></label>
                                <input id="name" type="text" name="name" class="form-control ng-dirty ng-valid ng-valid-required" 
                                	ng-model="image.name" required="required" maxlength="50" >
                                <p ng-show="imageForm.name.$invalid &amp;&amp; !imageForm.name.$pristine" class="help-block ng-hide">
									<spring:message code="image.name.required" />
								</p>
                            </div>
						</div>
						<!-- /.box-body -->

						<%-- Actions --%>
						<div class="box-footer" style="text-align: right">
							
                            <a class="btn btn-default btn-flat" ng-click="imageList.loadImages();">
                                        <i class="fa fa-picture-o"></i> Danh sách
                                    </a>
                            <a id="btnSave" class="btn btn-primary btn-flat"
                            		ng-disabled="imageForm.file.$invalid || imageForm.name.$invalid" 
                            		ng-click="imageList.save()">
                                        <i class="fa fa-save"></i> Lưu trữ 
                                    </a> 
							
						</div>
						
					</form>
				</div>
			</div>
		</div>		
		
	</section>
	<!-- /.content -->

</div>
<script>
angular.module('app',['datatables']).controller('ImageListController',ImageListController);

function ImageListController($scope, $http,DTOptionsBuilder, DTColumnDefBuilder, DTInstances) {
	var imageList = this;
	imageList.dtOptions = DTOptionsBuilder.newOptions().withPaginationType('full_numbers');
	imageList.dtColumnDefs = [
	    DTColumnDefBuilder.newColumnDef(3).notSortable()
	];

 	/* Load listImages */
 	imageList.loadImages = function(){
 		$http.get('listImages').success(function(data){
 	  		$scope.images = data;
 	  		$('#body-image').show('slow');
 	  		$("#detailImage").hide('slow');
 	    });
 	}
 	imageList.loadImages();
 	
 	/* Create New Image */
	imageList.createNew = function(){
		$scope.image = {};
		$("#closeListImages").click();
  		$("#detailImage").show();
  		$('#body-image').hide();
  		$("#file-group").show();
  		$("#file").val('');
	};
	/* call tooltip */
	imageList.tooltip = function() {
		$('[data-toggle="tooltip"]').tooltip();
	};
	/* Edit image */
	imageList.edit = function(id) {
		for(i in $scope.images) {
            if($scope.images[i].id == id) {
                $scope.image = angular.copy($scope.images[i]);
            	$("#closeListImages").click();
          		$("#detailImage").show('slow');
          		$('#body-image').hide('slow');
            }
        }
	};
	
	imageList.popupSucces = function(){
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
	};
	
	imageList.popupError = function(){
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
	
	/* Save image */
 	imageList.save = function() {
 		if( $scope.image.id == null ){
			$("#imageForm").ajaxSubmit({
				url: "${cp}/admin/uploadImage", 
				type: 'post',
				success: function(data)
	           {
					if(data != null && data != ''){
						if($scope.image.id == null){
							$scope.image = data;
							//$scope.images.unshift(data);
							$("#file-group").hide();
						}/* else{
							for(i in $scope.images) {
						        if($scope.images[i].id == $scope.image.id) {
						          	$scope.images[i] = $scope.image;
						        }
						    }   
						} */
						imageList.popupSucces();
					}else{
						imageList.popupError();
					}
	           }
			});
		}else{
			$http.post('saveImage',$scope.image).success(function(data){
				 imageList.popupSucces();
	        });
		} 
	}; 
	
	/* Delete Image*/
	imageList.deleteImage = function(image) {
		
		BootstrapDialog.confirm({
            message: '<spring:message code="message.delete.content" />',
            type: BootstrapDialog.TYPE_WARNING,
            btnOKClass: 'btn-warning',
            callback: function(result) {
                if(result) {
                	$http.post('deleteImage', image).success(function(response){
                		// ERROR
                		if(response == ''){// In case return null object at server response
                			/* BootstrapDialog.show({
               		            message: '<spring:message code="image.can.not.delete" />',
               		            type: BootstrapDialog.TYPE_DANGER,
               		            buttons: [{
               		                label: '<spring:message code="message.button.cancel" />',
               		                action: function(dialogItself){
               		                    dialogItself.close();
               		                }
               		            }]
               	        	}); */
                			imageList.popupError();
                		}else{
                			// Remove on GUI
                			angular.forEach($scope.images,function(obj, index) {
    							if(obj.id == image.id){
    								$scope.images.splice(index, 1);
    							}
    	   	       		    });
                		}
   	       	        });
                }
            }
        });
	};
	
	imageList.disabledBtnSave = function(){
		 return $scope.image == null 
			|| $scope.image.url == null || $scope.image.url == ''
			|| $scope.image.name == null || $scope.image.name == '';
	};

}

</script>

