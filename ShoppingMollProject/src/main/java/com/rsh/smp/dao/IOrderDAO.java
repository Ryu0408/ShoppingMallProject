package com.rsh.smp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rsh.smp.vo.CouponVO;

public interface IOrderDAO {

	List<CouponVO> getCouponList(@Param("usernumber")int usernumber);

	void insertOrder(@Param("colums")String colums, @Param("number")int number, @Param("productNumber")String productNumber, 
			@Param("amount")String amount, @Param("price")String price, @Param("color")String color,
			@Param("sizes")String sizes, @Param("name")String name, @Param("postCode")String postCode, 
			@Param("detailAddress")String detailAddress, @Param("address")String address, @Param("phone1")String phone1, 
			@Param("phone2")String phone2, @Param("phone3")String phone3, @Param("email")String email,
			@Param("message")String message );

	void couponDelete(@Param("usernumber")int usernumber, @Param("couponName")String couponName);

	void updateUserTotalPrice(@Param("number")int number, @Param("totalorderprice") String totalorderprice);

	void updateUserReserve(@Param("number")int usernumber, 
			@Param("reserveinput")String reserveinput, @Param("reserveSum")String reserveSum);

	void updateResidualReserve(@Param("number")int usernumber);

	void updateUserTotalOrder(@Param("number")int number);

}
