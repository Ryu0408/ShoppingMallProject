package com.rsh.smp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rsh.smp.dao.IBoardDAO;
import com.rsh.smp.vo.BoardVO;
import com.rsh.smp.vo.PagingVO;

@Service
public class BoardService {

	@Autowired IBoardDAO iBoardDAO;
	public List<BoardVO> selectAllboard(PagingVO vo, String kind) {
		 return iBoardDAO.selectAllboard(vo, kind);
	}
	
	public int selectBoardCount() {
		return iBoardDAO.selectBoardCount();
	}


}
