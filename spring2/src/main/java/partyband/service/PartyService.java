package partyband.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import partyband.model.partybean;

public interface PartyService 
{
	/* 메인 페이지에 나오는 파티방 리스트 */
	public List<partybean> getPartyList(int page) throws Exception;
	
	/* 파티방 상세정보 */
	public partybean party_cont(int party_no) throws Exception;
	
	/* 메인 페이지에 나오는 파티방 리스트 (지역별)*/
	public List<partybean> getPartyList2(int page,String address) throws Exception;
	
	/* 저장된 파티방 총 개수 */
	public int getListCount();
	
	/* 저장된 파티방 총 개수(지역별) */
	public int getListCount2(String address);

	/* 파티방 저장 */
	public void insert(partybean party);

	/* 파티방 참가신청 */
	public void partyjoin(int party_no);
	
	/* 비밀 번호 확인*/
	public String pwcheck(String member_id);

	/* 파티방 수정 */
	public void partyedit(partybean party);

	/* 파티방 삭제(관리자) */
	public void partydel(int party_no);
}
