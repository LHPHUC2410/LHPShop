<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LHPWEB - Change Password</title>
    <base href="${pageContext.servletContext.contextPath}/">
    <link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/d/d7/Logo_PTIT.jpg">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="/static/css/base.css">
    <link rel="stylesheet" href="/static/css/main.css">
    <link rel="stylesheet" href="/static/css/login.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/static/fonts/fontawesome-free-6.6.0-web/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<div class = "app">
		<jsp:include page="/WEB-INF/views/layout/head.jsp"></jsp:include>
        <!-- body -->	
        <div class="body">
            <div class="grid">
                <div class="login-center">
                    <div class="login">
                        <h3>Đổi mật khẩu</h3>
                        <div class="login-form">
                            <form action="/acc/changepass" method="post">
                                <div class="login-detail">
                                	<div class="login-error">
                                            ${message}
                                        </div>
                                    <div class="mb-3">
                                        <label for="formGroupExampleInput" class="form-label">Mật khẩu cũ</label>
                                        <div class="login-error">
                                            ${messageoldpw}
                                        </div>
                                        <input type="password" name="oldpw" class="form-control" id="formGroupExampleInput" placeholder="Old password">
                                      </div>
                                      <div class="mb-3">
                                        <label for="formGroupExampleInput2" class="form-label">Mật khẩu mới</label>
                                        <div class="login-error">
                                            ${messagenewpw}
                                        </div>
                                        <input type="password" name="newpw" class="form-control" id="formGroupExampleInput2" placeholder=" New Password">
                                      </div>
                                      <button type="submit" class="btn btn-danger" style=" width: 100%; margin-top: 5px;" data-bs-toggle="modal" data-bs-target="#exampleModal">Cập nhật</button>
                                      <c:if test="${update == true}">
									    <div class="modal" style="display:block; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.5);">
									        <div class="modal-dialog" style="width: 300px; margin: 10% auto;">
									            <div class="modal-content">
									                <div class="modal-header">
									                    <h5 class="modal-title">Thông báo</h5>
									                </div>
									                <div class="modal-body">
									                    Cập nhật thông tin thành công!
									                </div>
									                <div class="modal-footer">
									                    <a href="/test" class="btn btn-primary">Đóng</a>
									                </div>
									            </div>
									        </div>
									    </div>
									</c:if>
                                      <%-- <c:if test="${update == true}">
                                      	<jsp:include page="/WEB-INF/views/layout/modalsuccess.jsp"></jsp:include>
                                      </c:if> --%>
                                </div>
                            </form>                  
    
                        </div>
                    </div>
                </div>
            </div>
        </div>	
	</div>
</body>
</html>