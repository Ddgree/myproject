package partyband.dao;

import java.util.List;

import partyband.model.ReBoardBean;

public interface ReplyDao {

	// 댓글 조회
	public List<ReBoardBean> list(int reboard_bno) throws Exception;

	// 댓글 조회
	public void write(ReBoardBean reboard) throws Exception;

	// 댓글 수정
	public void modify(ReBoardBean reboard) throws Exception;

	// 댓글 삭제
	public void delete(ReBoardBean reboard) throws Exception;
}
