package com.Estore.service;

import java.util.ArrayList;
import java.util.List;

import com.Estore.entity.Category;
import com.Estore.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Estore.dto.reponse.ProductResponse;
import com.Estore.dto.request.ProductRequest;
import com.Estore.entity.Product;
import com.Estore.mapper.ProductMapper;
import com.Estore.repository.ProductRepository;

@Service
public class ProductService {
	@Autowired
	ProductRepository productRepository;
	
	@Autowired
	ProductMapper productMapper;

	@Autowired
	CategoryRepository categoryRepository;
	
	public Product create(ProductRequest request)
	{
		Product product =  productMapper.toProduct(request);
		Category category = categoryRepository.findById(request.getCategory_id()).orElseThrow(() -> new RuntimeException("Category not found"));
		product.setCategory(category);
		return productRepository.save(product);
	}
	
	public List<ProductResponse> getAll() 
	{
		List<ProductResponse> list = new ArrayList<ProductResponse>();
		list = productRepository.findAll().stream().map(productMapper::toProductResponse).toList();
		return list;
	}
	
	public ProductResponse getProduct(String id)
	{
		Product product = productRepository.findById(id).orElseThrow(() -> new RuntimeException("Product not found"));		
		return productMapper.toProductResponse(product); 
	}
	
	public ProductResponse updateProduct(String id, ProductRequest request)
	{
		Product product = productRepository.findById(id).orElseThrow(() -> new RuntimeException("Product not found"));
		productMapper.updateProduct(product, request);
		Category category = categoryRepository.findById(request.getCategory_id()).orElseThrow(() -> new RuntimeException("Category not found"));
		product.setCategory(category);
		return productMapper.toProductResponse(productRepository.save(product)); 
	}
	
	public void delete(String id)
	{
		productRepository.deleteById(id);
	}
	
	public List<ProductResponse> listbyCategory(String cate_id) {
		Category category = categoryRepository.findById(cate_id).orElseThrow(() -> new RuntimeException("Category not found"));
		List<ProductResponse> result = new ArrayList<ProductResponse>();
		for (Product product : category.getProducts()) {
			result.add(productMapper.toProductResponse(product));
		}
		return result;
	}
	
	public List<ProductResponse> top4SpGanGia(String id) {
		List<ProductResponse> result = new ArrayList<ProductResponse>();
		for (Product product : productRepository.findTop4BySimilarPrice(id)) {
			result.add(productMapper.toProductResponse(product));
		}
		return result;
	}
	
	public List<ProductResponse> findbykw(String kw) 
	{
		List<ProductResponse> result = new ArrayList<ProductResponse>();
		for (Product product : productRepository.findbyKeyword(kw)) {
			result.add(productMapper.toProductResponse(product));
		}
		return result;
	}
}
