package com.Estore.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Estore.dto.reponse.OrderDetailsResponse;
import com.Estore.dto.request.OrderDetailsRequest;
import com.Estore.entity.OrderDetails;
import com.Estore.mapper.OrderDetailsMapper;
import com.Estore.repository.OrderDetailsRepositiory;
import com.Estore.repository.OrderRepository;
import com.Estore.repository.ProductRepository;
import com.Estore.repository.UserRepository;

@Service
public class OrderDetailsService {
	@Autowired
	private OrderDetailsRepositiory orderDetailsRepositiory;
	
	@Autowired
	private OrderDetailsMapper orderDetailsMapper;
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private OrderRepository orderRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	public OrderDetailsResponse create(OrderDetailsRequest request) {
		var finddetails = orderDetailsRepositiory.findbyuser(request.getProduct_id(), request.getUser_id());
		if(finddetails != null) {
			if(finddetails.getQuantity() + request.getQuantity() >= finddetails.getProduct().getQuantity())
			{
				finddetails.setQuantity(finddetails.getProduct().getQuantity());
			} else {
				finddetails.setQuantity(finddetails.getQuantity() + request.getQuantity());
			}
			
			OrderDetailsResponse result = orderDetailsMapper.toOrderDetailsResponse(finddetails);
			result.setProduct_name(finddetails.getProduct().getName());
			result.setUsername(finddetails.getUser().getFullname());
			orderDetailsRepositiory.save(finddetails);
			return result;
		}
		
		var user = userRepository.findById(request.getUser_id()).orElseThrow(() -> new RuntimeException("User not found"));	
		var product = productRepository.findById(request.getProduct_id()).orElseThrow(() -> new RuntimeException("Product not found"));
		var oDetails = orderDetailsMapper.toOrderDetails(request);
		
		var orderDetailsResponse = orderDetailsMapper.toOrderDetailsResponse(oDetails);
		if(request.getQuantity() > product.getQuantity()) {
			oDetails.setQuantity(product.getQuantity());
			orderDetailsResponse.setQuantity(product.getQuantity());
			}
		
		oDetails.setUser(user);
		oDetails.setProduct(product);
		
		orderDetailsRepositiory.save(oDetails);
		
		orderDetailsResponse.setId(oDetails.getId());
		
		//orderDetailsResponse.setOrder_id(order.getId());

		orderDetailsResponse.setUsername(product.getName());
		orderDetailsResponse.setProduct_name(user.getFullname());
		
		return orderDetailsResponse;
	}

	public void delete(String id) {
		orderDetailsRepositiory.deleteById(id);
	}

	public OrderDetailsResponse update(String id, OrderDetailsRequest request) {
		OrderDetails details = orderDetailsRepositiory.findById(id).orElseThrow(() -> new RuntimeException("OrderDetails not found"));
		details.setQuantity(request.getQuantity());
		
		OrderDetailsResponse result = orderDetailsMapper.toOrderDetailsResponse(details);

		orderDetailsRepositiory.save(details);
		return result;
	}

}
