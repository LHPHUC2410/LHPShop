package com.Estore.MCVController;

import java.io.File;
import java.io.IOException;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.Estore.dto.request.UserRequest;
import com.Estore.entity.User;
import com.Estore.repository.UserRepository;
import com.Estore.service.UserService;

import jakarta.annotation.security.PermitAll;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/acc")
public class MVCAccountController {
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	UserService userService;
	
	@Autowired
	SessionFactory factory;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	ServletContext app;
	
	@GetMapping("/login")
	public String showFormlogin() {
		return "account/login";
	}
	
	@PostMapping("/login")
	public String login(Model model, @RequestParam("username") String username, @RequestParam("password") String password) {
		User user = userRepository.findByUsername(username).orElse(null);
		if(user == null) {
			model.addAttribute("messageusername", "Tên đăng nhập không tồn tại");
			return "account/login";
		}
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(10);
		boolean result = passwordEncoder.matches(password, user.getPassword());
		if(result) {
			session.setAttribute("user", user);
			return "redirect:/test";
		} else 
		{
			model.addAttribute("messagepassword", "Sai mật khẩu! Hãy thử lại!");
			return "account/login";
		}
	}
	
	@GetMapping("/register") 
	public String showFormRegister(Model model) {
		UserRequest userRequest = new UserRequest();
		model.addAttribute("form", userRequest);
		return "account/register";
	}
	
	@PostMapping("/register") 
	public String register(@Validated @ModelAttribute("form") UserRequest request,  BindingResult errors,
			@RequestParam("photo_file") MultipartFile file, Model model)
			throws IllegalStateException, IOException {
		if (errors.hasErrors()) {
		    return "account/register"; // Trả về trang đăng ký để hiển thị lỗi
		}
		
		if(!userRepository.findByUsername(request.getUsername()).isEmpty()) {
			model.addAttribute("user_mess", "Tên đăng nhập đã tồn tại!");
			return "account/register";
		}
		

		if (file.isEmpty()) {
			request.setPhoto("user.png");
		} else {
			String dir = app.getRealPath("/static/photo/user/");
			File f = new File(dir, file.getOriginalFilename());
			System.out.println(f.getName());
			file.transferTo(f);
			System.out.println(f.getName());
			request.setPhoto(f.getName());
		}
		userService.create(request);
		return "redirect:/acc/login";
	}
	
	@RequestMapping("/logout")
	public String logout() {
		session.removeAttribute("user");
		return "redirect:/test";
	}
	
	@GetMapping("/edit")
	public String showFormEdit(Model model) 
	{
		model.addAttribute("form", session.getAttribute("user"));
		return "account/edit";
	}
	
	@PostMapping("/edit")
	public String edit(@Validated @ModelAttribute("form") UserRequest request, BindingResult errors,
			@RequestParam("photo_file") MultipartFile file, Model model) throws IllegalStateException, IOException 
	{
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "redirect:/acc/login";
		}
		if (file.isEmpty()) {
			request.setPhoto(user.getPhoto());
		} else {
			String dir = app.getRealPath("/static/photo/user/");
			File f = new File(dir, file.getOriginalFilename());
			file.transferTo(f);
			request.setPhoto(f.getName());
		}
		request.setPassword(user.getPassword());
		userService.update(user.getId(), request);
		User user1 = userRepository.findById(user.getId()).orElse(null);
		session.setAttribute("user", user1);
		return "account/edit";
	}
	
	@GetMapping("/changepass")
	public String showFormChange() 
	{
		
		return "account/changepass";
	}
	
	@PostMapping("/changepass") 
	public String changePassword(Model model, @RequestParam("oldpw") String oldpw, @RequestParam("newpw") String newpw)
	{
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "redirect:/acc/login";
		}
		PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(10);
		boolean result = passwordEncoder.matches(oldpw, user.getPassword());
		if(!result) {
			model.addAttribute("messageoldpw", "Mật khẩu cũ không đúng! Mời nhập lại!");
		} else {
			User user1 = userRepository.findById(user.getId()).orElse(null);
			user1.setPassword(passwordEncoder.encode(newpw));
			userRepository.save(user1);
			model.addAttribute("message", "Thành công!");
			session.setAttribute("user", user1);
			model.addAttribute("update", true);
		}
		return "account/changepass";
	}
}
