package com.rsh.smp.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rsh.smp.service.LoginService;
import com.rsh.smp.service.OrderService;
import com.rsh.smp.service.ProductService;
import com.rsh.smp.vo.CartVO;
import com.rsh.smp.vo.CouponVO;
import com.rsh.smp.vo.OrdersVO;
import com.rsh.smp.vo.ProductVO;
import com.rsh.smp.vo.UsersVO;

@Controller
public class MyPageController {
	
	@Autowired LoginService loginService;
	
	@Autowired OrderService orderService;
	
	@Autowired ProductService productService;
	
	@RequestMapping(value = "/mypage/", method = RequestMethod.GET)
	public String mypage(Model model, HttpSession session) {
		String usersSession = (String) session.getAttribute("sessionID");
		if(usersSession != null) {
			UsersVO usersVO = loginService.selectGetUsers("id",usersSession);
			List<OrdersVO> listOrdersVO = orderService.selectGetOrders("usernumber", usersVO.getUsernumber());
			List<CouponVO> listCouponVO = orderService.getCouponList(usersVO.getUsernumber());
			List<ProductVO> listProductVO = new ArrayList<ProductVO>();
			for(int i = 0 ; i< listOrdersVO.size();i++) {
				listProductVO.add(productService.selectProductVO("productnumber",
						Integer.toString(listOrdersVO.get(i).getProductnumber())));
			}
			model.addAttribute("usersVO", usersVO);
			model.addAttribute("listOrdersVO",listOrdersVO);
			model.addAttribute("listCouponVO",listCouponVO);
			model.addAttribute("listProductVO",listProductVO);
			
		}else {
			model.addAttribute("alertContent","로그인 해주세요^^");
			model.addAttribute("path","login/");
			return "alert";
		}
		return "mypage";
	}
}
