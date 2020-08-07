package com.rsh.smp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rsh.smp.vo.ProductVO;

public interface IProductDAO {

	int selectProduct(@Param("product") String product);

	List<ProductVO> selectProductPage(@Param("product") String product, 
			@Param("sort") String sort,
			@Param("first") int first,
			@Param("last") int last);
}
