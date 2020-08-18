package com.rsh.smp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rsh.smp.vo.BoardVO;

public interface IBoardDAO {


	int countArticle(@Param("searchOption")String searchOption, 
			@Param("keyword")String keyword, @Param("kind")String kind);

	List<BoardVO> listALL(@Param("start")int start, @Param("end")int end, 
			@Param("searchOption")String searchOption, 
			@Param("keyword")String keyword, @Param("kind")String kind);

}
