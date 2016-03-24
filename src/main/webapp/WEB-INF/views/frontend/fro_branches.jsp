<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="content">
	<div class="container background-white bottom-border border_left_10">
		
		<div class="row margin-vert-30">
		
			<h2 class="text-center text-primary">Địa Chỉ Cửa Hàng</h2>
			<hr>
			<div class="col-md-12" style="margin-bottom: 50px">

				<div class="col-md-6">
					<div id="map-wrap">
						<div id="map-canvas" style="height: 260px;"></div>
					</div>
				</div>

				<div class="col-md-6">
					<h2 class="text-primary" style="font-weight: normal;">Trụ Sở Chính</h2>
					<p>
                        <span class="fa-phone">Điện thoại: </span>${ company.phone }
                        <br>
                        <span class="fa-envelope">Email:  </span><a href="mailto:info@example.com">${ company.email }</a>
                       <br>
                        <span class="fa-link">Website: </span><a href="http://www.example.com">www.tuvanhoatuoi.com</a>
                    </p>
                    <p>${ company.address }</p>
				</div>

			</div>
		
			<c:if
				test="${ company != null && company.brands != null && company.brands.size() > 0 }">
				<c:forEach items="${ company.brands }" var="brand" varStatus="loop">
					<div class="col-md-12" style="margin-bottom: 50px">

						<div class="col-md-6">
							<div id="map-wrap-${ loop.index }">
								<div id="map-canvas-${ loop.index }" style="height: 260px;"></div>
							</div>
						</div>

						<div class="col-md-6">
							<h2 class="text-primary" style="font-weight: normal;">${ brand.name }</h2>
							<p>
                                <span class="fa-phone">Điện thoại: </span>${ brand.phone }
                                <br>
                                <span class="fa-envelope">Email:  </span><a href="mailto:info@example.com">${ company.email }</a>
                               <br>
                                <span class="fa-link">Website: </span><a href="http://www.example.com">www.tuvanhoatuoi.com</a>
                            </p>
                            <p>${ brand.address }</p>
						</div>

					</div>
				</c:forEach>
			</c:if>

		</div>
	</div>
</div>

<script src="http://maps.googleapis.com/maps/api/js"></script>
<script>

function initialize()
{
	initializeWithAddress('', '${company.latitude}', '${company.longitude}', '${company.address}');
	<c:forEach items="${ company.brands }" var="branch" varStatus="loop">
	initializeWithAddress('-'+${loop.index}, '${branch.latitude}', '${branch.longitude}', '${branch.address}');
	</c:forEach>
}

function initializeWithAddress(index, latitude, longitude, address){
	var myCenter = new google.maps.LatLng(latitude, longitude);
	
	var mapProp = {
	  center:myCenter,
	  zoom:14,
	  mapTypeId:google.maps.MapTypeId.ROADMAP
	  };
	$("#map-canvas" + index).css('width', ($("#map-wrap" + index).width - 10) + 'px');
	
	var map=new google.maps.Map(document.getElementById("map-canvas" + index),mapProp);
	
	var marker=new google.maps.Marker({
	  position:myCenter,
	  });
	
	marker.setMap(map);
	var content='<b>Shop Tư Vấn Hoa Tươi</b><div>'+ address +'</div>';
	var infowindow = new google.maps.InfoWindow({
	  content:content
	  });
	google.maps.event.addListener(marker, 'click', function() {
	  infowindow.open(map,marker);
	  });
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>


