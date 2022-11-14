package partyband.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import partyband.dao.BoardDAO;
import partyband.model.BoardBean;

@Service
public class BoardServiceImpl implements BoardService
{
	@Autowired
	private BoardDAO dao;
	
	// 게시글 작성	
	@Override
	public void write(BoardBean board) throws Exception {
		dao.write(board);
	}
	// 게시글 상세보기
	@Override
	public BoardBean read(int board_no) throws Exception {
		return dao.read(board_no);
	}
	// 게시판 목록
	@Override
	public List<BoardBean> list(BoardBean board) throws Exception {
		return dao.list(board);
	}
	// 게시물 갯수
	@Override
	public int getListCount(BoardBean board) throws Exception {
		return dao.getListCount(board);
	}
	// 조회수 증가
	@Override
	public void hit(int board_no) throws Exception {
		dao.hit(board_no);
	}
	// 게시글 수정
	@Override
	public void edit(BoardBean board) throws Exception {
		dao.edit(board);
		
	}
	// 게시글 삭제
	@Override
	public void delete(int board_no) throws Exception {
		dao.delete(board_no);
	}
	
}
