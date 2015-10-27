package com.kasibsblog.spring.web.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kasibsblog.spring.web.daos.User;
import com.kasibsblog.spring.web.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userservice;

	@RequestMapping("/")
	public String showIndex(Model model) {
		model.addAttribute("user", new User());
		return "index";
	}

	@RequestMapping(value = "/createUser", method = RequestMethod.POST)
	public String createUser(Model model, @Valid User user, BindingResult result) {

		if (result.hasErrors()) {

			// Email error alert
			if (result.getFieldErrorCount("email") == 0) {
				model.addAttribute("noEmailError", true);
			} else {
				model.addAttribute("noEmailError", false);
			}

			// Name error alert
			if (result.getFieldErrorCount("name") == 0) {
				model.addAttribute("noNameError", true);
			} else {
				model.addAttribute("noNameError", false);
			}

			// Password error alert
			if (result.getFieldErrorCount("password") == 0) {
				model.addAttribute("noPasswordError", true);
			} else {
				model.addAttribute("noPasswordError", false);
			}

			model.addAttribute("signupmodal", "on");
			return "index";
		}

		user.setAuthority("ROLE_USER");
		user.setEnabled(true);
		
		try{
			userservice.createUser(user);
		}catch(DuplicateKeyException e){
			result.rejectValue("email", "DuplicateKey.user.email", "User with this email already exists");
			model.addAttribute("signupmodal", "on");
			model.addAttribute("duplicateUser", true);
			return "index";
		}

		
		return "usercreated";

	}
}