<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LHPWEB - Login</title>
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
                        <h3>ĐĂNG NHẬP</h3>
                        <div class="login-form">
                            <form action="/acc/login" method="post">
                                <div class="login-detail">
                                    <div class="mb-3">
                                        <label for="formGroupExampleInput" class="form-label">Tên đăng nhập</label>
                                        <div class="login-error">
                                            ${messageusername}
                                        </div>
                                        <input type="text" name="username" class="form-control" id="formGroupExampleInput" placeholder="Username">
                                      </div>
                                      <div class="mb-3">
                                        <label for="formGroupExampleInput2" class="form-label">Mật khẩu</label>
                                        <div class="login-error">
                                            ${messagepassword}
                                        </div>
                                        <input type="password" name="password" class="form-control" id="formGroupExampleInput2" placeholder="Password">
                                      </div>
                                      <button type="submit" class="btn btn-primary" style=" width: 100%; margin-top: 5px;">Đăng nhập</button>
                                </div>
                            </form>                  
                            <div class="login-regis">
                                <a  href="acc/register" type="button" class="btn btn-success">Tạo tài khoản mới</a>
                            </div>
    
                        </div>
                    </div>
                </div>
            </div>
        </div>	
	</div>
</body>
</html>