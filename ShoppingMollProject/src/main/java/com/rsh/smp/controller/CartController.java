package com.rsh.smp.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rsh.smp.service.CartService;
import com.rsh.smp.service.ProductService;
import com.rsh.smp.vo.CartVO;

@Controller
public class CartController {
	
	@Autowired ProductService productService;
	
	@Autowired CartService cartService;
	
	@RequestMapping(value = "/cart/", method = RequestMethod.GET)
	public String cart(HttpSession session, Model model) {
		String usersSession = (String) session.getAttribute("sessionID");
		if(usersSession != null) {
			String userNumber = productService.selectUserNumber("usernumber","id", usersSession);
			List<CartVO> cartVO = cartService.selectCartVO("usernumber", userNumber);
			System.out.println(userNumber);
			System.out.println(cartVO.get(0).getAmount());
		}
		return "cart";
	}
}
