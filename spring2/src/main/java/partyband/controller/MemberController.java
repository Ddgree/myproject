package partyband.controller;

import java.io.File;
import java.io.PrintWriter;
import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import partyband.model.MemberBean;
import partyband.model.PartyManagerBean;
import partyband.model.partybean;
import partyband.service.MemberServiceImpl;
import partyband.service.PartyServiceImpl;

@Controller
public class MemberController {

	@Autowired
	private MemberServiceImpl memberService;
	@Autowired
	private PartyServiceImpl partyservice;

	// ID중복검사 ajax함수로 처리부분
	@RequestMapping(value = "/member_idcheck.do", method = RequestMethod.POST)
	public String member_idcheck(@RequestParam("memid") String id, Model model) throws Exception {
		//System.out.println("id:"+id);
		
		int result = memberService.checkMemberId(id);
		
		model.addAttribute("result", result);
		
		return "member/idcheckResult";
	}
	
	// 닉네임중복검사 ajax함수로 처리부분
	@RequestMapping(value = "/member_nickcheck.do", method = RequestMethod.POST)
	public String member_nickcheck(@RequestParam("memnick") String nick, Model model) throws Exception {
		//System.out.println("nick:"+nick);
			
		int result = memberService.checkMembernickname(nick);
		model.addAttribute("result", result);

		return "member/nickcheckResult";
	}
		
	// 비밀번호 찾기 변경 완료 (인증번호 이메일 전송)
		@RequestMapping(value = "/PwdFindok.do", method = RequestMethod.POST)
		public String pfindok(@ModelAttribute MemberBean pm, HttpServletResponse response, Model model) 
				throws Exception {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();

			MemberBean mb = memberService.findpwd(pm);

			if (mb == null) {// 값이 없는 경우

				return "member/pwdResult";

			} else {

			}
			
		// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "darkopera12@naver.com";
			String hostSMTPpwd = "dnfqkswkd"; // 비밀번호 입력해야함

			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "darkopera12@naver.com";
			String fromName = "관리자";
			String subject = "비밀번호 찾기결과";

		// 받는 사람 E-Mail 주소
		String mail = mb.getMember_email();

			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);				
				email.setSmtpPort(587);  								// 465

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg("<p align = 'center'>비밀번호 찾기 결과</p><br>" + "<div align='center'> 회원님의 비밀번호는 : "
						+ mb.getMember_passwd() + "&nbsp; 입니다.</div>");
				email.send();
			} catch (Exception e) {
				System.out.println(e);
			}

			model.addAttribute("pwdok", "등록된 이메일로 인증번호를 전송하였습니다. <br>이메일을 확인 하세요.");
			return "member/pwd_find";

			}	
	
		// 아이디 찾기 변경 완료 (인증번호 이메일 전송)
		@RequestMapping(value = "/id_find_ok.do", method = RequestMethod.POST)
		public String ifindok(@ModelAttribute MemberBean im, HttpServletResponse response, Model model) 
				throws Exception {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
//			System.out.println("아이디 더블체크");
			MemberBean mb = memberService.findid(im);
			
			if (mb == null) {// 값이 없는 경우

				return "member/idResult";

			} else {
				
			}
			
		// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.naver.com";
			String hostSMTPid = "darkopera12@naver.com";
			String hostSMTPpwd = "dnfqkswkd"; // 비밀번호 입력해야함

			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "darkopera12@naver.com";
			String fromName = "관리자";
			String subject = "아이디 찾기결과";

		// 받는 사람 E-Mail 주소
		String mail = mb.getMember_email();

			try {
				HtmlEmail email = new HtmlEmail();
				email.setDebug(true);
				email.setCharset(charSet);
				email.setSSL(true);
				email.setHostName(hostSMTP);				
				email.setSmtpPort(587);  								// 465

				email.setAuthentication(hostSMTPid, hostSMTPpwd);
				email.setTLS(true);
				email.addTo(mail, charSet);
				email.setFrom(fromEmail, fromName, charSet);
				email.setSubject(subject);
				email.setHtmlMsg("<p align = 'center'>아이디 찾기 결과</p><br>" + "<div align='center'> 회원님의 아이디는 : "
						+ mb.getMember_id() + "&nbsp; 입니다.</div>");
				email.send();
			} catch (Exception e) {
				System.out.println(e);
			}

			model.addAttribute("idok", "등록된 이메일로 아이디를 전송하였습니다."
					+ "이메일을 확인하세요.");
			return "member/id_find";
			}	

	/* 로그인 폼 뷰 */
	@RequestMapping("member_login.do")
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
		//System.out.println("수정 전 비번체크 폼");
		return "member/edit_pwcheck";
	}
	
	/* 아이디찾기 폼 */
	@RequestMapping(value = "/id_find.do")
	public String id_find() {
		return "member/id_find";
	}
	
	/* 비번찾기 폼 */
	@RequestMapping(value = "/pwd_find.do")
	public String pwd_find() {
		return "member/pwd_find";
	}
	
//	/* 탈퇴회원 확인 폼 */
//	@RequestMapping(value = "/drop_id.do")
//	public String drop_id() {
//		return "member/drop_id";
//	}
	
	
	//회원가입 완료
	@RequestMapping(value = "/member_join_ok.do", method = RequestMethod.POST)
	public String member_join_ok(@RequestParam("file1") MultipartFile mf,
								@ModelAttribute MemberBean member,
								HttpServletRequest request,
								Model model)throws Exception{
		
		//System.out.println("가입맵");
		
		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize(); 	// 첨부파일의 크기 (단위:Byte) 

		String path = request.getRealPath("upload");
		int result=0;
		
		String file[] = new String[2];
		
		String newfilename = "";
	
	if(filename != ""){	 // 첨부파일이 전송된 경우	
		
		// 파일 중복문제 해결
		String extension = filename.substring(filename.lastIndexOf("."), filename.length());
		
		UUID uuid = UUID.randomUUID();
		
		newfilename = uuid.toString() + extension;
		
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

		return "member/member_join_ck";
	}
	
	
	/* 로그인 인증 */
	@RequestMapping(value = "/member_login_ok.do", method = RequestMethod.POST)
	public String member_login_ok(@RequestParam("id") String id, 
			                      @RequestParam("pwd") String pwd,
			                      HttpSession session, 
			                      Model model) throws Exception {
		
		int result=0;		
		MemberBean member = memberService.userCheck(id);
		
		if (member == null) {	// 등록되지 않은 회원일때
			
			result = 1;
			model.addAttribute("result", result);
			
			return "member/loginResult";
			

		} else {			// 등록된 회원일때
			if (member.getMember_passwd().equals(pwd)) {// 비번이 같을때

				List<PartyManagerBean> join = new ArrayList<PartyManagerBean>();
				
				join = partyservice.joinlist(id);
				
				List<PartyManagerBean> joinlist = new ArrayList<PartyManagerBean>();
				
				for (PartyManagerBean p: join) 
				{
					joinlist.add(p);
				}
				
				session.setAttribute("joinlist", joinlist);
				session.setAttribute("member", member);

				String member_file = member.getMember_file();

				model.addAttribute("member_file", member_file);

				return "redirect:partyband.do"; 
				
			} else {// 비번이 다를때
				result = 2;
				model.addAttribute("result", result);
				
				return "member/loginResult";				
			}
		}

	}
	
	/* 회원 마이 페이지 */
	@RequestMapping(value = "/member_mypage.do")
	public String member_mypage(HttpSession session, Model m) throws Exception {
		
		//System.out.println("회원 마이페이지");
		
		MemberBean member = (MemberBean)session.getAttribute("member");

		MemberBean mymem = memberService.userCheck(member.getMember_id());
		
		String member_email = mymem.getMember_email();
		StringTokenizer st01 = new StringTokenizer(member_email, "@");
		String member_mailid = st01.nextToken();// 메일 주소 저장
		String member_maildomain = st01.nextToken(); // 도메인 저장

		m.addAttribute("mymem", mymem);
		m.addAttribute("member_mailid", member_mailid);
		m.addAttribute("member_maildomain", member_maildomain);

		return "member/member_mypage";
	}
	
	/*비번체크 완료*/
	@RequestMapping(value = "/edit_pwcheck_ok.do")
	public String edit_pwcheck_ok(@RequestParam("editpw") String editpw,
								  HttpSession session, 
								  Model model)throws Exception{
		
		//System.out.println("비번 체크완료");
		int result=0;		

		MemberBean member = (MemberBean) session.getAttribute("member");
		MemberBean check = memberService.pwCheck(member.getMember_id());

		if (check.getMember_passwd().equals(editpw)) {	// 비번이 같을때
				
			return "member/edit_pwcheck_ok";
				
		} else {// 비번이 다를때
			
			return "member/editCheckResult";
		}
		
	}
	
	/* 회원정보 수정 폼 */
	@RequestMapping(value = "/member_edit.do")
	public String member_edit(HttpSession session, Model m) throws Exception {
		
		//System.out.println("회원정보 수정 폼");
		
		MemberBean member = (MemberBean)session.getAttribute("member");

		MemberBean upmem = memberService.userCheck(member.getMember_id());
		
		String member_email = upmem.getMember_email();
		StringTokenizer st01 = new StringTokenizer(member_email, "@");
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
								 HttpServletRequest request, 
								 MemberBean memberbean,
								 HttpSession session, 
								 Model model) throws Exception {
		
		//System.out.println("회원정보 수정");
		
		String filename = mf.getOriginalFilename();
		int size = (int) mf.getSize();		
		
		String path = request.getRealPath("upload");
		//System.out.println("path:"+path);
		
		int result=0;		
		String file[] = new String[2];
		
		String newfilename = "";
		
	if(filename != ""){	 // 첨부파일이 전송된 경우		
		
		// 파일 중복문제 해결
		String extension = filename.substring(filename.lastIndexOf("."), filename.length());
		//System.out.println("extension:"+extension);
				
		UUID uuid = UUID.randomUUID();
				
		newfilename = uuid.toString() + extension;
		
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
		
		MemberBean member = (MemberBean) session.getAttribute("member");

		String member_mailid = request.getParameter("member_mailid").trim();
		String member_maildomain = request.getParameter("member_maildomain").trim();
		String member_email = member_mailid + "@" + member_maildomain;

		MemberBean upmem = memberService.userCheck(member.getMember_id());		
		
		if (size > 0 ) { 			// 첨부 파일이 수정되면
			memberbean.setMember_file(newfilename);			
		} else { 					// 첨부파일이 수정되지 않으면
			memberbean.setMember_file(upmem.getMember_file());
		}
		
		memberbean.setMember_id(member.getMember_id());
		memberbean.setMember_email(member_email);
		
		memberService.updateMember(memberbean);// 수정 메서드 호출
		
		model.addAttribute("member_nickname", memberbean.getMember_nickname());
		model.addAttribute("member_file", memberbean.getMember_file());

		return "redirect:member_mypage.do";
	}

	/* 회원정보 삭제 폼 */
	@RequestMapping(value = "/member_del.do")
	public String member_del(HttpSession session, Model model) throws Exception {

		MemberBean member = (MemberBean) session.getAttribute("member");
		
		MemberBean deleteM = memberService.userCheck(member.getMember_id());
		
		model.addAttribute("delete_id", deleteM.getMember_id());
		model.addAttribute("delete_name", deleteM.getMember_name());

		return "member/member_del";
	}

	/* 회원정보 삭제 완료 */
	@RequestMapping(value = "/member_del_ok.do", method = RequestMethod.POST)
	public String member_del_ok(@RequestParam("delete_passwd") String delete_passwd, 
							    HttpSession session) throws Exception {
		
		MemberBean member = (MemberBean) session.getAttribute("member");
		
		partybean findparty = memberService.findparty(member.getMember_id());
			if (findparty != null) {	// 파티방장이고 사람이 있을때
				
				//System.out.println("방장 사람있음");
				return "member/findPartyResult";
				
			}else if(findparty == null) {
				//System.out.println("findparty null in");
		
		MemberBean delete = this.memberService.userCheck(member.getMember_id());

		if (!delete.getMember_passwd().equals(delete_passwd)) {

			return "member/deleteResult";
			
		} else {				// 비번이 같은 경우
			
			String upload = session.getServletContext().getRealPath("upload");
			String file = member.getMember_file();
			//System.out.println("up:"+upload);
			
			// 디비에 저장된 기존 이전파일명을 가져옴
			if (file != null) {// 기존 파일이 존재하면
				File delFile = new File(upload +"/"+file);
				delFile.delete();// 기존 파일을 삭제
			}
			MemberBean deletemember = new MemberBean();
			deletemember.setMember_id(member.getMember_id());

			memberService.deleteMember(deletemember);// 삭제 메서드 호출

			session.invalidate();	// 세션만료

			return "member/member_del_ok";
		  }
		}
		return null;
	}

	// 로그아웃
	@RequestMapping("member_logout.do")
	public String logout(HttpSession session) {
		session.invalidate();

		return "member/member_logout"; 
	}
	
	/* 탈퇴회원 페이지 */
	@RequestMapping(value = "/member_drop.do")
	public String member_drop(HttpSession session, Model m) throws Exception {
		
		List<MemberBean> dropmem = memberService.dropid();
		
		m.addAttribute("dropmem", dropmem);
		//System.out.println("탈퇴회원 페이지");

		return "member/drop_id";
	}
	
	/* 참가파티 페이지 */
	@RequestMapping(value = "/member_party.do")
	public String member_party(String member_id,Model m) throws Exception 
	{
		List<partybean> partymem = memberService.joinparty(member_id);
		//System.out.println("파티멤"+partymem);
		m.addAttribute("partymem", partymem);
		//System.out.println("참가파티");

		return "member/joinparty";
	}

// }


}
