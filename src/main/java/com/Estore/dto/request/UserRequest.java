package com.Estore.dto.request;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UserRequest {
	@NotBlank(message = "Không để trống tên đăng nhập")
    private String username;
	
	@NotBlank(message = "Mật khẩu không để trống!")
	@Size(min = 6, message = "Mật khẩu có ít nhất 6 kí tự!")
    private String password;
	
	@NotBlank(message = "Họ tên không để trống!")
    private String fullname;
	
	@NotBlank(message = "Email không để trống!")
	@Email(message = "Email không đúng định dạng!")
    private String email;
	
    private String photo;
}
