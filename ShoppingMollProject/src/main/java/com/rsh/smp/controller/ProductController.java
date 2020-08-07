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
	
	private final double perPage = 16;

	@RequestMapping(value = "/productpage/{product}/{sort}/{page}/", method = RequestMethod.GET)
	public String product(@PathVariable("product") String product, 	@PathVariable("sort") String sort,
			@PathVariable("page") String page, Model model) {
		model.addAttribute("productSize", productService.selectProductSize(product));
		model.addAttribute("pageSize", Math.ceil(productService.selectProductSize(product)/perPage));
		model.addAttribute("product", product);
		model.addAttribute("sort", sort);
		model.addAttribute("page", page);
		model.addAttribute("listProductVO", productService.selectProductPage(product, sort, page));
		return "product";  
	}

}
