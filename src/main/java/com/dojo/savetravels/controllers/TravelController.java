package com.dojo.savetravels.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.dojo.savetravels.models.Travel;
import com.dojo.savetravels.services.TravelService;

import jakarta.validation.Valid;

@Controller
public class TravelController {
	
	@Autowired
	TravelService travelService;
	
//	---- SHOW ALL ----
	@GetMapping("/travels")
	public String allTravels(Model model) {
		model.addAttribute("allTravels", travelService.allTravels());
		model.addAttribute("travel", new Travel());
		return "index.jsp";
	}

//	---- CREATE ONE (form) ----
	@PostMapping("/travels/create")
//	**** @Valid @ModelAtrributes BindingResults - NEED TO BE STRINGED TOGETHER ****
	public String process(@Valid @ModelAttribute("travel")Travel travel, BindingResult bindingResult, Model model){
		if(bindingResult.hasErrors()) {
			model.addAttribute("allTravels", travelService.allTravels());
			return "index.jsp";
		} else {
		travelService.createTravel(travel);
		}
		return "redirect:/travels";
	}
	
//	---- EDIT ONE (route) ----
	@GetMapping("/travels/edit/{id}")
	public String editTravel(@PathVariable("id") Long id, Model model) {
		model.addAttribute("travel", travelService.findTravel(id));
		return "edit.jsp";
	}
	
//	---- EDIT ONE (form) ----
	@PutMapping("/travels/process/edit/{id}")
	public String processEdit(@Valid @ModelAttribute("travel")Travel travel, BindingResult result, @PathVariable("id")Long id) {
		if(result.hasErrors()) {
			return "edit.jsp";
		}
		travelService.updateTravel(travel);
		return "redirect:/travels";
	}
	
//	---- SHOW ONE ----
	@GetMapping("/travels/{id}")
	public String oneTravel(Model model, @PathVariable("id") Long id) {
		Travel travel = travelService.findTravel(id);
		model.addAttribute("travel", travel);
		
		return "show.jsp";
	}
	
//	---- DELETE ----
	@DeleteMapping("/travels/delete/{id}")
	public String deleteTravel(@PathVariable("id")Long id) {
		travelService.deleteTravel(id);
		return "redirect:/travels";
	}
}
