<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- === BEGIN FOOTER === -->
<div id="footer" class="background-grey border_left_10 bottom-border">
   <div class="container">
      <div class="row margin-top-10">
       <div class="col-xs-8">
           <span style="margin-top:-10px;margin-left:0px;display: block">Hỗ trợ thanh toán :</span>
            <img src="${ cp }/frontend/img/pattern/paypal.png" width="38" alt="logo-tuvanhoatuoi">
            <img src="${ cp }/frontend/img/pattern/visa.png"  width="38" alt="logo-tuvanhoatuoi">
             <img src="${ cp }/frontend/img/pattern/mastercard.png"  width="38" alt="logo-tuvanhoatuoi">
              <img src="${ cp }/frontend/img/pattern/discover.png"  width="38" alt="logo-tuvanhoatuoi">
            <img src="${ cp }/frontend/img/pattern/americanexpress.png"  width="38" alt="logo-tuvanhoatuoi">
         
       </div>
       <div class="col-xs-4 text-right">
       <span style="margin-top:-10px;margin-right:81px;display: block">Liên kết :</span>
       <img src="${ cp }/frontend/img/pattern/facebook.png" width="32" alt="logo-tuvanhoatuoi">
        <img src="${ cp }/frontend/img/pattern/google+.png" width="32" alt="logo-tuvanhoatuoi">
         <img src="${ cp }/frontend/img/pattern/youtube.png" width="32" alt="logo-tuvanhoatuoi">
          <img src="${ cp }/frontend/img/pattern/twitter.png" width="32" alt="logo-tuvanhoatuoi">
       </div>
   </div>

</div>
</div>
<div id="base">
	<div class="container padding-vert-10 ">
	     <span class="logo-footer" style="float: left;display: block">
         <img src="${ cp }/frontend/img/rsz_tuvanhoatuoi_logo-141.jpg" alt="logo-tuvanhoatuoi">
       </span>
       <span style="float: left;display: block;width: 200px">
           <c:forEach items="${ menuFooterOne }" var="item">
               <a href="${ cp }/${item.link}" class="text-white">${item.name}</a>
           </c:forEach>
       </span>
       <span style="float: left;display: block;width: 200px">
           <c:forEach items="${ menuFooterTwo }" var="item">
               <a href="${ cp }/${item.link}" class="text-white">${item.name}</a>
           </c:forEach>
       </span>
       <span style="float: right;display: block;margin-left: 10px;">
           <span style="display: block;text-align: center;">
               <img src="${ cp }/frontend/img/zalo1.png" alt="logo-tuvanhoatuoi">
             <img src="${ cp }/frontend/img/viber.png" alt="logo-tuvanhoatuoi" style="margin-left: 20px">
          </span>
          <span style="display: block;">Hồ Chí Minh: 0945 826 633 - Hà Nội: 0978 704 521</span>
          <span style="display: block;margin-top: 20px" class="text-center">------------------------------Newsletter--------------------------</span>
          <span style="display: block;">
                       <input placeholder="Nhập email của bạn" style="background: #fff;width: 345px;border-radius:23px"/>
                       <button class="btn btn-default" type="submit" style="background: rgb(47, 96, 173);border-top-right-radius: 16px;border-bottom-right-radius: 15px;
       margin: -4px 0 0 -83px;
       height: 33px;">Đăng ký</button>
                   </span>
               </span>
        
	</div>
</div>


<div style="background: rgb(27, 59, 116);font-size: 13px;color: #fff">
   <div class="container">
   <div class="row margin-vert-10">
         <div id="footermenu" class="col-xs-12">
            <span class="flaticon-shop3 glyph-icon-20"></span> Địa chỉ:${ company.address }
            <span class="flaticon-auricular6 glyph-icon-20"> Điện thoại: ${ company.phone }</span>
            <span class="flaticon-email5 glyph-icon-20"> Email: <a
                  href="mailto:info@example.com"  style="display: inherit;color: #fff">${ company.email }</a></span>
            <span class="flaticon-web58 glyph-icon-20"> Website: <a href="http://tuvanhoatuoi.com" style="display: inherit;color: #fff">www.tuvanhoatuoi.com</a></span> 
         </div>
      </div>
   </div>
   <div class="visible-xs visible-sm hidden-md hidden-lg">
      <script type="text/javascript"
         src="http://arrow.scrolltotop.com/arrow79.js"></script>
   </div>
</div>