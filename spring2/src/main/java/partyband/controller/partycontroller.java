package partyband.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import partyband.model.MemberBean;
import partyband.model.partybean;
import partyband.service.MemberServiceImpl;
import partyband.service.partyservice;

@Controller
public class partycontroller
{
	@Autowired
	private partyservice partyservice;
	@Autowired
	private HttpSession session;
	@Autowired
	private MemberServiceImpl memberservice;
	
	@RequestMapping("nomal_login.do")
	public String nomal_login(HttpServletRequest request) throws Exception 
	{
		session = request.getSession();
		
		MemberBean test_member = memberservice.userCheck("test");
		session.setAttribute("member", test_member);
		return "redirect:partyband.do";
	}
	
	@RequestMapping("admin_login.do")
	public String admin_login(HttpServletRequest request) throws Exception 
	{
		session = request.getSession();
		
		String id = "admin";
		session.setAttribute("sessionId", id);
		
		return "redirect:partyband.do";
	}
	
	@RequestMapping("test_logout.do")
	public String test_logout(HttpServletRequest request) throws Exception
	{
		session = request.getSession();
		
		session.invalidate();
		
		return "redirect:partyband.do";
	}

	@RequestMapping("getout.do")
	public String getout() 
	{
		return "party/getout";
	}

	@RequestMapping("partyband.do")
	public String boardform(HttpServletRequest request, Model model) throws Exception 
	{
		List<partybean> partylist = new ArrayList<partybean>();

		int page = 1;
		int limit = 8;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		partylist = partyservice.getPartyList(page); // 화면에 출력될 파티방 목록 저장

		int listcount = partyservice.getListCount();

		int maxpage = (int) ((double) listcount / limit + 0.95); // 총 페이지 수.
		int startpage = (((int) ((double) page / 8 + 0.9)) - 1) * 8 + 1; // 메인에 보여줄 시작 페이지 수
		int endpage = maxpage; // 메인에 보여줄 마지막 페이지 수

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		model.addAttribute("page", page);
		model.addAttribute("partylist", partylist);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);

		return "party/partymain";
	}

	/* 파티방 생성폼으로 이동 */
	@RequestMapping("party_create.do")
	public String party_create() 
	{
		return "party/partycreate";
	}

	/* 파티방 내용 저장 */	
	@RequestMapping("party_create_ok.do") 
	public String party_create_ok(partybean party, String party_id) throws Exception 
	{  
		party.setParty_id(party_id); 
		partyservice.insert(party); 
		
		return "redirect:partyband.do"; 
	}
	
	/* 파티방 상세보기 */
	@RequestMapping("party_detail.do")
	public String party_cont(int party_no, int page, Model model) throws Exception
	{
		partybean party = partyservice.party_cont(party_no);
		String party_new_content = party.getParty_content().replace("\n", "<br>");
		party.setParty_content(party_new_content);

		model.addAttribute("party", party);
		model.addAttribute("page", page);

		return "party/partydetail";
	}
	
	/*파티방 참가 신청*/
	@RequestMapping("partyjoin.do")
	public String partyjoin(int party_no, int page, Model model) throws Exception
	{
		partyservice.partyjoin(party_no);
		
		model.addAttribute("page",page);
		model.addAttribute("party_no",party_no);
		return "redirect:party_detail.do";
	}
	
	/*비밀 번호 확인 폼 이동*/
	@RequestMapping("partyeditform.do")
	public String partyeditform(int page, String member_id, int party_no, Model model)
	{
		model.addAttribute("page", page);
		model.addAttribute("member_id", member_id);
		model.addAttribute("party_no", party_no);
		
		return "party/partyeditpwcheck";
	}
	
	/*수정을 위한 비밀 번호 확인*/
	@RequestMapping("partypwcheck.do")
	public String partyedit(int page, String member_id, String input_member_passwd,int party_no, Model model) throws Exception
	{
		String orign_member_passwd = partyservice.pwcheck(member_id);
		
		if(!input_member_passwd.equals(orign_member_passwd))
		{
			return "redirect:noaccess.do";
		}
		model.addAttribute("page", page);
		model.addAttribute("member_id", member_id);
		model.addAttribute("party_no", party_no);		
		
		return "party/partyedit";
	}
	
	/*비밀번호 확인시 틀릴 때*/
	@RequestMapping("noaccess.do")
	public boolean noaccess(HttpServletResponse response) throws Exception
	{
		response.setContentType("text/html; charset=utf-8");
        PrintWriter w = response.getWriter();

        String msg = "비밀번호가 일치하지 않습니다.";
        w.write("<script>alert('"+msg+"');history.back();</script>");
        w.flush();
        w.close();
        
        return false;
	}
	
	/*파티방 수정*/
	@RequestMapping("partyedit.do")
	@ResponseBody
	public boolean partyedit(partybean party, int party_no, HttpServletResponse response) throws Exception
	{
		System.out.println("xml넘어가기전 party_no = " + party_no);
		partybean update_party = partyservice.party_cont(party_no);
		System.out.println("원래 파티방 제목 = " + update_party.getParty_subject());
		System.out.println("바꿀 파티방 제목 = " + party.getParty_subject());
		
		update_party.setParty_subject(party.getParty_subject());
		System.out.println("바뀐 파티방 제목 = " + update_party.getParty_subject());
		update_party.setParty_address(party.getParty_address());
		update_party.setParty_gender(party.getParty_gender());
		update_party.setParty_enddate(party.getParty_enddate());
		update_party.setParty_max_count(party.getParty_max_count());
		update_party.setParty_content(party.getParty_content());
		update_party.setParty_age(party.getParty_age());
		
		partyservice.partyedit(update_party);
		
		response.setContentType("text/html; charset=utf-8");
        PrintWriter w = response.getWriter();

        String msg = "글 수정 성공";
        String url = "partyband.do";
        w.write("<script>alert('"+msg+"');location='"+url+"';</script>");
        w.flush();
        w.close();
        
        return true;
	}
}
