package com.kasibsblog.spring.web.daos;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

import com.kasibsblog.spring.web.validation.ValidEmail;

public class User {

	@ValidEmail
	private String email;

	@NotBlank(message = "Username cannot be blank")
	@Size(min = 5, max = 20, message = "Username must be between 5 and 15 characters")
	private String username;

	@Size(min = 8, max = 20, message = "Password must be between 8 and 20 characters")
	@Pattern(regexp = "^\\S+$", message = "Password cannot contain space(s)")
	private String password;

	private String authority;
	private boolean enabled = false;

	public User() {

	}

	public User(String username, String email, String password, String authority, boolean enabled) {
		this.username = username;
		this.email = email;
		this.password = password;
		this.authority = authority;
		this.enabled = enabled;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

}
