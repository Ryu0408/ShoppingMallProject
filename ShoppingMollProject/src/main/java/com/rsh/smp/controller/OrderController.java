package com.rsh.smp.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rsh.smp.service.LoginService;
import com.rsh.smp.service.OrderService;
import com.rsh.smp.service.ProductService;
import com.rsh.smp.vo.CouponVO;
import com.rsh.smp.vo.ProductVO;
import com.rsh.smp.vo.UsersVO;

@Controller
public class OrderController {
	
	@Autowired ProductService productService;
	
	@Autowired LoginService loginService;
	
	@Autowired OrderService orderService;

	@RequestMapping(value = "/order/productDetail/", method = RequestMethod.POST)
	public String orderProductDetail(String[] productnumber, String[] amount,
			String[] price, String[] colorAndSize, Model model, HttpSession session) {
		List<ProductVO> listProductVO = new ArrayList<ProductVO>();
		String[] color = new String[50];
		String[] sizes =  new String[50];
		for(int i = 0 ; i< productnumber.length;i++) {
			listProductVO.add(productService.selectProductVO("productnumber",productnumber[i]));
			String[] tempcolorAndSize = colorAndSize[i].split("\\(");
			color[i] = tempcolorAndSize[0];
			sizes[i] = tempcolorAndSize[1].replaceAll("\\)", "");
		}
		String usersSession = (String) session.getAttribute("sessionID");
		if(usersSession != null) {
			UsersVO usersVO = loginService.selectGetUsers("id",usersSession);
			model.addAttribute("usersVO", usersVO);
			List<CouponVO> listCouponVO = orderService.getCouponList(usersVO.getUsernumber());
			model.addAttribute("listCounponVO",listCouponVO);
		}
		model.addAttribute("listProductVO",listProductVO);
		model.addAttribute("color",color);
		model.addAttribute("sizes",sizes);
		model.addAttribute("amount",amount);
		return "order";
	}
	
	@RequestMapping(value = "/order/finalOrder/", method = RequestMethod.POST)
	public String finalOrder(String[] productNumber, String[] amount,
			String[] price, String[] color, String[] sizes, String name,
			String postCode, String detailAddress, String address, String phone1,
			String phone2, String phone3, String email, String message,
			String[] couponName, String reserveinput, String totalorderprice,
			String reserveSum,
			Model model, HttpSession session) {

		String usersSession = (String) session.getAttribute("sessionID");
		UsersVO usersVO = new UsersVO();
		for(int i = 0 ; i < productNumber.length;i++) {
			if(usersSession != null) {
				usersVO = loginService.selectGetUsers("id",usersSession);
				orderService.insertOrder("usernumber", usersVO.getUsernumber(), productNumber[i],amount[i],
						price[i],color[i],sizes[i],name,postCode,detailAddress, address, phone1,phone2,phone3,email,message, 
						totalorderprice, i);
			}else {
				Random random = new Random();
				int randomNumber = random.nextInt();
				orderService.insertOrder("nonusernumber",randomNumber , productNumber[i],amount[i],
						price[i],color[i],sizes[i],name,postCode,detailAddress, address,phone1,phone2,phone3,email,message,
						totalorderprice, i);
			}
		}
		if(usersSession != null)  {
			if(reserveinput == "") {reserveinput = "0";}
			orderService.updateUserReserve(usersVO.getUsernumber(), reserveinput, reserveSum);
		}
		if(couponName != null) {
			for(int i = 0 ; i < couponName.length;i++) {
				orderService.couponDelete(usersVO.getUsernumber(), couponName[i]);
			}
		}
		model.addAttribute("alertContent", "주문이 완료되었습니다^^(비회원은 로그인페이지에서 주문정보를 확인할 수 있습니다^^");
		model.addAttribute("path", "");
		return "alert";
	}
}
