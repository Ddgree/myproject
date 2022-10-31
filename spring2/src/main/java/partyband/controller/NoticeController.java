package partyband.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import partyband.model.Notice;
import partyband.service.NoticeServiceImpl;

@Controller
public class NoticeController {
	
	@Autowired
//	@Inject
	private NoticeServiceImpl noticeService;
	
	@RequestMapping("test.do")
	public String test(){
		System.out.println("컨트롤러 들어옴");
		
		return "notice/test";
	}
	
	/* 공지사항 목록 */
	@RequestMapping(value = "/notice_list.do")
	public String notice_list(HttpServletRequest request, Model model) throws Exception {
		
		System.out.println("리스트 들어옴");
		
		HttpSession session = request.getSession();
		String id = "admin";
		String passwd = "1234";
		
		session.setAttribute("id", id);
		session.setAttribute("passwd", passwd);

		List<Notice> noticelist = new ArrayList<Notice>();

		int page = 1;
		int limit = 10; // 한 화면에 출력할 레코드수

		System.out.println("page="+page);

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 총 리스트 수를 받아옴.
		int listcount = noticeService.getListCount();

		// 페이지 번호(page)를 DAO클래스에게 전달한다.
		noticelist = noticeService.getNoticeList(page); // 리스트를 받아옴.

		// 총 페이지 수.
		int maxpage = (int) ((double) listcount / limit + 0.95); // 0.95를 더해서 올림
																	// 처리.
		// 현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
		int startpage = (((int) ((double) page / 10 + 0.9)) - 1) * 10 + 1;
		// 현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
		int endpage = maxpage;

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		model.addAttribute("page", page);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		model.addAttribute("listcount", listcount);
		model.addAttribute("noticelist", noticelist);
		
		return "notice/notice_list";
	}
	
	/* 공지사항 글쓰기 폼 */
	@RequestMapping(value = "/notice_write.do")
	public String notice_write(@RequestParam("page") String page, Model model) {
		System.out.println("공지사항 글쓰기 폼");
		
		model.addAttribute("page", page);
		
		return "notice/notice_write";
	}
	
	/* 공지사항 저장 */
	@RequestMapping(value = "/notice_write_ok.do", method = RequestMethod.POST)
	public String notice_write_ok(@ModelAttribute Notice notice,
								  @RequestParam("notice_file1") MultipartFile mf,
								  HttpServletRequest request,
								  Model model)
			throws Exception {
//	public String board_write_ok(@RequestParam HashMap board)
//			throws Exception {
		
		System.out.println("저장 들어옴");
		
		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize(); 	// 첨부파일의 크기 (단위:Byte) 

		String path = request.getRealPath("upload");
		System.out.println("mf=" + mf);
		System.out.println("filename=" + filename); // filename="Koala.jpg"
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
		
		if(size > 100000){				// 100KB
			result=1;
			model.addAttribute("result", result);
			
			return "notice/uploadResult";
			
		}else if(!file[1].equals("jpg") &&
				 !file[1].equals("gif") &&
				 !file[1].equals("png") ){
			
			result=2;
			model.addAttribute("result", result);
			
			return "notice/uploadResult";
		}
	}	

		if (size > 0) { // 첨부파일이 전송된 경우

			mf.transferTo(new File(path + "/" + newfilename));

		}
	
		notice.setNotice_file(newfilename);
		
		noticeService.insert(notice);// 저장 메서드 호출	

		return "redirect:/notice_list.do";
	}
	
	
	
	/* 게시판 내용보기,삭제폼,수정폼,답변글폼 */
	@RequestMapping(value = "/notice_cont.do")
	public String notice_cont(@RequestParam("notice_no") int notice_no,
			@RequestParam("page") String page,
			@RequestParam("state") String state, 
			Model model) throws Exception {

		System.out.println("상세정보 들어옴");
		
		if (state.equals("cont")) { // 내용보기일때만
			noticeService.hit(notice_no); // 조회수 증가
		}

		Notice notice = noticeService.notice_cont(notice_no);

		model.addAttribute("ncont", notice);
		model.addAttribute("page", page);

		if (state.equals("cont")) {// 내용보기일때
			return "notice/notice_cont";// 내용보기 페이지 설정
			// String board_cont = board.getBoard_content().replace("\n",
			// "<br/>");
			// 글내용중 엔터키 친부분을 웹상에 보이게 할때 다음줄로 개행
			// contM.addObject("board_cont", board_cont);
		} else if (state.equals("edit")) {// 수정폼
			return "notice/notice_edit";
		} else if (state.equals("del")) {// 삭제폼
			return "notice/notice_del";
		} 
		return null;
	}
	
	//파일다운
	@RequestMapping("filedown.do")
	public String download(HttpSession session) {
		return "notice/file_down";
	}

	
	/* 게시판 수정 */
	@RequestMapping(value = "/notice_edit_ok.do", method = RequestMethod.POST)
	public String notice_edit_ok(@ModelAttribute Notice n,
								@RequestParam("page") String page,
								Model model) throws Exception {
		
		System.out.println("공지사항 수정");

		// 수정 메서드 호출
		Notice notice = noticeService.notice_cont(n.getNotice_no());
//		int result = 0;
		
//		if (!notice.getAdmin_passwd().equals(n.getAdmin_passwd())) {// 비번이 같다면
//			result = 1;
//			model.addAttribute("result", result);
//			
//			return "notice/updateResult";
//
//		} else {
//			// 수정 메서드 호출
//			noticeService.edit(n);			
//		}	
		
		noticeService.edit(n);
		
		return "redirect:/notice_cont.do?notice_no=" + n.getNotice_no()
					+ "&page=" + page + "&state=cont";
	}

	
	/* 게시판 삭제 */
	@RequestMapping(value = "/notice_del_ok.do", method = RequestMethod.POST)
	public String notice_del_ok(@RequestParam("notice_no") int notice_no,
			@RequestParam("page") String page,
			@RequestParam("pwd") String passwd,
			HttpServletRequest request, HttpSession session,
			Model model) throws Exception {
		
		System.out.println("공지사항 삭제");

		Notice notice = noticeService.notice_cont(notice_no);
		
		int result=0;
		
		if (!session.getAttribute("passwd").equals(passwd)) {
			result = 1;
			model.addAttribute("result", result);

			return "notice/deleteResult";

		} else {
			noticeService.del_ok(notice_no);		
		}
		
		return "redirect:/notice_list.do?page=" + page;
	}
	
	
}
