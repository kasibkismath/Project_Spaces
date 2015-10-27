package com.kasibsblog.spring.web.daos;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;

import com.kasibsblog.spring.web.validation.ValidEmail;

public class User {

	@ValidEmail
	private String email;

	@NotBlank(message = "Name cannot be blank")
	@Size(min = 3, max = 20, message = "Name must be between 3 and 20 characters")
	private String name;

	@Size(min = 8, max = 20, message = "Password must be between 8 and 20 characters")
	@Pattern(regexp = "^\\S+$", message = "Password cannot contain space(s)")
	private String password;

	private String authority;
	private boolean enabled = false;

	public User() {

	}

	public User(String name, String email, String password, String authority, boolean enabled) {
		this.name = name;
		this.email = email;
		this.password = password;
		this.authority = authority;
		this.enabled = enabled;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
