package partyband.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import partyband.model.BoardBean;
import partyband.model.ReBoardBean;
import partyband.service.BoardService;
import partyband.service.ReplyService;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService service;
	@Autowired
	private BoardService bs;
	
	  // 댓글 조회
	  @RequestMapping("/reboard_list/num/{board_no}") 
	  public String replylist(@PathVariable int num, Model model) { 
		  System.out.println("댓글 컨트롤러 진입");
		  BoardBean board = bs.select(num); 
		  List<ReBoardBean> rlist = service.reboardlist(num);
		  model.addAttribute("rlist", rlist); 
		  model.addAttribute("board", board); 
		  return "reboard_list"; 
	  }
	 
	// 댓글 수정
	@RequestMapping("/repUpdate")
	public String repUpdate(ReBoardBean reboard, Model model) throws Exception {
		service.modify(reboard);
		return "redirect:reboard_list/board_no/" + reboard.getReboard_bno();
	}
	// 댓글 삭제
	@RequestMapping("/repDelete")
	public String delete(ReBoardBean reboard, Model model) throws Exception {
		service.delete(reboard.getReboard_rno());
		return "redirect:reboard_list/board_no/" + reboard.getReboard_bno();
	}
	
	// 댓글 작성
	@RequestMapping("reply_write.do")
	public String write(ReBoardBean reboard, int board_no, int page) throws Exception {
		reboard.setReboard_bno(board_no);
		service.write(reboard);
	    
	    return "redirect:/board_content.do?board_no=" + reboard.getReboard_bno()+"&page="+page;
	}
}
