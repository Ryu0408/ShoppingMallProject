package com.rsh.smp.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rsh.smp.service.BoardService;
import com.rsh.smp.vo.PagingVO;

@Controller
public class BoardController {

	@Autowired BoardService boardService;
	
	@RequestMapping(value = "/board/{kind}/{nowPage}/{cntPerPage}/", method = RequestMethod.GET)
	public String notice(@PathVariable(value="nowPage", required=false) String nowPage, 
			@PathVariable(value="kind", required=false) String kind, 
			@PathVariable(value="cntPerPage", required=false) String cntPerPage,
			PagingVO vo, Model model) {
		int total = boardService.selectBoardCount();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", vo);
		model.addAttribute("listBoardVO", boardService.selectAllboard(vo, kind));
		return "board";
	}
}
