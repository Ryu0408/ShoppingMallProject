package com.rsh.smp.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rsh.smp.service.ProductService;
import com.rsh.smp.vo.ProductVO;

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
}
