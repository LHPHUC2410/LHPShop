<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LHPWEB - Register</title>
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
                        <h3>ĐĂNG KÝ</h3>
                        <div class="login-form">
                            <div class="login-detail">
                                <form:form action="/acc/register" modelAttribute="form" enctype="multipart/form-data">
                                	<div class="mb-3">
                                    <label for="formGroupExampleInput" class="form-label">Tên đăng nhập</label>
                                    <form:errors path="username" cssClass="error_message" ></form:errors>
                                    <span class="error_message">${user_mess}</span>
                                    <form:input path="username" type="text" class="form-control" id="formGroupExampleInput" placeholder="Username" />
                                  </div>
                                  <div class="mb-3">
                                    <label for="formGroupExampleInput2" class="form-label">Mật khẩu</label>
                                    
                                    <form:errors path="password" cssClass="error_message" ></form:errors>
                                    <form:input path="password" type="password" class="form-control" id="formGroupExampleInput2" placeholder="Password" />
                                  </div>
                                  <div class="mb-3">
                                    <label for="formGroupExampleInput2" class="form-label">Họ và tên</label>
                                    <form:errors path="fullname" cssClass="error_message" ></form:errors>
                                    <form:input path="fullname" type="text" class="form-control" id="formGroupExampleInput2" placeholder="Fullname" />
                                  </div>
                                  <div class="mb-3">
                                  	
                                    <label for="formGroupExampleInput2" class="form-label">Email</label>
                                    <form:errors path="email" cssClass="error_message" ></form:errors>
                                    <form:input path="email" type="email" class="form-control" id="formGroupExampleInput2" placeholder="Email" />
                                  </div>
                                  <div class="mb-3">
                                    <label for="formGroupExampleInput2" class="form-label">Ảnh đại diện</label>
                                    <input type="file" name="photo_file" class="form-control" id="formGroupExampleInput2" placeholder="Photo" />
                                    <form:hidden path="photo"/>
                                  </div> 
                                  <button type="submit" class="btn btn-success" style="width: 100%; margin-top: 5px;">Đăng ký</button>
                                </form:form>
                            </div>
                            
                            <div class="login-regis">
                                <a href="/acc/login" type="button" class="btn btn-primary">Đăng nhập</a>
                            </div>
    
                        </div>
                    </div>
                </div>
            </div>
        </div>	
	</div>
</body>
</html>