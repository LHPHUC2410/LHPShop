<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Giỏ hàng</title>
    <base href="${pageContext.servletContext.contextPath}/">
    <link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/d/d7/Logo_PTIT.jpg">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="/static/css/base.css">
    <link rel="stylesheet" href="/static/css/main.css">
    <link rel="stylesheet" href="/static/css/cart.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/static/fonts/fontawesome-free-6.6.0-web/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/layout/head.jsp"></jsp:include>
	<div class="body">
        <div class="cart">
            <div class="grid">
                <div class="cart-name">
                    <h3>GIỎ HÀNG</h3>
                </div>
                <div class="cart__body">
                    <div class="cart-list">
                        <ul>
                        	<c:forEach items="${list }" var="p">
                        		<li class="cart-item">
	                                <div class="cart-item-details">
	                                    <div class="cart-item-left">
	                                        <div class="cart-item-img">
	                                            <img src="${p.product.image}" alt="">
	                                        </div>
	                                        <div class="cart-item-desc">
	                                            <h5 class="cart-item-name">${p.product.name}</h5>
	                                            <h5 class="cart-item-description">Phân loại: 40A</h5>
	                                        </div>
	                                    </div>
	                                    
	                                    <div class="cart-item-delete">
	                                        <i class="cart-item-delete-icon fa-solid fa-xmark"></i>
	                                    </div>
	                                </div>
	                                <div class="cart-item-price">
	                                    <div class="cart-item-total">
	                                        <h3 class="cart-item-total-price">Giá: ${p.product.price}</h3>
	                                        <h3 class="cart-item-total-totalprice">Tạm tính: ${p.product.price * p.quantity}</h3>
	                                    </div>
	                                    <div class="cart-item-quantity">
	                                        <div class="quantity-selector">
	                                            <button onclick="decrease()" id="decreaseButton">−</button>
	                                            <input type="number" id="quantity" value="${p.quantity}" min="0" readonly>
	                                            <button onclick="increase()">+</button>
	                                        </div>
	                                        
	                                        <script>
	                                            function updateButtons() {
	                                                const quantityInput = document.getElementById('quantity');
	                                                const decreaseButton = document.getElementById('decreaseButton');
	                                                decreaseButton.disabled = quantityInput.value <= 0;
	                                            }
	                                        
	                                            function increase() {
	                                                let quantityInput = document.getElementById('quantity');
	                                                quantityInput.value = parseInt(quantityInput.value) + 1;
	                                                updateButtons();
	                                            }
	                                        
	                                            function decrease() {
	                                                let quantityInput = document.getElementById('quantity');
	                                                if (quantityInput.value > 0) {
	                                                    quantityInput.value = parseInt(quantityInput.value) - 1;
	                                                    updateButtons();
	                                                }
	                                            }
	                                        
	                                            // Initialize button state on page load
	                                            updateButtons();
	                                        </script>
	                                    </div>
	                                </div> 
	                            </li>
                        	</c:forEach>                                                
                        </ul>
                    </div>
                    <div class="cart-order">
                        <div class="cart-order-total">
                            <h6 style="font-weight: 600">Tổng tiền: ${sum }đ</h6>
                        </div>
                        <div class="cart-order-btn">
                            <button type="button" class="btn btn-danger">Đặt hàng</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>