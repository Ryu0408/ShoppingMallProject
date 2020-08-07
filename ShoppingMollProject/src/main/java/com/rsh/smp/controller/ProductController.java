package com.rsh.smp.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rsh.smp.service.ProductService;

@Controller
public class ProductController {

	@Autowired ProductService productService;
	
	@RequestMapping(value = "/productpage/{product}/", method = RequestMethod.GET)
	public String product(@PathVariable String product, Model model) {
		model.addAttribute("product", product);
		model.addAttribute("listProductVO", productService.selectProduct(product));
		model.addAttribute("productSize", productService.selectProduct(product).size());
		return "product";
	}
	
	@RequestMapping(value = {"/productpage/{product}/{sort}"}, method = RequestMethod.GET)
	public String productSort(@PathVariable("product") String product, 
			@PathVariable("sort") String sort, Model model) {
		model.addAttribute("product", product);
		model.addAttribute("listProductVO", productService.selectProductSort(product, sort));
		model.addAttribute("productSize", productService.selectProduct(product).size());
		return "product";
	}
	
	
}
