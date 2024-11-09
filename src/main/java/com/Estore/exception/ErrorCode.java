package com.Estore.exception;

import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;

@Getter
@NoArgsConstructor
public enum ErrorCode {
	USER_EXISTED(1002,"User existed", HttpStatus.BAD_REQUEST),
	INVALID_KEY(1001,"UNCATEGORIZED_MESSAGE",HttpStatus.BAD_REQUEST),
	UNCATEGORIZED_EXCEPTION(9999,"UNCATEGORIZED_ERROR", HttpStatus.INTERNAL_SERVER_ERROR),
	PASSWORD_INVALID(1003,"Password must be at least 8 characters", HttpStatus.BAD_REQUEST),
	USER_NOT_EXISTED(1005,"User not existed", HttpStatus.NOT_FOUND),
	UNAUTHENTICATED(1006,"UNAUTHENTICATED", HttpStatus.UNAUTHORIZED),
	UNAUTHORIZED(1007, "You do not have permission", HttpStatus.FORBIDDEN),
	;
	
	
	
	ErrorCode(int code, String message, HttpStatusCode statusCode) {
		this.code = code;
		this.message = message;
		this.statusCode = statusCode;
	}
	private int code;
	private String message;
	private HttpStatusCode statusCode;
}
