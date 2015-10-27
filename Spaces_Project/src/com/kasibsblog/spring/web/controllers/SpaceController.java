package com.kasibsblog.spring.web.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kasibsblog.spring.web.daos.Space;
import com.kasibsblog.spring.web.service.SpaceService;

@Controller
public class SpaceController {
	
	//This is a comment

	@Autowired
	private SpaceService spaceService;

	@RequestMapping("/spaces")
	public String showIndexPage(Model model) {

		List<Space> spaces = spaceService.getAllSpaces();
		model.addAttribute("spaces", spaces);

		return "spaces";
	}

	@RequestMapping("/addSpace")
	public String addSpace(Model model) {
		model.addAttribute("space", new Space());
		return "addSpace";
	}

	@RequestMapping(value = "/createdSpace", method = RequestMethod.POST)
	public String createdSpace(Model model, @Valid Space space, BindingResult result) {

		if (result.hasErrors()) {
			System.out.println("Form validation is unsuccessful!");

			List<ObjectError> errors = result.getAllErrors();

			for (ObjectError error : errors) {
				System.out.println(error.getDefaultMessage());
			}
			
			model.addAttribute("status", "no");
			return "addSpace";
			
		}
		
		System.out.println("Form validated");
		model.addAttribute("status", "yes");
		return "addSpace";
		

	}

}
