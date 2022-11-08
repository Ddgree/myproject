package partyband.dao;

import java.util.List;

import partyband.model.partybean;

public interface PartyDao
{
	
	/* 파티방 번호로 파티방 검색  */
	public partybean getPartyCont(int party_no) throws Exception;
	
	
	/* 파티방 목록  */
	public List<partybean> getPartyList(int page);
	
	/* 파티방 목록(지역별)  */
	public List<partybean> getPartyList2(int page, String address) throws Exception;
	
	/* 파티방 총 개수 */
	public int getListCount();
	
	/* 파티방 총 개수(지역별) */
	public int getListCount2(String address);

	/* 파티방 저장 */
	public void partyinsert(partybean party);
	
	/* 파티방 참가 신청 */
	public void partyjoin(int party_no);

	/* 비밀번호 확인 */
	public String pwcheck(String member_id);

	/* 파티방 수정 */
	public void partyedit(partybean party);

	/* 파티방 삭제(관리자)*/
	public void partydel(int party_no);
}
