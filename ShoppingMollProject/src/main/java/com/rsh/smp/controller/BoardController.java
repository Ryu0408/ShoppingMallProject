package com.rsh.smp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.rsh.smp.classes.BoardPager;
import com.rsh.smp.service.BoardService;
import com.rsh.smp.vo.BoardVO;

@Controller
public class BoardController {

	@Autowired BoardService boardService;
	
	@RequestMapping(value = "/board/")
	public String notice(
			@RequestParam(defaultValue="notice") String kind,
			@RequestParam(defaultValue="title") String searchOption, 
			@RequestParam(defaultValue="") String keyword, 
			@RequestParam(defaultValue="1") int curPage, 
			Model model) {
        int count = boardService.countArticle(searchOption,keyword, kind);
        BoardPager boardPager = new BoardPager(count, curPage);

        int start = boardPager.getPageBegin();
        int end = boardPager.getPageEnd();
        List<BoardVO> list = boardService.listALL(start,end,searchOption,keyword,kind);
        model.addAttribute("list",list);
        model.addAttribute("count",count);
        model.addAttribute("searchOption",searchOption);
        model.addAttribute("keyword",keyword);
        model.addAttribute("boardPager",boardPager);
        model.addAttribute("kind",kind);
        return "board";
	}
}
