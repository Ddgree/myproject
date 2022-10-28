package partyband.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import partyband.model.partybean;
import partyband.service.partyservice;

@Controller
public class partycontroller {
	@Autowired
	private partyservice partyservice;
	@Autowired
	private HttpSession session;

	@RequestMapping("dlatl.do")
	public String dlatl(HttpServletRequest request) {
		System.out.println("임시 컨트롤러 도착");
		session = request.getSession();
		String id = "admin";
		session.setAttribute("sessionId", id);
		return "redirect:partyband.do";
	}

	@RequestMapping("getout.do")
	public String getout() {
		return "party/getout";
	}

	@RequestMapping("partyband.do")
	public String boardform(HttpServletRequest request, Model model) throws Exception {
		List<partybean> partylist = new ArrayList<partybean>();
		System.out.println("partyband 컨트롤러 도착");

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
	public String party_create() {
		return "party/partycreate";
	}

	/* 파티방 내용 저장 */
	
	@RequestMapping("party_create_ok.do") 
	public String party_create_ok(@ModelAttribute partybean party, HttpServletRequest request) throws Exception 
	{ 
		session = request.getSession(); 
		party.setParty_id((String)session.getAttribute("sessionId")); 
		partyservice.insert(party); 
		System.out.println("저장 성공!");
		return "party/partymain"; 
	}
	

	/* 파티방 상세보기 */
	@RequestMapping("party_detail.do")
	public String party_cont(
			// @RequestParam("party_id")
			String party_id, Model model) throws Exception {
		System.out.println("id = " + party_id);
		partybean party = partyservice.party_cont(party_id);

		model.addAttribute("party", party);

		return "party/partydetail";
	}
}
