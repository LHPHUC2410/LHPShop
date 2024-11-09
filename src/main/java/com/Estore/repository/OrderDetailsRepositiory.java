package com.Estore.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.Estore.entity.OrderDetails;
import com.Estore.entity.Product;

public interface OrderDetailsRepositiory extends JpaRepository<OrderDetails, String>{
	@Query(value = "select * from order_details where product_id = :pid  and user_id = :uid", 
			nativeQuery = true)
	OrderDetails findbyuser(@Param("pid") String pid, @Param("uid") String uid);
	/*
	 * @Query(value = "select * from product where product.name like %:kw%" ,
	 * nativeQuery = true) List<Product> findbyKeyword(@Param("kw") String kw);
	 */
}
