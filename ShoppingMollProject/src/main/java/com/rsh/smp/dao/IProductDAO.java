package com.rsh.smp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rsh.smp.vo.ColorVO;
import com.rsh.smp.vo.ProductVO;
import com.rsh.smp.vo.SizesVO;

public interface IProductDAO {

	int selectProduct(@Param("product") String product);

	List<ProductVO> selectProductPage(@Param("product") String product, 
			@Param("sort") String sort,
			@Param("first") int first,
			@Param("last") int last);

	ProductVO selectProductVO(@Param("colums")String colums, 
			@Param("info")String info);

	List<ColorVO> selectColorVO(@Param("colums")String colums, @Param("info")String info);

	List<SizesVO> selectSizesVO(@Param("colums")String colums, @Param("info")String info);
}
