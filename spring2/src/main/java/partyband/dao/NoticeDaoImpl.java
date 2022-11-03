package partyband.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import partyband.model.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	@Autowired
	private SqlSessionTemplate sqlSession;

	/* 게시판 저장 */
	public void insertNotice(Notice notice) throws Exception {
		sqlSession.insert("Test.notice_insert", notice);
	}

	
	/* 게시물 목록  */
//	public List<Notice> getNoticeList(int page) throws Exception {
//		List<Notice> list = sqlSession.selectList("Test.notice_list", page);
//
//		return list;
//	}

	
	/* 게시판 총 갯수  */
	public int getListCount() throws Exception {
		int count = 0;	
		count = ((Integer) sqlSession.selectOne("Test.notice_count")).intValue();

		return count;
	}

	
	/* 게시판 글내용보기  */
	public Notice getNoticeCont(int notice_no) throws Exception {
		return (Notice) sqlSession.selectOne("Test.notice_cont",notice_no);
	}

	
	/* 게시판 조회수 증가  */
	public void noticeHit(int notice_no) throws Exception {
		sqlSession.update("Test.notice_hit", notice_no);		
	}

	
	/* 게시물 수정  */
	public void noticeEdit(Notice notice) throws Exception {
		sqlSession.update("Test.notice_edit", notice);		
	}

	
	/* 게시물 삭제  */
	public void noticeDelete(int notice_no) throws Exception {
		sqlSession.delete("Test.notice_del", notice_no);				
	}
	
//	public List<Board> list(int startRow, int endRow) {
	public List<Notice> list(Notice notice) {
/*		HashMap<String, Integer> hm=new HashMap<String, Integer>();
		hm.put("startRow",startRow);
		hm.put("endRow",endRow);*/
		return sqlSession.selectList("Test.list",notice);
	}
	
	public int getTotal(Notice notice) {
		return sqlSession.selectOne("Test.getTotal",notice);
	}
	
}