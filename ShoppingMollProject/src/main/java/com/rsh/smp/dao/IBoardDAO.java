package com.rsh.smp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rsh.smp.vo.BoardVO;
import com.rsh.smp.vo.PagingVO;

public interface IBoardDAO {

	List<BoardVO> selectAllboard(@Param("vo")PagingVO vo, @Param("kind")String kind);
	int selectBoardCount();
}
