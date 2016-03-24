<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<div id="content">
	<div class="container background-white bottom-border">
            <div class="row no-margin">
               <div class="col-xs-12 margin-vert-10" style="background: rgb(221, 243, 254);padding: 10px 0px 1px 0px;">
                  <h2 class="text-center text-primary">${ pageDTO.name }</h2>
               </div>
            </div>
			<div class="row">
				<div class="col-md-12 " style="text-align: justify; ">
					${ pageDTO.content }
					<div style="clear: both;"></div> 
				</div>
			</div>
	</div>
</div>