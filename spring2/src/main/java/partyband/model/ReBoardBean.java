package partyband.model;

import java.sql.Date;

public class ReBoardBean {

	private String reboard_id;
	private int reboard_bno;
	private int reboard_rno;
	private String reboard_content;
	private Date reboard_date;
	
	public String getReboard_id() {
		return reboard_id;
	}
	public void setReboard_id(String reboard_id) {
		this.reboard_id = reboard_id;
	}
	public int getReboard_bno() {
		return reboard_bno;
	}
	public void setReboard_bno(int reboard_bno) {
		this.reboard_bno = reboard_bno;
	}
	public int getReboard_rno() {
		return reboard_rno;
	}
	public void setReboard_rno(int reboard_rno) {
		this.reboard_rno = reboard_rno;
	}
	public String getReboard_content() {
		return reboard_content;
	}
	public void setReboard_content(String reboard_content) {
		this.reboard_content = reboard_content;
	}
	public Date getReboard_date() {
		return reboard_date;
	}
	public void setReboard_date(Date reboard_date) {
		this.reboard_date = reboard_date;
	}
	
	
}
