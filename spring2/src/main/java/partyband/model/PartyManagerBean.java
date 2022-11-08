package partyband.model;

public class PartyManagerBean
{
	private String member_id;
	private int party_no;
	private String ishost;
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getParty_no() {
		return party_no;
	}
	public void setParty_no(int party_no) {
		this.party_no = party_no;
	}
	public String getIshost() {
		return ishost;
	}
	public void setIshost(String ishost) {
		this.ishost = ishost;
	}
	
	
}
