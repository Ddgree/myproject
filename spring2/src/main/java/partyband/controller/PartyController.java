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
import partyband.service.PartyServiceImpl;

@Controller
public class PartyController
{
	@Autowired
	private PartyServiceImpl partyservice;
	@Autowired
	private HttpSession session;
	@Autowired
	private MemberServiceImpl memberservice;
	
	@RequestMapping("refresh.do")
	public String refresh()
	{
		partyservice.refresh();
		return "redirect:partyband.do";
	}

	@RequestMapping("partyband.do")
	public String partyband(HttpServletRequest request, Model model) throws Exception 
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
	
	@RequestMapping("end_party_list.do")
	public String end_party_list(HttpServletRequest request, Model model) throws Exception 
	{
		List<partybean> endpartylist = new ArrayList<partybean>();

		int page = 1;
		int limit = 8;

		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}

		endpartylist = partyservice.getendPartyList(page); // 화면에 출력될 파티방 목록 저장

		int listcount = partyservice.getListCount();

		int maxpage = (int) ((double) listcount / limit + 0.95); // 총 페이지 수.
		int startpage = (((int) ((double) page / 8 + 0.9)) - 1) * 8 + 1; // 메인에 보여줄 시작 페이지 수
		int endpage = maxpage; // 메인에 보여줄 마지막 페이지 수

		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;

		model.addAttribute("page", page);
		model.addAttribute("endpartylist", endpartylist);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);

		return "party/partyendlist";
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
	@RequestMapping("pwcheckform.do")
	public String partyeditform(int page, String member_id, int party_no,String stat, Model model)
	{
		model.addAttribute("page", page);
		model.addAttribute("member_id", member_id);
		model.addAttribute("party_no", party_no);
		model.addAttribute("stat", stat);
	
		return "party/partypwcheck";
	}
	
	/*비밀 번호 확인*/
	@RequestMapping("partypwcheck.do")
	public String partyedit(HttpServletResponse response, int page, String member_id, String input_member_passwd,int party_no,String stat, Model model) throws Exception
	{
		String orign_member_passwd = partyservice.pwcheck(member_id);
		
		if(!input_member_passwd.equals(orign_member_passwd))
		{
			response.setContentType("text/html; charset=utf-8");
	        PrintWriter w = response.getWriter();

	        String msg = "비밀번호가 일치하지 않습니다.";
	        w.write("<script>alert('"+msg+"');history.back();</script>");
	        w.flush();
	        w.close();
		}
		else if(stat.equals("edit"))
		{
			model.addAttribute("page", page);
			model.addAttribute("member_id", member_id);
			model.addAttribute("party_no", party_no);		
			
			return "party/partyedit";
		}
		else if(stat.equals("del"))
		{
			partyservice.partydel(party_no);
			
			return "redirect:partyband.do";
		}
		
		return null;
	}
	
	/*파티방 수정*/
	@RequestMapping("partyedit.do")
	public String partyedit(partybean p,int page, HttpServletResponse response) throws Exception
	{
		partyservice.partyedit(p);
		
		return "redirect:party_detail.do?party_no=" + p.getParty_no() + "&page=" + page;
	}
	
	
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

}
