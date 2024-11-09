<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<header class="header">
	<!-- test -->
	<div class="header-top">
		<div class="grid">
			<div class="header-with-search">
				<div class="header__logo">
					<img
						src="https://upload.wikimedia.org/wikipedia/commons/d/d7/Logo_PTIT.jpg"
						alt="Logo_PTIT_University" class="header__logo-img">
				</div>

<!-- 				<div class="header__search">
					<input type="text" class="header__search-input"
						placeholder="Tìm kiếm">
					<button class="header__search-btn">
						<i class="header__search-btn-icon fa-solid fa-magnifying-glass"></i>
					</button>
				</div>  -->
				
					 <div class="header__search">
                        <form action="/product/listbykw" method="get" style="width: 100%;">
                            <div class="header__search" >
                                <input type="text" name="kw" class="header__search-input"
                                    placeholder="Tìm kiếm" value="${param.kw }">
                                <button class="header__search-btn">
                                    <i class="header__search-btn-icon fa-solid fa-magnifying-glass"></i>
                                </button>
                            </div>
                        </form>
                    </div>
				
				
				<a href="/cart" class="header__cart">
					<div class="header__cart-wrap">
						<i class="header__cart-icon fa-solid fa-cart-shopping"></i> <span
							class="header__cart-noti">3</span>
						<div class="header__cart-list ">
							<!-- Cart empty -> header__cart-list--empty -->
							<img
								src="https://cdn-icons-png.flaticon.com/512/11329/11329060.png"
								alt="" class="header__cart-list--empty-img"> <span
								class="header__cart-list--empty-message"> Chưa có sản
								phẩm </span>

							<h3 class="header__cart-header">Sản phẩm đã thêm</h3>
							<ul class="header__cart-items">
								<li class="header__cart-item"><img
									src="https://upload.wikimedia.org/wikipedia/commons/d/d7/Logo_PTIT.jpg"
									alt="" class="header__cart-item-img">
									<div class="header__cart-item-info">
										<div class="header__cart-item-head">
											<h5 class="header__cart-item-name">Sản phẩm 1</h5>
											<div class="header__cart-item-pricewrap">
												<span class="header__cart-item-price">2.000đ</span> <span
													class="header__cart-item-x">x</span> <span
													class="header__cart-item-quantity">2</span>
											</div>
										</div>
										<div class="header__cart-item-body">
											<h5 class="header__cart-item-description">Phân loại: ...</h5>
										</div>
									</div></li>
								<li class="header__cart-item"><img
									src="https://upload.wikimedia.org/wikipedia/commons/d/d7/Logo_PTIT.jpg"
									alt="" class="header__cart-item-img">
									<div class="header__cart-item-info">
										<div class="header__cart-item-head">
											<h5 class="header__cart-item-name">Sản phẩm 1</h5>
											<div class="header__cart-item-pricewrap">
												<span class="header__cart-item-price">2.000đ</span> <span
													class="header__cart-item-x">x</span> <span
													class="header__cart-item-quantity">2</span>
											</div>
										</div>
										<div class="header__cart-item-body">
											<h5 class="header__cart-item-description">Phân loại: ...</h5>
										</div>
									</div></li>
								<li class="header__cart-item"><img
									src="https://upload.wikimedia.org/wikipedia/commons/d/d7/Logo_PTIT.jpg"
									alt="" class="header__cart-item-img">
									<div class="header__cart-item-info">
										<div class="header__cart-item-head">
											<h5 class="header__cart-item-name">Sản phẩm 1</h5>
											<div class="header__cart-item-pricewrap">
												<span class="header__cart-item-price">2.000đ</span> <span
													class="header__cart-item-x">x</span> <span
													class="header__cart-item-quantity">2</span>
											</div>
										</div>
										<div class="header__cart-item-body">
											<h5 class="header__cart-item-description">Phân loại: ...</h5>
										</div>
									</div></li>
								<li class="header__cart-item"><img
									src="https://upload.wikimedia.org/wikipedia/commons/d/d7/Logo_PTIT.jpg"
									alt="" class="header__cart-item-img">
									<div class="header__cart-item-info">
										<div class="header__cart-item-head">
											<h5 class="header__cart-item-name">Sản phẩm 1</h5>
											<div class="header__cart-item-pricewrap">
												<span class="header__cart-item-price">2.000đ</span> <span
													class="header__cart-item-x">x</span> <span
													class="header__cart-item-quantity">2</span>
											</div>
										</div>
										<div class="header__cart-item-body">
											<h5 class="header__cart-item-description">Phân loại: ...</h5>
										</div>
									</div></li>
							</ul>
							<button class="header__cart-btn">
								<span class="header__cart-btn-body">Xem giỏ hàng</span>
							</button>
						</div>
					</div>
					<div class="header__cart-text">
						<h4>Giỏ hàng</h4>
					</div>
				</a>
				
				<c:choose>
					<c:when test="${sessionScope.user!=null}">
					<div class="userinfo">
                            <div class="user_img">
                                <img src="/static/photo/user/${sessionScope.user.photo}" alt="">
                            </div>
                            <div class="user-name">
                                <%-- <span>${sessionScope.user.fullname}</span> --%>
                                <div class="dropdown">
							        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: white; color: black; border: 0; font-size: 0.9rem">
							          ${sessionScope.user.fullname}
							        </button>
							        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							        	<li><a class="dropdown-item" href="#">Đơn mua</a></li>
							          	<li><a class="dropdown-item" href="/acc/edit">Tài khoản của tôi</a></li>
							          	<li><a class="dropdown-item" href="/acc/logout">Đăng xuất</a></li>
							        </ul>
							    </div>
                            </div>                          
	                    </div> 	          
					</c:when>
					<c:otherwise>
						<div class="account">
							<a href="acc/register"
								class="header__navbar-item header__navbar-item-strong header__navbar-item-gach"
								style="color: #3c3c3c;">Đăng ký</a>
								 <a href="acc/login"
								class="header__navbar-item header__navbar-item-strong"
								style="color: #3c3c3c;">Đăng nhập
							</a>
						</div>
					</c:otherwise>
				</c:choose>

				<!-- <div class="account">
					<a href="acc/register"
						class="header__navbar-item header__navbar-item-strong header__navbar-item-gach"
						style="color: #3c3c3c;">Đăng ký</a>
						 <a href="acc/login"
						class="header__navbar-item header__navbar-item-strong"
						style="color: #3c3c3c;">Đăng nhập
					</a>
				</div> -->
			</div>
		</div>
	</div>
	<div class="header-bottom">
		<div class="grid">
			<nav class="header__navbar">
				<ul class="header__navbar-list">
					<a href="/test">
						<li class="header__navbar-item header__navbar-item-gach">Trang
						chủ</li>
					</a>
					<li class="header__navbar-item header__navbar-item-gach">Thông
						tin</li>
					<li class="header__navbar-item" style="cursor: text; color: white;">
						Liên hệ <a href="https://www.facebook.com/lhphuc2410" target="_blank"> <i
							class="header__navbar-icon fa-brands fa-facebook"></i>
					</a>
					</li>
				</ul>

				<ul class="header__navbar-list">
					<li class="header__navbar-item header__navbar-item-gach"
						style="font-weight: 400;"><i class="fa-regular fa-envelope"></i>
						lhphuc.2410@gmail.com</li>
					<li class="header__navbar-item" style="font-weight: 400;"><i
						class="fa-solid fa-phone"></i> 0869738540</li>
				</ul>
			</nav>
		</div>
	</div>
</header>