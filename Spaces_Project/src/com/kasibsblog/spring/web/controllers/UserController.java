package com.kasibsblog.spring.web.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kasibsblog.spring.web.daos.Space;
import com.kasibsblog.spring.web.daos.User;
import com.kasibsblog.spring.web.service.SpaceService;
import com.kasibsblog.spring.web.service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userservice;

	@Autowired
	private SpaceService spaceService;

	// View Resolver controller for index page
	@RequestMapping("/login")
	public String showLogin(Model model) {

		model.addAttribute("user", new User());
		model.addAttribute("loginModal", "on");

		return "index";
	}

	@RequestMapping(value="/dashboard")
	public String showDashboard(Principal principal, Model model, Space space,
			@RequestParam(value = "deleteSpace", required = false) String id) {
		
		String username = principal.getName();
	
		List<Space> spaces = spaceService.getSpaces(username);
		model.addAttribute("spaces", spaces);
		
		System.out.println(space.getId());
		
		if (id != null) {
			spaceService.delete(space.getId());
			return "dashboard";
		}

		return "dashboard";
	}
	
	@RequestMapping(value="/getSpaces", method=RequestMethod.GET, produces="application/json")
	@ResponseBody
	public List<Space> getSpace(Principal principal){
		
		String username = principal.getName();
		
		System.out.println(username);
		
		List<Space> space = new ArrayList<Space>();
		space = spaceService.getSpaces(username);
		
		return space;
	}

	@RequestMapping("/loggedout")
	public String ShowLogout(Model model) {

		model.addAttribute("user", new User());

		return "index";
	}

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

			// username error alert
			if (result.getFieldErrorCount("username") == 0) {
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

		try {
			userservice.createUser(user);
		} catch (DuplicateKeyException e) {
			result.rejectValue("username", "DuplicateKey.user.username", "Username already exists");
			model.addAttribute("signupmodal", "on");
			model.addAttribute("duplicateUser", true);
			return "index";
		}

		return "usercreated";

	}
}