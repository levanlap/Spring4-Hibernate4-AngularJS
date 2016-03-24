<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
app.controller( 'FolderListController', FolderListController )
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

function FolderListController($rootScope, $scope, $http, $sce) {
	
 	BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_DEFAULT] = '<spring:message code="message.title.information" />';
    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_INFO] = '<spring:message code="message.title.information" />';
    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_PRIMARY] = '<spring:message code="message.title.information" />';
    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_SUCCESS] = '<spring:message code="message.title.success" />';
    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_WARNING] = '<spring:message code="message.title.warning" />';
    BootstrapDialog.DEFAULT_TEXTS[BootstrapDialog.TYPE_DANGER] = '<spring:message code="message.title.danger" />';
    BootstrapDialog.DEFAULT_TEXTS['OK'] = '<spring:message code="message.button.yes" />';
    BootstrapDialog.DEFAULT_TEXTS['CANCEL'] = '<spring:message code="message.button.cancel" />';
    
	var todoList = this;
	$scope.folder={};
	$scope.folder.parentId = 0;
	
	$("#folderBodyDetail").show("slow");
	
	$scope.$on('showFileUpload', function(event, targetResponse) {
		console.log("=======================================showFileUpload");
		$scope.targetResponse = targetResponse;
		console.log($scope.targetResponse);
		$("#" + $scope.targetResponse.boxId).hide('slow');
		$("#file-upload-container").show('slow');
	}); 
	
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
	
	todoList.selectFile = function(){
		$rootScope.$broadcast('selectFile', {data : angular.copy($scope.detailFs)});
		todoList.cancelSelectFile();
	};
	
	todoList.cancelSelectFile = function(){
		$("#" + $scope.targetResponse.boxId).show('slow');
		$("#file-upload-container").hide('slow');
	};
    
    $(".box-body").on('show.bs.collapse', function(){
        $("#info-body-collapse-icon").attr('class', 'fa fa-chevron-up');
    });
    $(".box-body").on('hide.bs.collapse', function(){
    	$("#info-body-collapse-icon").attr('class', 'fa fa-chevron-down');
    });
    
    todoList.loadFolderTreeView();
}

</script>