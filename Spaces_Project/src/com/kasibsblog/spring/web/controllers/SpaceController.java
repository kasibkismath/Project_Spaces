package com.kasibsblog.spring.web.controllers;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kasibsblog.spring.web.daos.Space;
import com.kasibsblog.spring.web.service.SpaceService;

@Controller
public class SpaceController {

	@Autowired
	private SpaceService spaceService;

	@RequestMapping(value = "/getSpaces", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public List<Space> getSpace(Principal principal) {

		String username = principal.getName();

		List<Space> space = new ArrayList<Space>();
		space = spaceService.getSpaces(username);

		return space;
	}

	// gets the space information for a particular space id
	@RequestMapping(value = "/getSpaceById", method = RequestMethod.GET, produces = "application/json")
	@ResponseBody
	public Space getSpaceById(@RequestParam(value = "id") int idFromAngular) {

		Space space = spaceService.getSpaceById(idFromAngular);

		return space;
	}

	// updates the space info
	@RequestMapping(value = "/updateSpace", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void updateSpace(@RequestBody Space space) {
		spaceService.updateSpace(space);
	}

	@RequestMapping("/spaces")
	public String showIndexPage(Model model) {

		List<Space> spaces = spaceService.getAllSpaces();
		model.addAttribute("spaces", spaces);

		return "spaces";
	}

	// add a space
	@RequestMapping(value = "/addSpace", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public void addSpace(@RequestBody Space space) {
		
		String name = space.getName();
		String street = space.getStreet();
		String city = space.getCity();
		String state = space.getState();
		String country = space.getCountry();
		String contact = space.getContact();
		String username = space.getUser().getUsername();
		
		System.out.println(name + " " + street + " " + city + " " + state + " " + country + " " + contact + " " + username);
		
		spaceService.addSpace(space);
	}
}
