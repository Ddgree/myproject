package partyband.service;

import java.util.List;

import partyband.model.ReBoardBean;

public interface ReplyService {

	// 댓글 조회
	public List<ReBoardBean> list(int board_no) throws Exception;

	// 댓글 조회
	public void write(ReBoardBean reboard) throws Exception;

	// 댓글 수정
	public void modify(ReBoardBean reboard) throws Exception;

	// 댓글 삭제
	public void delete(int reboard_rno) throws Exception;
	
}
