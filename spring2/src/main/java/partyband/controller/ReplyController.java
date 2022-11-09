package partyband.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import partyband.model.ReBoardBean;
import partyband.service.ReplyService;

@Controller
public class ReplyController {

	@Autowired
	private ReplyService service;
	
	// 댓글 조회
	
	// 댓글 작성
	@RequestMapping("reply_write.do")
	public String write(ReBoardBean reboard, int board_no, int page) throws Exception {
		reboard.setReboard_bno(board_no);
		service.write(reboard);
	    
	    return "redirect:/board_content.do?board_no=" + reboard.getReboard_bno()+"&page="+page;
	}
	
	
}
