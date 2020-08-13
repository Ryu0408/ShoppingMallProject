package com.rsh.smp.controller;



import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
	
	@RequestMapping(value = "/productdetail/{productnumber}/", method = RequestMethod.GET)
	public String productDetail(@PathVariable("productnumber") String productnumber, Model model) {
		model.addAttribute("productVO", productService.selectProductVO("productnumber", productnumber));
		model.addAttribute("colorVO", productService.selectColorVO("productnumber", productnumber));
		model.addAttribute("sizesVO", productService.selectSizesVO("productnumber", productnumber));

		return "productDetail";  
	}
	
	@RequestMapping(value = "/productaddcart/",  produces="application/text;charset=utf8",
			method = RequestMethod.POST)
	@ResponseBody
	public String productAddCart(@RequestBody List<Map<String, Object>> productArray,
			HttpSession session, HttpServletResponse response, HttpServletRequest request)	{
		String sessionID = (String) session.getAttribute("sessionID");
		if(sessionID != null) {
			String usernumber = productService.selectUserNumber("usernumber","id", sessionID);
			for(int i=0;i<productArray.size();i++) {
				String productnumber = (String)productArray.get(i).get("productnumber");
				String[] colorAndSize = ((String) productArray.get(i).get("color")).split("\\(");
				String amount = (String)productArray.get(i).get("amount");
				String color = colorAndSize[0];
				String sizes = colorAndSize[1].replaceAll("\\)", "");
				productService.insertCart("usernumber", usernumber, productnumber, amount, color, sizes);
			}
		}else {
			boolean cookieCheck = false;
			Cookie[] cookies = request.getCookies();
			for (Cookie cookie : cookies) {
				String cookieValue = cookie.getValue();
				cookieCheck = productService.selectCookieCheck(cookieValue);
				if(cookieCheck == true) {
					for(int i=0;i<productArray.size();i++) {
						String productnumber = (String)productArray.get(i).get("productnumber");
						String[] colorAndSize = ((String) productArray.get(i).get("color")).split("\\(");
						String amount = (String)productArray.get(i).get("amount");
						String color = colorAndSize[0];
						String sizes = colorAndSize[1].replaceAll("\\)", "");
						productService.insertCart("cookienumber", cookieValue, productnumber, amount, color, sizes);
					}
					break;
				}
			}
			if(cookieCheck == false) {
				Random random = new Random();
				String cookieValue = random.nextInt() + "";
				Cookie c = new Cookie(cookieValue,cookieValue);
				c.setMaxAge(60 * 60 * 24 * 7);	// 초, 분, 시, 일 -> 일주일
				c.setPath("/");
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
		String jsonString = null;
		ObjectMapper jsonMapper = new ObjectMapper();
		try {
			jsonString = jsonMapper.writeValueAsString("장바구니에 담겼습니다^^");
		}catch(JsonProcessingException e) {
			System.out.println("JSON 파싱 에러!!");
		}
		return jsonString;
	}
}
