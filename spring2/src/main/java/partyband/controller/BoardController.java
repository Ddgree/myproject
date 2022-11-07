package partyband.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import partyband.service.PagingPgm;
import partyband.model.BoardBean;
import partyband.model.partybean;
import partyband.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	BoardService service;

	// 게시판 저장
	@RequestMapping("board_write_ok.do")
	public String board_write_ok(@ModelAttribute BoardBean board, String board_id,
			@RequestParam("board_file1") MultipartFile mf,
			HttpServletRequest request, Model model) throws Exception {
		String filename = mf.getOriginalFilename();
		int size = (int)mf.getSize(); //첨부파일 크기 (단위:Byte)
		
		String path = request.getRealPath("upload");
		System.out.println("mf=" + mf);
		System.out.println("filename=" + filename);
		System.out.println("size=" + size);
		System.out.println("Path=" + path);
		int result=0;
		
		String file[] = new String[2];
//		file = filename.split(".");
//		System.out.println(file.length);
//		System.out.println("file0="+file[0]);
//		System.out.println("file1="+file[1]);
		
		String newfilename = "";
	
	if(filename != ""){	 // 첨부파일이 전송된 경우	
		
		// 파일 중복문제 해결
		String extension = filename.substring(filename.lastIndexOf("."), filename.length());
		System.out.println("extension:"+extension);
		
		UUID uuid = UUID.randomUUID();
		
		newfilename = uuid.toString() + extension;
		System.out.println("newfilename:"+newfilename);		
		
		StringTokenizer st = new StringTokenizer(filename, ".");
		file[0] = st.nextToken();		// 파일명		Koala
		file[1] = st.nextToken();		// 확장자	    jpg
		
		model.addAttribute("board", board);
		if(size > 100000){				// 100KB
			result=1;
			model.addAttribute("result", result);
			
			return "board/board_uploadResult";
			
		}else if(!file[1].equals("jpg") &&
				 !file[1].equals("gif") &&
				 !file[1].equals("png") ){
			
			result=2;
			model.addAttribute("result", result);
			
			return "board/board_uploadResult";
		}
	}	

		if (size > 0) { // 첨부파일이 전송된 경우
			mf.transferTo(new File(path + "/" + newfilename));

		}
		board.setBoard_file(newfilename);
		service.write(board);// 저장 메서드 호출
		
		return "redirect:/board_list.do";
	}

	// 게시판 목록 조회
	@RequestMapping("board_list.do")
	public String list(HttpServletRequest request, Model model, String pageNum, BoardBean board) throws Exception {
		final int rowPerPage = 10;	// 화면에 출력할 데이터 갯수
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지 번호
		
		// int total = bs.getTotal();
		int total = service.getListCount(board); // 검색 (데이터 갯수)
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		board.setStartRow(startRow);
		board.setEndRow(endRow);
		// List<Board> list = bs.list(startRow, endRow);
		int no = total - startRow + 1;		// 화면 출력 번호
		List<BoardBean> list = service.list(board);
		
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		// 검색
		model.addAttribute("search", board.getSearch());
		model.addAttribute("keyword", board.getKeyword());
		
		return "board/board_list";
	}
	
	
	// 파일 다운로드
	@RequestMapping("file_down.do")
	public String filedown(String file_name, BoardBean board, Model model) {
		model.addAttribute("filename", file_name);
		return "board/file_down";
	}
		
	// 게시판 글 작성
	@RequestMapping("board_write.do")
	public String write(BoardBean board, Model model, String board_id) throws Exception {
		System.out.println("controller 게시판 글 작성");
		board.setBoard_id(board_id);
		model.addAttribute("board", board);
		return "board/board_write";
	}

	// 게시글 조회
	@RequestMapping("board_content.do")
	public String read(@RequestParam("board_no") int board_no, @RequestParam("page") String page, Model model, 
			BoardBean board, String board_id)
			throws Exception {

		service.hit(board_no);
	
		model.addAttribute("read", service.read(board_no));
		model.addAttribute("page", page);
		model.addAttribute("board", board);

		return "board/board_content";
	}

	// 게시판 수정폼 이동
	@RequestMapping("board_update.do")
	public String board_update(@RequestParam("board_no") int board_no, Model model, 
			@RequestParam("page") String page) throws Exception {
		System.out.println("controller 게시판 수정폼 이동");
		
		model.addAttribute("read", service.read(board_no));
		model.addAttribute("page", page);
		return "board/board_update";
	}
	// 게시판 수정 
	@RequestMapping(value="/board_update_ok.do", method = RequestMethod.POST)
	public String board_edit_ok(@RequestParam("page") String page, Model model, @ModelAttribute BoardBean board,
			@RequestParam("board_file1") MultipartFile mf, HttpServletRequest request)
			throws Exception {
		System.out.println("controller 게시판 수정");
		// 수정 메서드 호출
		int result = 0;
		BoardBean read = service.read(board.getBoard_no());
		
		if (!board.getBoard_passwd().equals(read.getBoard_passwd())) {// 비번이 다르다면
			result = 1;
			model.addAttribute("result", result);
			return "board/updateResult";

		} else {
			
			String filename = mf.getOriginalFilename();
			int size = (int)mf.getSize(); //첨부파일 크기 (단위:Byte)
			
			String path = request.getRealPath("upload");
			System.out.println("mf=" + mf);
			System.out.println("filename=" + filename);
			System.out.println("size=" + size);
			System.out.println("Path=" + path);
			int result1=0;
			
			String file[] = new String[2];
//			file = filename.split(".");
//			System.out.println(file.length);
//			System.out.println("file0="+file[0]);
//			System.out.println("file1="+file[1]);
			
			String newfilename = "";
		
		if(filename != ""){	 // 첨부파일이 전송된 경우	
			System.out.println("첨부파일");
			// 파일 중복문제 해결
			String extension = filename.substring(filename.lastIndexOf("."), filename.length());
			System.out.println("extension:"+extension);
			
			UUID uuid = UUID.randomUUID();
			
			newfilename = uuid.toString() + extension;
			System.out.println("newfilename:"+newfilename);		
			
			StringTokenizer st = new StringTokenizer(filename, ".");
			file[0] = st.nextToken();		// 파일명		Koala
			file[1] = st.nextToken();		// 확장자	    jpg
			
			if(size > 100000){				// 100KB
				result1=1;
				model.addAttribute("result", result1);
				
				return "board/board_uploadResult";
				
			}else if(!file[1].equals("jpg") &&
					 !file[1].equals("gif") &&
					 !file[1].equals("png") ){
				
				result1=2;
				model.addAttribute("result", result1);
				
				return "board/board_uploadResult";
			}
		}	
		
		if (size > 0) {
			mf.transferTo(new File(path + "/" + newfilename));
			
		}

		if (size > 0 ) {          // 첨부 파일이 수정되면
	        board.setBoard_file(newfilename);         
	     } else {                // 첨부파일이 수정되지 않으면
	        board.setBoard_file(read.getBoard_file());
	     }
			
			// 수정 메서드 호출
//		model.addAttribute("board", board);
			service.edit(board);
		}

		return "redirect:/board_content.do?board_no=" + read.getBoard_no() + "&page=" + page;
	}

	// 게시판 삭제 폼 이동
	@RequestMapping("board_delete.do")
	public String board_delete(@RequestParam("board_no") int board_no, Model model, @RequestParam("page") String page) throws Exception{
		System.out.println("controller 게시판 삭제 폼 이동");
		model.addAttribute("read", service.read(board_no));
		model.addAttribute("page", page);
		return "board/board_delete";
	}
	// 게시판 삭제
	@RequestMapping(value="/board_delete_ok.do", method = RequestMethod.POST)
	public String board_del_ok(@RequestParam("board_no") int board_no, @RequestParam("page") String page,
			@RequestParam("board_passwd") String board_passwd, Model model) throws Exception {

		BoardBean board = service.read(board_no);
		int result = 0;

		if (!board.getBoard_passwd().equals(board_passwd)) {
			result = 1;
			model.addAttribute("result", result);

			return "board/deleteResult";

		} else {
			service.delete(board_no);
		}

		return "redirect:/board_list.do?page=" + page;
	}


}
