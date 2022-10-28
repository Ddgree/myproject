package partyband.controller;

import java.io.File;
import java.io.PrintWriter;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import partyband.model.MemberBean;
import partyband.service.MemberServiceImpl;


@Controller
public class MemberAction {

	@Autowired
	private MemberServiceImpl memberService;

	// ID중복검사 ajax함수로 처리부분
	@RequestMapping(value = "/member_idcheck.do", method = RequestMethod.POST)
	public String member_idcheck(@RequestParam("memid") String id, Model model) throws Exception {
		System.out.println("id:"+id);
		
		int result = memberService.checkMemberId(id);
		model.addAttribute("result", result);

		return "member/idcheckResult";
	}
	
	// 닉네임중복검사 ajax함수로 처리부분
		@RequestMapping(value = "/member_nickcheck.do", method = RequestMethod.POST)
		public String member_nickcheck(@RequestParam("memnick") String nick, Model model) throws Exception {
			System.out.println("nick:"+nick);
			
			int result = memberService.checkMembernickname(nick);
			model.addAttribute("result", result);

			return "member/nickcheckResult";
		}
		
//		/* 비번찾기 완료 */
//		@RequestMapping(value = "/pwd_find_ok.do", method = RequestMethod.POST)
//		public String pwd_find_ok(@ModelAttribute MemberBean mem, HttpServletResponse response, Model model)
//				throws Exception {
//			response.setContentType("text/html;charset=UTF-8");
//			PrintWriter out = response.getWriter();
//
//			MemberBean member = memberService.findpwd(mem);
//
//			if (member == null) {// 값이 없는 경우
//
//				return "member/pwdResult";
//
//			} else {
//
//				// Mail Server 설정
//				String charSet = "utf-8";
//				String hostSMTP = "smtp.naver.com";
//				String hostSMTPid = "darkopera12@naver.com";
//				String hostSMTPpwd = "dnfqkswkd"; // 비밀번호 입력해야함
//
//				// 보내는 사람 EMail, 제목, 내용
//				String fromEmail = "darkopera12@naver.com";
//				String fromName = "관리자";
//				String subject = "비밀번호 찾기";
//
//				// 받는 사람 E-Mail 주소
//				String mail = member.getMember_email();
//
//				try {
//					HtmlEmail email = new HtmlEmail();
//					email.setDebug(true);
//					email.setCharset(charSet);
//					email.setSSL(true);
//					email.setHostName(hostSMTP);
//					email.setSmtpPort(587);
//
//					email.setAuthentication(hostSMTPid, hostSMTPpwd);
//					email.setTLS(true);
//					email.addTo(mail, charSet);
//					email.setFrom(fromEmail, fromName, charSet);
//					email.setSubject(subject);
//					email.setHtmlMsg("<p align = 'center'>비밀번호 찾기</p><br>" + "<div align='center'> 비밀번호 : "
//							+ member.getMember_passwd() + "</div>");
//					email.send();
//				} catch (Exception e) {
//					System.out.println(e);
//				}
//
//				model.addAttribute("pwdok", "등록된 email을 확인 하세요~!!");
//				return "member/pwd_find";
//
//			}
//
//		}


	/* 로그인 폼 뷰 */
	@RequestMapping(value = "/member_login.do")
	public String member_login() {
		return "member/member_login";
	}
	

	/* 회원가입 폼 */
	@RequestMapping(value = "/member_join.do")
	public String member_join() {
		return "member/member_join";
	}
	
	/* 정보수정 전 비번체크 폼 */
	@RequestMapping(value = "/edit_pwcheck.do")
	public String edit_pwcheck() {
		System.out.println("수정 전 비번체크 폼");
		return "member/edit_pwcheck";
	}
	
	/*비번체크 완료*/
	@RequestMapping(value = "/edit_pwcheck_ok.do")
	public String edit_pwcheck_ok(
								  @RequestParam("editpw") String editpw,
								  HttpSession session, 
								  Model model)throws Exception{
		
		System.out.println("비번 체크완료");
		int result=0;		
		String id = (String) session.getAttribute("id");
		MemberBean m = memberService.pwCheck(id);

		if (m.getMember_passwd().equals(editpw)) {	// 비번이 같을때
				
			return "redirect:/member_edit.do";
				
		} else {// 비번이 다를때
			result = 2;
			model.addAttribute("result", result);
			
		}
		
		return null;
	}
	
	//회원가입 완료
	@RequestMapping(value = "/member_join_ok.do", method = RequestMethod.POST)
	public String member_join_ok(@RequestParam("file1") MultipartFile mf,
								@ModelAttribute MemberBean member,
								HttpServletRequest request,
								Model model)throws Exception{
		
		System.out.println("가입맵");
		
		String filename = mf.getOriginalFilename();
		System.out	.println("filename="+filename);
		int size = (int) mf.getSize(); 	// 첨부파일의 크기 (단위:Byte) 

		String path = request.getRealPath("upload");
		System.out.println("mf=" + mf);
		System.out.println("filename=" + filename); // filename="Koala.jpg"
		System.out.println("size=" + size);
		System.out.println("Path=" + path);
		int result=0;
		
		String file[] = new String[2];
		
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
			
			return "member/uploadResult";
			
		}else if(!file[1].equals("jpg") &&
				 !file[1].equals("gif") &&
				 !file[1].equals("png") &&
				 !file[1].equals("jpeg")	){
			
			result=2;
			model.addAttribute("result", result);
			
			return "member/uploadResult";
		}
	}	

		if (size > 0) { // 첨부파일이 전송된 경우

			mf.transferTo(new File(path + "/" + newfilename));

		}
		
		String member_mailid = request.getParameter("member_mailid").trim();
		String member_maildomain = request.getParameter("member_maildomain").trim();
		String member_email = member_mailid + "@" + member_maildomain;
		
		member.setMember_email(member_email);
		member.setMember_file(newfilename);

		memberService.insertMember(member);

		return "redirect:member_login.do";
	}
	
	
	/* 로그인 인증 */
	@RequestMapping(value = "/member_login_ok.do", method = RequestMethod.POST)
	public String member_login_ok(@RequestParam("id") String id, 
			                      @RequestParam("pwd") String pwd,
			                      HttpSession session, 
			                      Model model) throws Exception {
		System.out.println("인증");
		int result=0;		
		MemberBean m = memberService.userCheck(id);

		if (m == null) {	// 등록되지 않은 회원일때
			
			result = 1;
			model.addAttribute("result", result);
			
			return "member/loginResult";
			
		} else {			// 등록된 회원일때
			if (m.getMember_passwd().equals(pwd)) {// 비번이 같을때
				session.setAttribute("member", m);

				String member_nickname = m.getMember_nickname();
				String member_file = m.getMember_file();

				model.addAttribute("member_nickname", member_nickname);
				model.addAttribute("member_file", member_file);

				return "redirect:partyband.do";
				
			} else {// 비번이 다를때
				result = 2;
				model.addAttribute("result", result);
				
				return "member/loginResult";				
			}
		}

	}
	
	/* 회원정보 수정 폼 */
	@RequestMapping(value = "/member_edit.do")
	public String member_edit(HttpSession session, Model m) throws Exception {

		String id = (String) session.getAttribute("id");

		MemberBean upmem = memberService.userCheck(id);

		String member_email = upmem.getMember_email();
		StringTokenizer st01 = new StringTokenizer(member_email, "@");
		// java.util 패키지의 StringTokenizer 클래스는 첫번째 전달인자를
		// 두번째 @를 기준으로 문자열을 파싱해준다.
		String member_mailid = st01.nextToken();// 메일 주소 저장
		String member_maildomain = st01.nextToken(); // 도메인 저장

		m.addAttribute("upmem", upmem);
		m.addAttribute("member_mailid", member_mailid);
		m.addAttribute("member_maildomain", member_maildomain);

		return "member/member_edit";
	}

	
	/* 회원정보 수정(fileupload) */
	@RequestMapping(value = "/member_edit_ok.do", method = RequestMethod.POST)
	public String member_edit_ok(@RequestParam("file1") MultipartFile mf, 
								 MemberBean member,
								 HttpServletRequest request, 
								 HttpSession session, 
								 Model model) throws Exception {

		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize();		
		
		String path = request.getRealPath("upload");
		System.out.println("path:"+path);
		
		int result=0;		
		String file[] = new String[2];
		
		String newfilename = "";
		
	if(filename != ""){	 // 첨부파일이 전송된 경우		
		
		// 파일 중복문제 해결
		String extension = filename.substring(filename.lastIndexOf("."), filename.length());
		System.out.println("extension:"+extension);
				
		UUID uuid = UUID.randomUUID();
				
		newfilename = uuid.toString() + extension;
		System.out.println("newfilename:"+newfilename);			
		
		StringTokenizer st = new StringTokenizer(filename, ".");
		file[0] = st.nextToken();		// 파일명
		file[1] = st.nextToken();		// 확장자	
		
		if(size > 100000){
			result=1;
			model.addAttribute("result", result);
			
			return "member/uploadResult";
			
		}else if(!file[1].equals("jpg") &&
				 !file[1].equals("gif") &&
				 !file[1].equals("png") &&
				 !file[1].equals("jpeg")	){
			
			result=2;
			model.addAttribute("result", result);
			
			return "member/uploadResult";
		}	
		
	}
		
		if (size > 0) { // 첨부파일이 전송된 경우

			mf.transferTo(new File(path + "/" + newfilename));

		}		
		
		String id = (String) session.getAttribute("id");

		String member_mailid = request.getParameter("member_mailid").trim();
		String member_maildomain = request.getParameter("member_maildomain").trim();
		String member_email = member_mailid + "@" + member_maildomain;

		MemberBean upmem = memberService.userCheck(id);		
		
		if (size > 0 ) { 			// 첨부 파일이 수정되면
			member.setMember_file(newfilename);			
		} else { 					// 첨부파일이 수정되지 않으면
			member.setMember_file(upmem.getMember_file());
		}

		member.setMember_id(id);
		member.setMember_email(member_email);

		memberService.updateMember(member);// 수정 메서드 호출

//		MemberBean upfile = memberService.userCheck(id);
		
		model.addAttribute("member_nickname", upmem.getMember_nickname());
		model.addAttribute("member_file", member.getMember_file());

		return "member/main";
	}

//	/* 회원정보 삭제 폼 */
//	@RequestMapping(value = "/member_del.do")
//	public String member_del(HttpSession session, Model dm) throws Exception {
//
//		String id = (String) session.getAttribute("id");
//		
//		MemberBean deleteM = memberService.userCheck(id);
//		dm.addAttribute("d_id", id);
//		dm.addAttribute("d_name", deleteM.getJoin_name());
//
//		return "member/member_del";
//	}
//
//	/* 회원정보 삭제 완료 */
//	@RequestMapping(value = "/member_del_ok.do", method = RequestMethod.POST)
//	public String member_del_ok(@RequestParam("pwd") String pass, 
//							    @RequestParam("del_cont") String del_cont,
//							    HttpSession session) throws Exception {
//
//		String id = (String) session.getAttribute("id");
//		
//		MemberBean member = this.memberService.userCheck(id);
//
//		if (!member.getJoin_pwd().equals(pass)) {
//
//			return "member/deleteResult";
//			
//		} else {				// 비번이 같은 경우
//			
//			String up = session.getServletContext().getRealPath("upload");
//			String fname = member.getJoin_profile();
//			System.out.println("up:"+up);
//			
//			// 디비에 저장된 기존 이진파일명을 가져옴
//			if (fname != null) {// 기존 이진파일이 존재하면
//				File delFile = new File(up +"/"+fname);
//				delFile.delete();// 기존 이진파일을 삭제
//			}
//			MemberBean delm = new MemberBean();
//			delm.setJoin_id(id);
//			delm.setJoin_delcont(del_cont);
//
//			memberService.deleteMember(delm);// 삭제 메서드 호출
//
//			session.invalidate();	// 세션만료
//
//			return "redirect:member_login.do";
//		}
//	}
//
	// 로그아웃
	@RequestMapping("member_logout.do")
	public String logout(HttpSession session) {
		session.invalidate();

		return "member/member_logout";
	}

// }


}
