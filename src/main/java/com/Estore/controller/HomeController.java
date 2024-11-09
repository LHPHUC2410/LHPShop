package com.Estore.controller;

import org.springframework.ui.Model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Estore.dto.reponse.CategoryResponse;
import com.Estore.dto.reponse.ProductResponse;
import com.Estore.entity.Product;
import com.Estore.entity.User;
import com.Estore.repository.UserRepository;
import com.Estore.service.CategoryService;
import com.Estore.service.ProductService;

@Controller
public class HomeController {
	@Autowired
	private UserRepository userRepository;

	@Autowired
	private ProductService productService;
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/test")
	public String index(Model model) {
		List<ProductResponse> list = productService.getAll();
		model.addAttribute("list", list);
		
		List<CategoryResponse> list_category = categoryService.getAll();
		model.addAttribute("list_category", list_category);
		return "index";
	}
	
	@RequestMapping("/product/list_by_category/{id}") 
	public String listByCategory(@PathVariable String id, Model model) {

		List<ProductResponse> list = productService.listbyCategory(id);
		model.addAttribute("list", list);

		
		List<CategoryResponse> list_category = categoryService.getAll();
		model.addAttribute("list_category", list_category);
		return "product/list";
	}
	
	@GetMapping("/product/detail/{id}")
	public String detailProduct(Model model, @PathVariable String id)
	{
		List<CategoryResponse> list_category = categoryService.getAll();
		model.addAttribute("list_category", list_category);
		
		ProductResponse product = productService.getProduct(id);
		model.addAttribute("product", product);
		
		List<ProductResponse> top4SpGanGia = productService.top4SpGanGia(id);
		model.addAttribute("top4", top4SpGanGia);
		return "product/details";
	}
	
	@GetMapping("/product/listbykw") 
	public String listbykw(Model model, @RequestParam("kw") String kw) 
	{
		List<ProductResponse> list = productService.findbykw(kw);
		model.addAttribute("list", list);

		
		List<CategoryResponse> list_category = categoryService.getAll();
		model.addAttribute("list_category", list_category);
		return "product/list";
	}
}
