<%@ page
   language="java"
   contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib
   uri="http://java.sun.com/jsp/jstl/core"
   prefix="c"%>
<%@ taglib
   prefix="fmt"
   uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib
   prefix="spring"
   uri="http://www.springframework.org/tags"%>
<%@ taglib
   uri="http://www.springframework.org/tags/form"
   prefix="form"%>
<style>
#dd_1 {
	z-index: 999999;
}
</style>
<div id="content">
   <div class="container background-white bottom-border">
      <div
         class="margin-vert-30"
         style="background: rgb(221, 243, 254); padding: 10px 0px 1px 0px">
         <h2 class="text-center text-primary">Thông tin cá nhân</h2>
      </div>
      <div class="row">
         <div class="col-xs-6">
            <div class="row">
               <div
                  class="col-xs-3"
                  align="center">
                   <img src="${ cp }/frontend/img/icon/Kid-icon.png" alt="info_account">
               </div>
               <div class=" col-xs-9">
                  <table class="table table-user-information">
                     <tbody>
                        <tr>
                           <td>Họ và tên</td>
                           <td>${ loggedInCustomer.name }</td>
                        </tr>
                        <tr>
                           <td>Ngày sinh</td>
                           <td>01/24/1988</td>
                        </tr>
                        <tr>
                        <tr>
                           <td>Giới tính</td>
                           <td>Male</td>
                        </tr>
                        <tr>
                           <td>Địa chỉ</td>
                           <td>Metro Manila,Philippines</td>
                        </tr>
                        <tr>
                           <td>Email</td>
                           <td><a href="mailto:${ loggedInCustomer.email }">${ loggedInCustomer.email }</a></td>
                        </tr>
                        <tr>
                           <td>Số điện thoại</td>
                           <td>${ loggedInCustomer.phone }</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
         <div class="col-xs-6">
            <a
               href="#"
               class="btn btn-primary"  data-toggle="modal"
               data-target="#modal_change_password">Thay đổi mật khẩu</a> <a
               href="#"
               class="btn btn-primary">Kiểm tra hóa đơn</a> <a
               href="#"
               class="btn btn-primary margin-vert-20"
               data-toggle="modal"
               data-target="#user_account_info">Chỉnh sửa thông tin cá nhân</a> <a
               href="#"
               class="btn btn-primary margin-vert-20">Chỉnh sửa thông tin đặt hàng</a>
         </div>
      </div>

   </div>
</div>
<jsp:include page="modal_edit_account_info.jsp"></jsp:include>
<jsp:include page="modal_change_password.jsp"></jsp:include>

<script>
   $('#radioBtn a').on('click', function(){
	    var sel = $(this).data('title');
	    var tog = $(this).data('toggle');
	    $('#'+tog).prop('value', sel);
	    
	    $('a[data-toggle="'+tog+'"]').not('[data-title="'+sel+'"]').removeClass('active').addClass('notActive');
	    $('a[data-toggle="'+tog+'"][data-title="'+sel+'"]').removeClass('notActive').addClass('active');
	})
  $( "#departure" ).dateDropper();
   </script>