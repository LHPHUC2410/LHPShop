 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>  

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LHPWEB - Product Detail</title>
    <base href="${pageContext.servletContext.contextPath}/">
    <link rel="icon" href="https://upload.wikimedia.org/wikipedia/commons/d/d7/Logo_PTIT.jpg">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="/static/css/base.css">
    <link rel="stylesheet" href="/static/css/main.css">
    <link rel="stylesheet" href="/static/css/product.css">
    <link rel="stylesheet" href="/static/css/cart.css">
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
                    <jsp:include page="/WEB-INF/views/layout/category.jsp"></jsp:include>
    
                    <div class="grid__column-10" style="background-color: white;">
                        <div class="product_details">
                            <div class="product-left">
                                <div class="product__img">
                                    <img src="${product.image }" alt="">
                                </div>
                            </div>
                            <div class="product__desc">
                                <ul class="product__desc-list">
                                    <li class="product__desc-item" style="font-size: 1.2rem;">${product.name } </li>
                                    <li class="product__desc-item product-price">${product.price } đ</li>
                                    <li class="product__desc-item">Loại sản phẩm: ${product.category_name } </li>
                                    <li class="product__desc-item">Kho: ${product.quantity } </li>
                                    <li class="product__desc-item">Mô tả: ${product.description }</li>
                                    <div class="product__btn-buy">
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" style="width: 130px; height: 40px;"> <i class="fa-solid fa-cart-shopping" style="margin-right: 5px;"></i> Chọn mua</button>
                                        <!-- Modal -->
                                        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered" >
                                            <div class="modal-content">
                                                
                                                <div class="modal-body">
                                                	<form action="/cart/add/${product.id}" method="POST">
                                                		<div class="product__category-item">
	                                                        <div class="product__category-item-img">
	                                                            <img src="${product.image }" alt="">
	                                                        </div>
	                                                        <div class="product__category-item-desc">
	                                                            <span class="product__category-item-name">${product.name }</span>
	                                                           
	                                                        </div>
	                                                    </div>
	                                                    <div class="cart-item-price">
	                                                        <div class="cart-item-total">
	                                                            <h3 class="cart-item-total-price">Giá: ${product.price }₫</h3>
	                                                            <h3 class="cart-item-total-totalprice">Tạm tính: <span id="subtotal">${product.price}</span>₫</h3>
	                                                        </div>
	                                                        <div class="cart-item-quantity">
	                                                            <div class="quantity-selector">
	                                                                <button onclick="decrease()" id="decreaseButton">−</button>
	                                                                <input name="quan" type="number" id="quantity" value="1" min="0" >
	                                                                <button onclick="increase()">+</button>
	                                                            </div>
	                                                            
	                                                            <script>
																    const price = ${product.price}; // Giá của sản phẩm, gán từ server-side
																
																    function updateButtons() {
																        const quantityInput = document.getElementById('quantity');
																        const decreaseButton = document.getElementById('decreaseButton');
																        decreaseButton.disabled = quantityInput.value <= 0;
																    }
																
																    function updateSubtotal() {
																        const quantity = parseInt(document.getElementById('quantity').value);
																        const subtotal = price * quantity;
																        document.getElementById('subtotal').innerText = subtotal;
																    }
																
																    function increase() {
																        let quantityInput = document.getElementById('quantity');
																        quantityInput.value = parseInt(quantityInput.value) + 1;
																        updateButtons();
																        updateSubtotal();
																    }
																
																    function decrease() {
																        let quantityInput = document.getElementById('quantity');
																        if (quantityInput.value > 0) {
																            quantityInput.value = parseInt(quantityInput.value) - 1;
																            updateButtons();
																            updateSubtotal();
																        }
																    }
																
																    // Initialize button state on page load
																    updateButtons();
																</script>
	                                                        </div>
	                                                    </div> 
	                                                    <div class="container" style="margin-top: 10px;">
	                                                        <div class="row">
	                                                            <div class="col d-flex justify-content-center">                                                                
																	   <button type="submit" class="btn btn-primary">Thêm vào giỏ hàng</button>
	                                                            </div>
	                                                        </div>
	                                                    </div>  
                                                	</form>                                                                                                     
                                                </div>
                                            </div>
                                            </div>
                                        </div>
                                    </div>
                                </ul>
                                <div class="product__category">
                                    <h5>SẢN PHẨM CÙNG LOẠI</h5>
                                    <div class="product__category-list">
                                    	<c:forEach var="t" items="${top4}">
											<a href="/product/detail/${t.id}" class="product__category-item">
	                                            <div class="product__category-item-img">
	                                                <img src="${t.image}" alt="">
	                                            </div>
	                                            <div class="product__category-item-desc">
	                                                <span class="product__category-item-name">${t.name}</span>
	                                                <span class="product__category-item-price ">${t.price}</span>
	                                            </div>
	                                        </a>				
										</c:forEach> 
                                    	                                       
                                    </div>
                                </div>
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