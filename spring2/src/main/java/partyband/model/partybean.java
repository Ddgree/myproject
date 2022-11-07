package partyband.model;

import java.util.Date;

public class partybean 
{
	private int party_no;
	private String party_subject;
	private String party_address;
	private String party_content;
	private String party_gender;
	private String party_age;
	private Date party_date;
	private String party_enddate;
	private int party_count;
	private int party_max_count;
	private String party_id;
	private String delok;
	
	public int getParty_no() {
		return party_no;
	}
	public void setParty_no(int party_no) {
		this.party_no = party_no;
	}
	public String getParty_subject() {
		return party_subject;
	}
	public void setParty_subject(String party_subject) {
		this.party_subject = party_subject;
	}
	public String getParty_address() {
		return party_address;
	}
	public void setParty_address(String party_address) {
		this.party_address = party_address;
	}
	public String getParty_content() {
		return party_content;
	}
	public void setParty_content(String party_content) {
		this.party_content = party_content;
	}
	public String getParty_gender() {
		return party_gender;
	}
	public void setParty_gender(String party_gender) {
		this.party_gender = party_gender;
	}
	public String getParty_age() {
		return party_age;
	}
	public void setParty_age(String party_age) {
		this.party_age = party_age;
	}
	public Date getParty_date() {
		return party_date;
	}
	public void setParty_date(Date party_date) {
		this.party_date = party_date;
	}
	public String getParty_enddate() {
		return party_enddate;
	}
	public void setParty_enddate(String party_enddate) {
		this.party_enddate = party_enddate;
	}
	public int getParty_count() {
		return party_count;
	}
	public void setParty_count(int party_count) {
		this.party_count = party_count;
	}
	public int getParty_max_count() {
		return party_max_count;
	}
	public void setParty_max_count(int party_max_count) {
		this.party_max_count = party_max_count;
	}
	public String getParty_id() {
		return party_id;
	}
	public void setParty_id(String party_id) {
		this.party_id = party_id;
	}
	
	public String getDelok() {
		return delok;
	}
	public void setDelok(String delok) {
		this.delok = delok;
	}

	
}
