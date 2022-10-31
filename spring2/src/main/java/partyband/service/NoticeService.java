package partyband.service;

import java.util.List;

import partyband.model.Notice;

public interface NoticeService {

public void insert(Notice notice) throws Exception;
	
	public void hit(int notice_no) throws Exception;

	public Notice notice_cont(int notice_no) throws Exception;

	public void edit(Notice notice) throws Exception;

	public void del_ok(int notice_no) throws Exception;

	public int getListCount() throws Exception;
	
	public List getNoticeList(int page) throws Exception;
}
