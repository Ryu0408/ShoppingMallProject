package com.rsh.smp.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rsh.smp.dao.IBoardDAO;
import com.rsh.smp.vo.BoardVO;

@Service
public class BoardService {

	@Autowired IBoardDAO iBoardDAO;

	public int countArticle(String searchOption, String keyword, String kind) {
		return iBoardDAO.countArticle(searchOption, keyword, kind);
	}

	public List<BoardVO> listALL(int start, int end, String searchOption, String keyword, String kind) {
		return iBoardDAO.listALL(start,end,searchOption,keyword,kind);
	}


}
