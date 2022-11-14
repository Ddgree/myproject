package partyband.dao;

import java.util.List;

import partyband.model.BoardBean;

public interface BoardDAO {

	// 게시글 작성
	public void write(BoardBean board) throws Exception;

	// 게시글 읽기
	public BoardBean read(int board_no) throws Exception;
	
	// 게시판 목록
	public List<BoardBean> list(BoardBean board) throws Exception;

	// 게시물 갯수
	public int getListCount(BoardBean board) throws Exception;

	// 조회수 증가
	public void hit(int board_no) throws Exception;

	// 게시글 수정
	public void edit(BoardBean board) throws Exception;
	
	// 게시글 삭제
	public void delete(int board_no) throws Exception;
	
	
}
