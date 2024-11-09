package com.Estore.MCVController;

import java.util.List;
import java.util.Set;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.Estore.dto.request.OrderDetailsRequest;
import com.Estore.entity.OrderDetails;
import com.Estore.entity.User;
import com.Estore.repository.UserRepository;
import com.Estore.service.OrderDetailsService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/cart")
public class MVCCartController {
	@Autowired
	SessionFactory factory;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	OrderDetailsService orderDetailsService;
	
	@Autowired
	UserRepository userRepository;
	
	@GetMapping()
	public String showCart(Model model) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "redirect:/acc/login";
		}
		Set<OrderDetails> list = user.getList_orderdetails();
		model.addAttribute("list", list);
		int sum = 0;
		for (OrderDetails orderDetails : list) {
			sum += orderDetails.getQuantity()* orderDetails.getProduct().getPrice();
		}
		model.addAttribute("sum", sum);
		return "cart/cart";
	}
	
	@PostMapping("/add/{id}")
	public String add(@PathVariable("id") String id, @RequestParam("quan") int quan)
	{
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "redirect:/acc/login";
		}
		OrderDetailsRequest orderDetailsRequest = new OrderDetailsRequest();
		orderDetailsRequest.setUser_id(user.getId());
		orderDetailsRequest.setProduct_id(id);
		
		orderDetailsRequest.setQuantity(quan);
		orderDetailsService.create(orderDetailsRequest);
		
		User user1 = userRepository.findById(user.getId()).orElse(null);
		session.setAttribute("user", user1);
		return "redirect:/test";
	}
}
