package com.rsh.smp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rsh.smp.service.CartService;
import com.rsh.smp.service.ProductService;
import com.rsh.smp.vo.CartVO;
import com.rsh.smp.vo.ProductVO;

@Controller
public class CartController {
	
	@Autowired ProductService productService;
	
	@Autowired CartService cartService;
	
	@RequestMapping(value = "/cart/", method = RequestMethod.GET)
	public String cart(HttpSession session, Model model, HttpServletRequest request ) {
		String usersSession = (String) session.getAttribute("sessionID");
		if(usersSession != null) {
			String userNumber = productService.selectUserNumber("usernumber","id", usersSession);
			List<CartVO> listCartVO = cartService.selectCartVO("usernumber", userNumber);
			List<ProductVO> listProductVO = new ArrayList<ProductVO>();
			for(CartVO cartVO:listCartVO) {
				 listProductVO.add(productService.selectProductVO("productnumber", (cartVO.getProductNumber()+"")));
			}
			model.addAttribute("colums","userNumber");
			model.addAttribute("number",userNumber);
			model.addAttribute("listCartVO",listCartVO);
			model.addAttribute("listProductVO",listProductVO);
		}else {
			boolean cookieCheck = false;
			Cookie[] cookies = request.getCookies();
			for (Cookie cookie : cookies) {
				String cookieValue = cookie.getName();
				cookieCheck = productService.selectCookieCheck(cookieValue);
				if(cookieCheck == true) {
					List<CartVO> listCartVO = cartService.selectCartVO("cookienumber", cookieValue);
					List<ProductVO> listProductVO = new ArrayList<ProductVO>();
					for(CartVO cartVO:listCartVO) {
						 listProductVO.add(productService.selectProductVO("productnumber", (cartVO.getProductNumber()+"")));
					}
					model.addAttribute("colums","cookienumber");
					model.addAttribute("number", cookieValue);
					model.addAttribute("listCartVO",listCartVO);
					model.addAttribute("listProductVO",listProductVO);
				}
			}
		}
		return "cart";
	}
}
