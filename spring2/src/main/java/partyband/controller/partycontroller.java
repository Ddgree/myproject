package partyband.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import partyband.model.partybean;
import partyband.service.partyservice;

@Controller
public class partycontroller
{
	@Autowired
	partyservice partyservice;
	
	@RequestMapping("partyband.do")
	public String boardform(HttpServletRequest request, Model model) throws Exception
	{
		List<partybean> partylist = new ArrayList<partybean>();
		
		int page = 1;
		int limit = 8;
		
		if(request.getParameter("page") != null)
		{
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		partylist = partyservice.getPartyList(page); // 화면에 출력될 파티방 목록 저장
		
		int listcount = partyservice.getListCount();
		
		int maxpage = (int) ((double) listcount / limit + 0.95); // 총 페이지 수.
		int startpage = (((int) ((double) page / 8 + 0.9)) - 1) * 8 + 1;  // 메인에 보여줄 시작 페이지 수
		int endpage = maxpage;  // 메인에 보여줄 마지막 페이지 수
		
		if (endpage > startpage + 10 - 1)
			endpage = startpage + 10 - 1;
		
		model.addAttribute("page", page);
		model.addAttribute("partylist", partylist);
		model.addAttribute("startpage", startpage);
		model.addAttribute("endpage", endpage);
		model.addAttribute("maxpage", maxpage);
		
		return "party/partymain";
	}
	
	/* 파티방 상세보기 */
	@RequestMapping("party_cont.do")
	public String party_cont(
			//@RequestParam("party_id") 
	String party_id, Model model) throws Exception 
	{
		System.out.println("id = " + party_id);
		partybean party = partyservice.party_cont(party_id);

		model.addAttribute("party", party);

		return "party/partydetail";
	}
}
