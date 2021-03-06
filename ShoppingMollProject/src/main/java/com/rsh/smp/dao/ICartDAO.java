package com.rsh.smp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rsh.smp.vo.CartVO;

public interface ICartDAO {

	List<CartVO> selectCartVO(@Param("colums")String colums, @Param("info")String info);

	void deleteCart(@Param("colums")String colums, @Param("number")String number, 
			@Param("color")String color, @Param("sizes")String sizes);

}
