<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

	<div style="background: rgb(221, 243, 254);padding: 10px 0px 1px 0px;height: 45px">
			<span  id="prev_partaner" class="flaticon-rewind44" style="width: 10%;float: left;margin-left: 5px"></span> 
			<h2 class="text-center text-primary" style="width: 80%;float: left">Đối tác</h2>
			<span id="next_partaner" class="flaticon-fast44" style="float: right;margin-right: 5px"></span> 
</div>
	<div class="row" style="margin-right: -50px;margin-left: -30px">
		<div class="col-md-12 margin-vert-10">

			<div id="partaner" class="owl-carousel owl-theme padding-vert-20">
				<c:forEach items="${ partners }" var="partner">
					<div class="partner">
						<div class="item"><a href="${partner.link }" target="_blank">
							<img src="${dataDomain}${partner.imageLink.url}" alt="" /></a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>





<script type="text/javascript">
		$(document).ready(function() {
			var partaner = $("#partaner");
				partaner.owlCarousel({
				  pagination: false,
				  dots: false,
			      items : 6, //10 items above 1000px browser width
			      itemsDesktop : [1000,6], //5 items between 1000px and 901px
			      itemsDesktopSmall : [900,3], // betweem 900px and 601px
			      itemsTablet: [600,2], //2 items between 600 and 0
			      itemsMobile : false // itemsMobile disabled - inherit from itemsTablet option
			  });
			  // Custom Navigation Events
			  $("#next_partaner").click(function(){
				  partaner.trigger('owl.next');
			  })
			  $("#prev_partaner").click(function(){
				  partaner.trigger('owl.prev');
			  })
		});
	</script>