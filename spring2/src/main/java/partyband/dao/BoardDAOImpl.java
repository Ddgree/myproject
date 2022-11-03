package partyband.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import partyband.model.BoardBean;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Autowired
	private SqlSession sqlSession;
	
	// 게시글 쓰기
	@Override
	public void write(BoardBean board) throws Exception {
		sqlSession.insert("board.insert", board);
	}
	// 게시판 목록
	@Override
	public List<BoardBean> list(BoardBean board) throws Exception {
		return sqlSession.selectList("board.list", board);
		
	}
	// 게시글 상세보기
	@Override
	public BoardBean read(int board_no) throws Exception {
		return sqlSession.selectOne("board.read", board_no);
	}
	// 게시물 총 갯수
	@Override
	public int getListCount(BoardBean board) throws Exception {
		return sqlSession.selectOne("board.count", board);
	}
	// 게시판 조회수 증가 
	public void hit(int board_no) throws Exception {
		sqlSession.update("board.hit", board_no);		
	}
	// 게시글 수정
	public void edit(BoardBean board) throws Exception {
		sqlSession.update("board.edit", board);
	}
	// 게시글 삭제
	@Override
	public void delete(int board_no) throws Exception {
		sqlSession.delete("board.delete", board_no);
	}

}
