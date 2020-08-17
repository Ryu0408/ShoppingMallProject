package com.rsh.smp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rsh.smp.dao.IOrderDAO;
import com.rsh.smp.vo.CouponVO;

@Service
public class OrderService {

	@Autowired IOrderDAO iOrderDAO;
	
	public List<CouponVO> getCouponList(int usernumber) {
		return iOrderDAO.getCouponList(usernumber);
	}

	@Transactional
	public void insertOrder(String colums, int number, String productNumber, String amount, String price,
			String color, String sizes, String name, String postCode, String detailAddress, String address,
			String phone1, String phone2, String phone3, String email, String message, String totalorderprice, int i ) {
		iOrderDAO.insertOrder(colums, number, productNumber, amount, price,
				color, sizes, name, postCode, detailAddress, address, phone1, phone2, phone3,
				email, message);
		
		if(colums == "usernumber") {
			iOrderDAO.updateUserTotalOrder(number);
			if(i == 0) {
				iOrderDAO.updateUserTotalPrice(number, totalorderprice);
			}
		}
	}

	public void couponDelete(int usernumber, String couponName) {
		iOrderDAO.couponDelete(usernumber, couponName);
	}
	
	@Transactional
	public void updateUserReserve(int usernumber, String reserveinput, String reserveSum) {
		iOrderDAO.updateUserReserve(usernumber, reserveinput, reserveSum);
		iOrderDAO.updateResidualReserve(usernumber);
	}

}
