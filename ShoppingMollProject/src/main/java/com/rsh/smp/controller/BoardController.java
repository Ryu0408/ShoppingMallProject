package com.rsh.smp.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.rsh.smp.classes.BoardPager;
import com.rsh.smp.service.BoardService;
import com.rsh.smp.service.LoginService;
import com.rsh.smp.vo.BoardVO;
import com.rsh.smp.vo.UsersVO;

@Controller
public class BoardController {

	@Autowired BoardService boardService;
	
	@Autowired LoginService loginService;
	
	@Inject BCryptPasswordEncoder pwdEncoder;
	
	@RequestMapping(value = "/board/")
	public String board(
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
	
	@RequestMapping(value = "/board/write/{kind}/")
	public String boardWrite(@PathVariable("kind") String kind, Model model, HttpSession session) {
		String usersSession = (String) session.getAttribute("sessionID");
		if(usersSession != null) {
			UsersVO usersVO = loginService.selectGetUsers("id",usersSession);
			model.addAttribute(usersVO);
		}
        model.addAttribute("kind",kind);
        return "boardWrite";
	}
	

    @RequestMapping(value="/image/upload/", method = RequestMethod.POST)
    public void imageUpload(HttpServletRequest request,
            HttpServletResponse response, MultipartHttpServletRequest multiFile
            , @RequestParam MultipartFile upload) throws Exception{
        // 랜덤 문자 생성
        UUID uid = UUID.randomUUID();
        OutputStream out = null;
        PrintWriter printWriter = null;
        //인코딩
        response.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        try{
            //파일 이름 가져오기
            String fileName = upload.getOriginalFilename();
            byte[] bytes = upload.getBytes();
            String path = "/upload/";// fileDir는 전역 변수라 그냥 이미지 경로 설정해주면 된다.
            String ckUploadPath = path + uid + "_" + fileName;
            File folder = new File(path);
            //해당 디렉토리 확인
            if(!folder.exists()){
                try{
                    folder.mkdirs(); // 폴더 생성
                }catch(Exception e){
                    e.getStackTrace();
                }
            }
            out = new FileOutputStream(new File(ckUploadPath));
            out.write(bytes);
            out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화
            System.out.println("out.flush()실행");
            String callback = request.getParameter("CKEditorFuncNum");
            printWriter = response.getWriter();
            String fileUrl = request.getContextPath() + "/image/submit/?uid=" + uid + "&fileName=" + fileName;  // 작성화면
        // 업로드시 메시지 출력
          printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
          System.out.println("printwirterln 실행");
          printWriter.flush();
          System.out.println("플러시실행");
        }catch(IOException e){
            e.printStackTrace();
        } finally {
          try {
           if(out != null) { out.close(); }
           if(printWriter != null) { printWriter.close(); }
          } catch(IOException e) { e.printStackTrace(); }
         }
        return;
    }
    
    @RequestMapping(value="/image/submit/")
    public void ckSubmit(@RequestParam(value="uid") String uid
                            , @RequestParam(value="fileName") String fileName
                            , HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        //서버에 저장된 이미지 경로
        String path = "/upload/";
        String sDirPath = path + uid + "_" + fileName;
        File imgFile = new File(sDirPath);
        //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
        if(imgFile.isFile()){
            byte[] buf = new byte[1024];
            int readByte = 0;
            int length = 0;
            byte[] imgBuf = null;
            FileInputStream fileInputStream = null;
            ByteArrayOutputStream outputStream = null;
            ServletOutputStream out = null;
            try{
                fileInputStream = new FileInputStream(imgFile);
                outputStream = new ByteArrayOutputStream();
                out = response.getOutputStream();
                while((readByte = fileInputStream.read(buf)) != -1){
                    outputStream.write(buf, 0, readByte);
                }
                imgBuf = outputStream.toByteArray();
                length = imgBuf.length;
                out.write(imgBuf, 0, length);
                out.flush();
            }catch(IOException e){
            	System.out.println(e);
            }finally {
                outputStream.close();
                fileInputStream.close();
                out.close();
            }
        }
    }
    
	@RequestMapping(value = "/board/write/")
	public String boardWrite(BoardVO boardVO, Model model) {
		if(boardVO.getUsernumber() != 0) {
			boardService.insertBoard(boardVO);
		}else {
			String inputPass = boardVO.getPassword();
			String pwd = pwdEncoder.encode(inputPass);
			boardVO.setPassword(pwd);
			boardService.insertBoard(boardVO);
		}
		model.addAttribute("alertContent","게시글이 작성되었습니다.");
		model.addAttribute("path","board/?kind=" + boardVO.getKind());
        return "alert";
	}
	
	@RequestMapping(value = "/board/detailBoard/{boardnumber}/")
	public String boardDetail(Model model, @PathVariable("boardnumber") String boardnumber) {
		BoardVO boardVO = boardService.selectBoard(boardnumber);
		model.addAttribute(boardVO);
        return "boardDetail";
	}
	
	@RequestMapping(value = "/board/passwordCheck/", method = RequestMethod.GET)
	public String boardPasswordCheck(BoardVO boardVO, Model model) {
		model.addAttribute(boardVO);
        return "boardPasswordCheck";
	}
	
	@RequestMapping(value = "/board/passwordCheck/", method = RequestMethod.POST)
	public String boardPasswordCheck(Model model, BoardVO boardVO) {
		String inputPassword = boardVO.getPassword();
		boardVO = boardService.selectBoard(boardVO.getBoardnumber()+"");
		boolean comparePassword =  pwdEncoder.matches(inputPassword, boardVO.getPassword());
		if(comparePassword == true) {
			model.addAttribute("boardVO",boardVO);
			return "boardEdit";
		}else {
			model.addAttribute("alertContent","비밀번호가 틀렸습니다.");
			model.addAttribute("path","board/detailBoard/"+boardVO.getBoardnumber()+"/");
		}
        return "alert";
	}
	
	@RequestMapping(value = "/board/update/" , method = RequestMethod.POST)
	public String boardUpdate(BoardVO boardVO, Model model) {
		boardService.updateBoard(boardVO);
		boardVO = boardService.selectBoard(boardVO.getBoardnumber()+"");
		model.addAttribute("alertContent","게시글이 수정되었습니다.");
		model.addAttribute("path","board/detailBoard/"+boardVO.getBoardnumber()+"/");
        return "alert";
	}
}
