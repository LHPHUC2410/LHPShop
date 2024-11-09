<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>  

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LHPWEB - Home Page</title>
    <base href="${pageContext.servletContext.contextPath}/">
    <link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/d/d7/Logo_PTIT.jpg">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="/static/css/base.css">
    <link rel="stylesheet" href="/static/css/main.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/static/fonts/fontawesome-free-6.6.0-web/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
    <div class="app">
        <jsp:include page="/WEB-INF/views/layout/head.jsp"></jsp:include>
        <div class="body">
            <div class="grid">
                <div class="grid__row app__content" >
                    <div class="grid__column-2">
                        <nav class="category">
                            <h3 class="cateory__heading"> 
                                <i class="cateory__heading-icon fa-solid fa-list"></i>
                                Danh mục
                            </h3>
            
                            <ul class="category-list">
								<c:forEach var="cate" items="${list_category }">
									<li class="cateory-item">
	                                    <a href="/product/list_by_category/${cate.id}" class="cateory-item__link">${cate.name}</a>
	                                </li>					
								</c:forEach>                         
                            </ul>
                        </nav>
                    </div>
    
                    <div class="grid__column-10">
                        <div class="home-filter">
                            <span class="home-filter__label">Sắp xếp theo</span>
                            <button class="btn home-filter__btn ">Phổ biến</button>
                            <button class="btn home-filter__btn btn_selected">Mới nhất</button>
                            <button class="btn home-filter__btn">Bán chạy</button>

                            <div class="select-input">
                                <span class="select-input__label">Giá</span>
                                <i class="select-input__icon fa-solid fa-chevron-down"></i>

                                <ul class="select-input__list">
                                    <li class="select-input__item">
                                        <a href="#" class="select-input__link">Giá: Thấp đến cao</a>
                                    </li>
                                    <li class="select-input__item">
                                        <a href="#" class="select-input__link">Giá: Cao đến thấp</a>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="home-product">
                            <div class="grid__row">
                                <!-- test -->
                                <c:forEach items="${list}" var="p">
                                	<div class="grid__column-2-4">
	                                    <a class="home-product-item" href="/product/detail/${p.id }">
	                                        <div class="home-product-item__img" style="background-image: url(${p.image});"></div>
	                                        <h4 class="home-product-item__name">${p.name} </h4>
	                                        <div class="home-product-item__price">
	                                            <span class="home-product-item__price-old">200.000đ</span>
	                                            <span class="home-product-item__price-new">${p.price}đ</span>
	                                        </div>
	                                        <div class="home-product-item__action">
	                                            <span class="home-product-item__action-like home-product-item__action-like--liked">
	                                                <i class="home-product-item__like-icon-empty fa-regular fa-heart"></i>
	                                                <i class="home-product-item__like-icon-fill fa-solid fa-heart"></i>
	                                            </span>
	                                            <div class="home-product-item__rating">
	                                                <i class="home-product-item__rating-star--gold fa-solid fa-star"></i>
	                                                <i class="home-product-item__rating-star--gold fa-solid fa-star"></i>
	                                                <i class="home-product-item__rating-star--gold fa-solid fa-star"></i>
	                                                <i class="home-product-item__rating-star--gold fa-solid fa-star"></i>
	                                                <i class="fa-solid fa-star"></i>
	                                            </div>
	                                        </div>
	                                        <div class="home-product-item__favo">
	                                            <i class="fa-solid fa-check"></i>
	                                            Yêu thích
	                                        </div>
	                                        <div class="home-product-item__sale">
	                                            <span class="home-product-item__sale-percent">
	                                                10%
	                                            </span>
	                                            <span class="home-product-item__sale-label">GIẢM</span>
	                                        </div>
	                                    </a>
	                                </div>
                                </c:forEach>



                                                                                       
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer">

        </footer>
    </div>
</body>
</html>