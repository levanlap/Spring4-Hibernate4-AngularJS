<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
angular.module('app',['angularFileUpload'])
.controller( 'FileUploadController', FileUploadController )
.directive('compile', ['$compile', function ($compile) {
    return function(scope, element, attrs) {
      scope.$watch(
        function(scope) {
          return scope.$eval(attrs.compile);
        },
        function(value) {
          element.html(value);
          $compile(element.contents())(scope);
        }
    );
  };
}]);

function FileUploadController($scope, $http, $sce, FileUploader) {
	

	var todoList = this;
	$scope.folder={};
	$scope.folder.parentId = 0;
    /* call tooltip */
	todoList.tooltip = function() {
		$('[data-toggle="tooltip"]').tooltip();
	};
	
	$("#folderBodyDetail").show("slow");
	
	todoList.loadFolderTreeView = function() {
		$http.get('${cp}/admin/fileupload/getTreeFolders').success(function(rootFolder){
			
			$scope.rootFolder = rootFolder;
			todoList.buildFolderTreeView($scope.rootFolder);
			todoList.getChildrenByParentId($scope.rootFolder.id);
			
	    });
	};
	
	todoList.reloadFolderTreeView = function(id) {
		$http.get('${cp}/admin/fileupload/getTreeFolders').success(function(rootFolder){
			
			$scope.rootFolder = rootFolder;
			todoList.buildFolderTreeView($scope.rootFolder);
			if(id){
				todoList.getChildrenByParentId(id);
			}else{
				todoList.getChildrenByParentId($scope.selectedFolder.id);	
			}
			
	    });
	};
	
	todoList.getChildrenByParentId = function(id) {
		
		$http.get('${cp}/admin/fileupload/getChildrenByParentId/' + id).success(function(selectedFolder){
			
			$scope.selectedFolder = selectedFolder;
			$scope.detailFs = angular.copy($scope.selectedFolder);
			$scope.detailFs.children = null;
			$("#image-galary a.selected").removeClass('selected');
			$("#treeFolder a").removeClass('selected');
			$("#folder-" + id).addClass('selected');
			
	    });
	};
    
	todoList.createNewFolder = function() {
		
		$scope.detailFs = {
				name : "" , 
				folder : true,
				parent : $scope.selectedFolder,
				parentId : $scope.selectedFolder.id
		};
		
		$("#image-galary a.selected").removeClass('selected');
		thongBao.taoMoiThuMuc($scope.selectedFolder.name);
	};
	
	todoList.save = function(){
		//console.log("========================================save");
		$http.post('${cp}/admin/fileupload/createNewFolder', $scope.detailFs)
		.success(function(image){
			//console.log(image);
			if( image != 'undefined' && image != null && image != 'null' && image != '' ){
				$scope.detailFs = image;
				todoList.reloadFolderTreeView();				
			}else{
				BootstrapDialog.show({
		            message: 'Không thể lưu. Tên thư mục hoặc file đã tồn tại',
		            type: BootstrapDialog.TYPE_DANGER,
		            buttons: [{
		                label: 'Thoát',
		                action: function(dialogItself){
		                    dialogItself.close();
		                    todoList.reloadFolderTreeView();
		                }
		            }]
	        	});
			}
       });
	};
	
	todoList.deleteFileSystem = function(){
		BootstrapDialog.confirm({
            message: '<spring:message code="message.delete.content" />',
            type: BootstrapDialog.TYPE_WARNING,
            btnOKClass: 'btn-warning',
            callback: function(result) {
                if(result) {
                	$http.post('${cp}/admin/fileupload/deleteFileSystem', $scope.detailFs)
                	.success(function(image){
                		if( image != 'undefined' && image != null && image != 'null' && image != '' ){
                			todoList.reloadFolderTreeView(image.parentId);
                		}else{
                			BootstrapDialog.show({
            		            message: 'Không Thể Xóa',
            		            type: BootstrapDialog.TYPE_DANGER,
            		            buttons: [{
            		                label: 'Thoát',
            		                action: function(dialogItself){
            		                    dialogItself.close();
            		                    todoList.reloadFolderTreeView();
            		                }
            		            }]
            	        	});
                		}
                	})
                }
            }
        });
	};
	
	todoList.checkFsName = function(){
		
		if($scope.detailFs.name == ''){
			/* Undo the origin name if the name empty name */
			$scope.detailFs.name = $scope.detailFs.originName;
		}
	};
	
	todoList.selectFolder = function(val){
		
		if(typeof val === 'object'){
			if(val.folder){
				todoList.getChildrenByParentId(val.id);
			}
		}else{
			// val is an id
			todoList.getChildrenByParentId(val);
		}
		
	};
	
	todoList.clickFileSystem = function($event, fs){
		$scope.detailFs = fs;

		// Get current element selecting
		$("#image-galary a.selected").removeClass('selected');
		var el = $("#img-item-" + fs.id);
		
		// Check if the element has selected already
		if(el.hasClass('selected')){
			
			// Unmark select it
			el.removeClass('selected');
			
		}
		
		else{
			
			// Mark selecte it
			el.addClass('selected');
			
		}

		// Prevent don't allow outsite click event
		$event.stopPropagation();
		
	};
	
	todoList.buildFolderTreeView = function(rootFolder){
		$scope.treeViewFolders = "<a id='folder-" + rootFolder.id + "'  href='' ng-click='todoList.selectFolder(" + rootFolder.id +")'>";
		$scope.treeViewFolders += rootFolder.name;
		$scope.treeViewFolders += '</a>'
  		$scope.treeViewFolders += todoList.convertFolderJsonToHTML(rootFolder.children);
		$('#treeFolder').treed({openedClass : 'glyphicon-folder-open', closedClass : 'glyphicon-folder-close'});
	};
	
	todoList.convertFolderJsonToHTML = function(folders){
		
		if (folders == null || folders.length == 0) {
			return "";
		}
		var html = "<ul>";
		for (var inx in folders) {
			if(folders[inx].folder){
				html += "<li>";
				html += "<a id='folder-" + folders[inx].id + "' href='' ng-click='todoList.selectFolder("+ folders[inx].id + ")'>";
				html += folders[inx].name;
				html += todoList.convertFolderJsonToHTML(folders[inx].children);
				html += "</a>";
				html += "</li>";
			}
		}
		html += "</ul>";
		return html;
		
	};
	
	todoList.loadFolderTreeView();
	
	
	
	
	
	/* Upload File */
	var uploader = $scope.uploader = new FileUploader({
        url: '${cp}/admin/fileupload/uploadfiles',
        autoUpload: true
    });

    // FILTERS

    uploader.filters.push({
        name: 'customFilter',
        fn: function(item /*{File|FileLikeObject}*/, options) {
            return this.queue.length < 100;
        }
    });

    // CALLBACKS

    uploader.onWhenAddingFileFailed = function(item /*{File|FileLikeObject}*/, filter, options) {
        console.info('onWhenAddingFileFailed', item, filter, options);
    };
    uploader.onAfterAddingFile = function(fileItem) {
        console.info('onAfterAddingFile', fileItem);
    };
    uploader.onAfterAddingAll = function(addedFileItems) {
        console.info('onAfterAddingAll', addedFileItems);
    };
    uploader.onBeforeUploadItem = function(item) {
    	var formData = [{parentId : $scope.selectedFolder.id}];
        item.formData = formData;
        console.info('onBeforeUploadItem', item);
    };
    uploader.onProgressItem = function(fileItem, progress) {
        console.info('onProgressItem', fileItem, progress);
    };
    uploader.onProgressAll = function(progress) {
        console.info('onProgressAll', progress);
    };
    uploader.onSuccessItem = function(fileItem, fileSystem, status, headers) {
    	if(fileSystem != null){
    		fileItem.fs = fileSystem;
    	}
        console.info('onSuccessItem', fileItem, fileSystem, status, headers);
    };
    uploader.onErrorItem = function(fileItem, response, status, headers) {
        console.info('onErrorItem', fileItem, response, status, headers);
    };
    uploader.onCancelItem = function(fileItem, response, status, headers) {
        console.info('onCancelItem', fileItem, response, status, headers);
    };
    uploader.onCompleteItem = function(fileItem, response, status, headers) {
        console.info('onCompleteItem', fileItem, response, status, headers);
    };
    uploader.onCompleteAll = function() {
        console.info('onCompleteAll');
        $scope.uploader.queue = [];
        todoList.getChildrenByParentId($scope.selectedFolder.id);
    };

    console.info('uploader', uploader);
    
    
    
    
    /**/
    $(".box-body").on('show.bs.collapse', function(){
        $("#info-body-collapse-icon").attr('class', 'fa fa-chevron-up');
    });
    $(".box-body").on('hide.bs.collapse', function(){
    	$("#info-body-collapse-icon").attr('class', 'fa fa-chevron-down');
    });
}

</script>