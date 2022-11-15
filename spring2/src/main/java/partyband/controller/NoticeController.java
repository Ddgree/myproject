package partyband.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.weaver.MemberImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import partyband.model.MemberBean;
import partyband.model.Notice;
import partyband.service.MemberServiceImpl;
import partyband.service.NoticeService;
import partyband.service.NoticeServiceImpl;
import partyband.service.PagingPgm;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService ns;
	
	@Autowired
//	@Inject
	private NoticeServiceImpl noticeService;
	
	@Autowired
	private MemberServiceImpl ms;
	
	@RequestMapping("notice_list.do")	// 전체 목록, 검색 목록
	public String list(String pageNum, Notice notice, Model model) {
		
		//1.System.out.println("리스트 들어옴");
		
		final int rowPerPage = 10;	// 화면에 출력할 데이터 갯수
		
		if (pageNum == null || pageNum.equals("")) {
			pageNum = "1";
		}
		int currentPage = Integer.parseInt(pageNum); // 현재 페이지 번호
		
		// int total = bs.getTotal();
		int total = ns.getTotal(notice); // 검색 (데이터 갯수)
		
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		
		PagingPgm pp = new PagingPgm(total, rowPerPage, currentPage);
		notice.setStartRow(startRow);
		notice.setEndRow(endRow);
		// List<Board> list = bs.list(startRow, endRow);
		int no = total - startRow + 1;		// 화면 출력 번호
		List<Notice> list = ns.list(notice);
		
		model.addAttribute("list", list);
		model.addAttribute("no", no);
		model.addAttribute("pp", pp);
		// 검색
		model.addAttribute("search", notice.getSearch());
		model.addAttribute("keyword", notice.getKeyword());
		
		return "notice/notice_list";
	}	
	
	/* 공지사항 글쓰기 폼 */
	@RequestMapping(value = "/notice_write.do")
	public String notice_write() {
		System.out.println("공지사항 글쓰기 폼");
		
//		model.addAttribute("page", page);
		
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
		
		//System.out.println("저장 들어옴");
		
		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize(); 	// 첨부파일의 크기 (단위:Byte) 

		String path = request.getRealPath("upload");
		//System.out.println("mf=" + mf);
		//System.out.println("filename=" + filename); // filename="Koala.jpg"
		//System.out.println("size=" + size);
		//System.out.println("Path=" + path);
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
		//System.out.println("extension:"+extension);
		
		UUID uuid = UUID.randomUUID();
		
		newfilename = uuid.toString() + extension;
		//System.out.println("newfilename:"+newfilename);		
		
		StringTokenizer st = new StringTokenizer(filename, ".");
		file[0] = st.nextToken();		// 파일명		Koala
		file[1] = st.nextToken();		// 확장자	    jpg
		
		if(size > 100000){				// 100KB
			result=1;
			model.addAttribute("result", result);
			
			return "notice/uploadResult";
			
		}else if(!file[1].equals("jpg") &&
				 !file[1].equals("gif") &&
				 !file[1].equals("png") &&
				 !file[1].equals("jpeg")){
			
			result=2;
			model.addAttribute("result", result);
			
			return "notice/uploadResult";
		}
	}	
		notice.setNotice_file(newfilename);
		
		noticeService.insert(notice);// 저장 메서드 호출	

		return "redirect:/notice_list.do";
	}
	
	
	
	/* 게시판 내용보기,삭제폼,수정폼,답변글폼 */
	@RequestMapping(value = "/notice_cont.do")
	public String notice_cont(@RequestParam("notice_no") int notice_no,
			@RequestParam("pageNum") String pageNum, 
			Model model) throws Exception {

		//System.out.println("상세정보 들어옴");
		
		noticeService.hit(notice_no); // 조회수 증가
		

		Notice notice = noticeService.notice_cont(notice_no);

		model.addAttribute("ncont", notice);
		model.addAttribute("pageNum", pageNum);

		return "notice/notice_cont";// 내용보기 페이지 설정

	}
	
	// 공지사항 수정 폼
	@RequestMapping(value = "/notice_edit.do")
	public String notice_edit(@RequestParam("notice_no") int notice_no,
			@RequestParam("pageNum") String pageNum, Model model) throws Exception {
	//	System.out.println("공지사항 수정 폼");
		
		Notice notice = noticeService.notice_cont(notice_no);
		
		model.addAttribute("ncont", notice);
		model.addAttribute("pageNum", pageNum);
		
		return "notice/notice_edit";
	}
	
	//파일다운
	@RequestMapping("filedown.do")
	public String download(HttpSession session) {
		return "notice/file_down";
	}

	
	/* 게시판 수정 */
	@RequestMapping(value = "/notice_edit_ok.do", method = RequestMethod.POST)
	public String notice_edit_ok(@ModelAttribute Notice n,
								@RequestParam("pageNum") String pageNum,
								@RequestParam("notice_file1") MultipartFile mf, HttpServletRequest request,
								Model model) throws Exception {
		
		//System.out.println("공지사항 수정 저장");

		// 수정 메서드 호출
		Notice notice = noticeService.notice_cont(n.getNotice_no());
		
		String filename = mf.getOriginalFilename();
		int size = (int)mf.getSize(); //첨부파일 크기 (단위:Byte)
		
		String path = request.getRealPath("upload");
		//System.out.println("mf=" + mf);
		//System.out.println("filename=" + filename);
		//System.out.println("size=" + size);
		//System.out.println("Path=" + path);
		int result1=0;
		
		String file[] = new String[2];
		
		String newfilename = "";
	
	if(filename != ""){	 // 첨부파일이 전송된 경우	
		// 파일 중복문제 해결
		String extension = filename.substring(filename.lastIndexOf("."), filename.length());
		//System.out.println("extension:"+extension);
		
		UUID uuid = UUID.randomUUID();
		
		newfilename = uuid.toString() + extension;
		//System.out.println("newfilename:"+newfilename);		
		
		StringTokenizer st = new StringTokenizer(filename, ".");
		file[0] = st.nextToken();		// 파일명		Koala
		file[1] = st.nextToken();		// 확장자	    jpg
		
		if(size > 1000000){				// 100KB
			result1=1;
			model.addAttribute("result", result1);
			
			return "notice/uploadResult";
			
		}else if(!file[1].equals("jpg") &&
				 !file[1].equals("gif") &&
				 !file[1].equals("png") &&
				 !file[1].equals("jpeg")){
			
			result1=2;
			model.addAttribute("result", result1);
			
			return "notice/uploadResult";
		}
	}	
	
	if (size > 0) {
		mf.transferTo(new File(path + "/" + newfilename));
		
	}

	if (size > 0 ) {          // 첨부 파일이 수정되면
        n.setNotice_file(newfilename);         
     } else {                // 첨부파일이 수정되지 않으면
        n.setNotice_file(n.getNotice_file());
     }	
		noticeService.edit(n);
		
		return "redirect:/notice_cont.do?notice_no=" + n.getNotice_no()
					+ "&pageNum=" + pageNum;
	}
	
	/* 공지사항 삭제 폼 */
	@RequestMapping(value = "/notice_del.do")
	public String notice_del(@RequestParam("notice_no") int notice_no,
			@RequestParam("pageNum") String pageNum, Model model) throws Exception {
		//System.out.println("공지사항 삭제 폼");
		
		Notice notice = noticeService.notice_cont(notice_no);
		
		model.addAttribute("ncont", notice);
		model.addAttribute("pageNum", pageNum);
		
		return "notice/notice_del";
	}

	
	/* 공지사항 삭제 */
	@RequestMapping(value = "/notice_del_ok.do", method = RequestMethod.POST)
	public String notice_del_ok(@RequestParam("notice_no") int notice_no,
			@RequestParam("pageNum") String pageNum,
			@RequestParam("pwd") String pwd, String member_id,
			HttpServletRequest request, HttpSession session,
			Model model) throws Exception {
		
		//System.out.println("공지사항 삭제");

		Notice notice = noticeService.notice_cont(notice_no);
		String passwd = ms.deleteboard(member_id);
		
		int result=0;
		
		if (!pwd.equals(passwd)) {
			result = 1;
			model.addAttribute("result", result);

			return "notice/deleteResult";

		} else {
			noticeService.del_ok(notice_no);		
		}
		
		return "notice/deleteOk";
	}
	
	
}
