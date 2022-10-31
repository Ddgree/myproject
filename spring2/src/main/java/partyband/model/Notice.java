package partyband.model;

import java.sql.Date;

public class Notice {

	private int notice_no;/* 게시글 번호 */
	private String notice_subject; /* 제목 */
	private String notice_content; /* 내용 */
	private Date notice_date; /* 날짜 */
	private int notice_readcount; /* 조회수 */
//	private int notice_ref; /* 조회수 */
//	private int notice_level; /* 조회수 */
//	private int notice_step; /* 조회수 */
	private String notice_file; /* 첨부파일 */
	private String notice_admin_id; /* 관리자아이디 */
	private String admin_passwd;
		
	public int getNotice_no() {
		return notice_no;
	}
	public void setNotice_no(int notice_no) {
		this.notice_no = notice_no;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_content() {
		return notice_content;
	}
	public void setNotice_content(String notice_content) {
		this.notice_content = notice_content;
	}
	public Date getNotice_date() {
		return notice_date;
	}
	public void setNotice_date(Date notice_date) {
		this.notice_date = notice_date;
	}
	public int getNotice_readcount() {
		return notice_readcount;
	}
	public void setNotice_readcount(int notice_readcount) {
		this.notice_readcount = notice_readcount;
	}
	public String getNotice_file() {
		return notice_file;
	}
	public void setNotice_file(String notice_file) {
		this.notice_file = notice_file;
	}
	public String getNotice_admin_id() {
		return notice_admin_id;
	}
	public void setNotice_admin_id(String notice_admin_id) {
		this.notice_admin_id = notice_admin_id;
	}
	public String getAdmin_passwd() {
		return admin_passwd;
	}
	public void setAdmin_passwd(String admin_passwd) {
		this.admin_passwd = admin_passwd;
	}
	
}
