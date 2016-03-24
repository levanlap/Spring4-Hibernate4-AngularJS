<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="slideshow">
	<div class="container carousel-customer">
			<!-- Carousel Slideshow -->
			<div id="carousel-example" class="carousel slide"
				data-ride="carousel">
				<div class="box_skitter box_skitter_large">
					<ul>
						<c:forEach items="${ slideImages }" var="slideImage"
							varStatus="loop">
							<li><a href="${ slideImage.link }"><img 
									src="${dataDomain}${ slideImage.imageLink.url }" /></a></li>
						</c:forEach>

					</ul>
				</div>
			</div>
	</div>
</div>
