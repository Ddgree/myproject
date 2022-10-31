package partyband.dao;

import java.util.List;

import partyband.model.Notice;

public interface NoticeDao {
	
	public void insertNotice(Notice notice) throws Exception;

	public List<Notice> getNoticeList(int page) throws Exception;

	public int getListCount() throws Exception;

	public Notice getNoticeCont(int notice_no) throws Exception;

	public void noticeHit(int notice_no) throws Exception;

	public void noticeEdit(Notice notice) throws Exception;

	public void noticeDelete(int notice_num) throws Exception;

}
