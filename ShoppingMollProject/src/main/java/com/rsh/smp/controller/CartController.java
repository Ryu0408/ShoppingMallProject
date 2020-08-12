package com.rsh.smp.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

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
			model.addAttribute("listCartVO",listCartVO);
			model.addAttribute("listProductVO",listProductVO);
		}else {
			boolean cookieCheck = false;
			Cookie[] cookies = request.getCookies();
			for (Cookie cookie : cookies) {
				String cookieValue = cookie.getValue();
				cookieCheck = productService.selectCookieCheck(cookieValue);
				if(cookieCheck == true) {
					List<CartVO> listCartVO = cartService.selectCartVO("usernumber", userNumber);
					List<ProductVO> listProductVO = new ArrayList<ProductVO>();
					for(CartVO cartVO:listCartVO) {
						 listProductVO.add(productService.selectProductVO("productnumber", (cartVO.getProductNumber()+"")));
					}
					model.addAttribute("listCartVO",listCartVO);
					model.addAttribute("listProductVO",listProductVO);
				}
			}
			if(cookieCheck == false) {
				System.out.println("쿠키가 없다.");
				Random random = new Random();
				String cookieValue = random.nextInt() + "";
				Cookie c = new Cookie("cookieValue",cookieValue);
				c.setMaxAge(60 * 60 * 24 * 7);	// 초, 분, 시, 일 -> 일주일
				response.addCookie(c);
				for(int i=0;i<productArray.size();i++) {
					String productnumber = (String)productArray.get(i).get("productnumber");
					String[] colorAndSize = ((String) productArray.get(i).get("color")).split("\\(");
					String amount = (String)productArray.get(i).get("amount");
					String color = colorAndSize[0];
					String sizes = colorAndSize[1].replaceAll("\\)", "");
					productService.insertCart("cookienumber", cookieValue, productnumber, amount, color, sizes);
				}
			}
		}
		}
		return "cart";
	}
}
