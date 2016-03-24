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
   id="modal_change_password">
   <div class="modal-dialog">
      <form:form action="${ cp }/changePassword" method="post">
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
                  id="myModalLabel">Thay đổi mật khẩu</h4>
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
                  <h5 class="text-primary small-title-left no-margin">1.Thông tin bắt buộc</h5>
                  <label class="text-primary">* Mật khẩu cũ</label> 
                     <input placeholder="Mật khẩu cũ" class="form-control" type="password" name="oldpassword" maxlength="50">
                   <label class="text-primary">* Mật khẩu mới</label> 
                   <input placeholder="Mật khẩu mới" class="form-control"
							type="password" name="newpassword" maxlength="50">
                   <label class="text-primary">* Lặp lại mật khẩu mới</label>
                   <input placeholder="Lặp lại mật khẩu mới" class="form-control"
                     type="password" name="confirmnewpassword" maxlength="50">
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