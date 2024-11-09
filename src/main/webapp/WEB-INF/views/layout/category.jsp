<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<div class="grid__column-2">
	<nav class="category">
		<h3 class="cateory__heading">
			<i class="cateory__heading-icon fa-solid fa-list"></i> Danh mục
		</h3>

		<ul class="category-list">
			<c:forEach var="cate" items="${list_category }">
				<li class="cateory-item"><a
					href="/product/list_by_category/${cate.id}"
					class="cateory-item__link">${cate.name}</a></li>
			</c:forEach>
		</ul>
	</nav>
</div>