package partyband.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import partyband.dao.NoticeDao;
import partyband.model.Notice;

@Service
public class NoticeServiceImpl implements NoticeService 
{
	@Autowired
	private NoticeDao nd;
	
	/* 게시판 저장 */
	public void insert(Notice notice) throws Exception
	{
		nd.insertNotice(notice);
	}
	
	// 게시물 갯수	
	@Override
	public int getListCount() throws Exception 
	{		
		return nd.getListCount();
	}

	// 게시판 목록
	@Override
//	public List getNoticeList(int page) throws Exception 
//	{
//		// TODO Auto-generated method stub
//		return nd.getNoticeList(page);
//	}

	/* 조회수 증가 */
	public void hit(int notice_no) throws Exception
	{
		nd.noticeHit(notice_no); // 조회수 증가
	}
	

	/* 상세정보 */
	public Notice notice_cont(int notice_no) throws Exception
	{
		Notice notice = nd.getNoticeCont(notice_no);

		return notice;
	}

	
	/* 게시판 수정 */
	public void edit(Notice notice) throws Exception {			
		nd.noticeEdit(notice);
	}
	

	/* 게시판 삭제 */
	public void del_ok(int notice_no) throws Exception
	{			
		nd.noticeDelete(notice_no);		
	}
	
	// public List<Board> list(int startRow, int endRow) {
	public List<Notice> list(Notice notice) 
	{
		return nd.list(notice);
	//	return bd.list(startRow, endRow);
	}
			
	public int getTotal(Notice notice) 
	{
		return nd.getTotal(notice);
	}
}
