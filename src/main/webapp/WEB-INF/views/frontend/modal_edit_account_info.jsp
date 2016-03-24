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

<div
   class="modal fade"
   id="user_account_info">
   <div class="modal-dialog modal-lg">
      <form:form
         action="${ cp }/updateAccountInfo"
         method="post"
         accept-charset="UTF-8">
         <div class="modal-content">
            <div
               class="modal-header"
               style="background: rgb(47, 96, 173); color: #fff">
               <button
                  type="button"
                  class="close"
                  data-dismiss="modal">
                  <span aria-hidden="true">×</span><span class="sr-only">Close</span>
               </button>
               <h4
                  class="modal-title text-white"
                  id="myModalLabel">Chỉnh sửa thông tin cá nhân</h4>
            </div>
            <div class="modal-body">
               <c:if test="${ error != null }">
                  <div style="color: red">
                     <label class="error-msg"><i class="fa fa-times-circle-o"></i> ${ error }</label>
                     <c:remove
                        var="error"
                        scope="session" />
                  </div>
               </c:if>
               <c:if test="${ success != null }">
                  <div style="color: green">
                     <label
                        class="control-label"
                        for="inputSuccess"><i class="fa fa-check"></i> ${ success }</label>
                     <c:remove
                        var="success"
                        scope="session" />
                  </div>
               </c:if>
               <div
                  style="width: 48%; float: left;"
                  class="">
                  <h5 class="text-primary small-title-left no-margin">1.Thông tin bắt buộc</h5>
                  <label class="text-primary">* Họ tên</label> <input
                     class="form-control margin-bottom-20"
                     type="text"
                     name="name"
                     maxlength="50"
                     value="${ loggedInCustomer.name }"> <label class="text-primary">* Email</label> <input
                     class="form-control margin-bottom-20"
                     type="text"
                     name="email"
                     maxlength="50"
                     value="${ loggedInCustomer.email }"
                     disabled="disabled"> <label class="text-primary">* Điện thoại</label><input
                     class="form-control margin-bottom-20"
                     type="text"
                     name="phone"
                     maxlength="50"
                     value="${ loggedInCustomer.phone }"> <label class="text-primary">* Địa chỉ</label><input
                     class="form-control margin-bottom-20"
                     type="text"
                     name="address"
                     maxlength="50"
                     value="${ loggedInCustomer.address }">
               </div>
               <div
                  style="width: 48%; float: right;"
                  class="">
                  <h5 class="text-primary small-title-left no-margin">2.Thông tin khác</h5>
                  <label class="text-primary">Giới tính</label>
                  <div class="input-group">
                     <div
                        id="radioBtn"
                        class="btn-group">
                        <a
                           class="btn btn-sm active"
                           data-toggle="gender"
                           data-title="Nam">Nam</a> <a
                           class="btn btn-sm notActive"
                           data-toggle="gender"
                           data-title="Nữ">Nữ</a>
                     </div>
                     <input
                        type="hidden"
                        name="gender"
                        id="happy">
                  </div>
                  <label
                     class="text-primary"
                     style="margin-top: 23px">Ngày sinh</label> <input
                     class="form-control margin-bottom-20"
                     id="departure"
                     type="text"
                     name="birthday"
                     maxlength="50">
               </div>
               <div class="clearfix"></div>
            </div>
            <div class="modal-footer">
               <button
                  class="btn btn-lg btn-primary-customer pull-right"
                  type="submit">
                  <i class="glyphicon glyphicon-floppy-save pull-left"></i><span>Lưu trữ<br>
                  <small>Click vào đây để hoàn thành lưu trữ</small></span>
               </button>
            </div>
         </div>
      </form:form>
   </div>
</div>