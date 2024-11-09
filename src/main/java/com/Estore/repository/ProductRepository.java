package com.Estore.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.Estore.entity.Product;

public interface ProductRepository extends JpaRepository<Product, String>{
	@Query(value = "SELECT * FROM product p " +
            "WHERE p.category_id = (SELECT p2.category_id FROM product p2 WHERE p2.id = :id) " +
            "AND p.id <> :id " +
            "ORDER BY ABS(p.price - (SELECT p3.price FROM product p3 WHERE p3.id = :id)) " +
            "LIMIT 4", 
    nativeQuery = true)
	List<Product> findTop4BySimilarPrice(@Param("id") String id);
	
	@Query(value = "select * from product where product.name like %:kw%"
			, nativeQuery = true)
	List<Product> findbyKeyword(@Param("kw") String kw);
}


