package com.rsh.smp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rsh.smp.service.MainService;
import com.rsh.smp.service.ProductService;

@Controller
public class MainController {

	@Autowired MainService mainservice;
	
	@Autowired ProductService productService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model) {
		model.addAttribute("listProductVO", productService.selectProductPage("new", "newSort", "1"));
		return "main";
	}
	
	@RequestMapping(value = "/review/", method = RequestMethod.GET)
	public String review() {
		return "review";
	}

}
