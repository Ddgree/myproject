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
	  @RequestMapping("reboard_list.do") 
	  public String replylist(int board_no, Model model) throws Exception { 
		  System.out.println("댓글 컨트롤러 진입");
		  BoardBean board = bs.read(board_no); 
		  List<ReBoardBean> rlist = service.list(board_no);
		  model.addAttribute("rlist", rlist); 
		  model.addAttribute("board", board); 
		  
		  return "board/reboard_list"; 
	  }
	 
	// 댓글 수정
	@RequestMapping("repUpdate.do")
	public String repUpdate(ReBoardBean reboard, Model model, int reboard_bno) throws Exception {
		String ncontent="";
		System.out.println("댓글 수정 컨트롤러 진입"+reboard.getReboard_content().substring(0, 5));
		if(reboard.getReboard_content().substring(0, 5).equals("[수정됨]")) {
			ncontent = reboard.getReboard_content().replace("[수정됨]", "");
			reboard.setReboard_content(ncontent);
		}
		ncontent = "[수정됨] "+reboard.getReboard_content();
		reboard.setReboard_content(ncontent);
		service.modify(reboard);
		
		return "redirect:/reboard_list.do?board_no="+reboard_bno;
	}
	// 댓글 삭제
	@RequestMapping("repDelete.do")
	public String delete(int reboard_bno, int reboard_rno, Model model) throws Exception {
		System.out.println("댓글 삭제 컨트롤러 진입");
		service.delete(reboard_rno);
		return "redirect:/reboard_list.do?board_no="+reboard_bno;
	}
	
	// 댓글 작성
	@RequestMapping("reply_write.do")
	public String write(ReBoardBean reboard, int board_no, int page) throws Exception {
		reboard.setReboard_bno(board_no);
		service.write(reboard);
	    
	    return "redirect:/board_content.do?board_no=" + reboard.getReboard_bno()+"&page="+page;
	}
}
