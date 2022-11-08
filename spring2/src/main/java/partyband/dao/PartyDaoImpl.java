package partyband.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import partyband.model.PartyManagerBean;
import partyband.model.partybean;

@Repository
public class PartyDaoImpl
{
	@Autowired
	private SqlSession sqlSession;
	
	/* 날짜 지난 파티방 종료 시킴*/
	public void refresh() 
	{
		sqlSession.update("partyns.party_refresh");
	}

	public int getEndListCount() 
	{
		return sqlSession.selectOne("partyns.party_end_list_count");
	}
	
	/* 파티방 번호로 파티방 검색  */
	public partybean getPartyCont(int party_no) throws Exception 
	{
		return (partybean) sqlSession.selectOne("partyns.party_cont",party_no);
	}
	
	/* 파티방 목록  */
	public List<partybean> getPartyList(int page) 
	{
		List<partybean> list = sqlSession.selectList("partyns.party_list", page);
		return list;
	}
	public List<partybean> getPartyList2(int page, String address) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("page", page);
		map.put("address", address);
		List<partybean> list = sqlSession.selectList("partyns.party_list2", map);
		
		return list;
	}
	
	/* 종료된 파티방 목록*/
	public List<partybean> getEndPartyList(int page) 
	{
		List<partybean> list = sqlSession.selectList("partyns.party_endlist", page);
		return list;
	}
	
	/* 파티방 총 개수 */
	public int getListCount() 
	{
		int count = ((Integer)sqlSession.selectOne("partyns.party_count"));
		return count;
	}

	/* 파티방 총 개수 (지역별)*/
	public int getListCount2(String address) {
		int count = ((Integer)sqlSession.selectOne("partyns.party_count2",address));
		return count;
	}
	
	/* 파티방 저장 */
	public void partyinsert(partybean party)
	{
		sqlSession.insert("partyns.party_insert", party);
	}

	/* 파티방 참가 신청 */
	public void partyjoin(int party_no)
	{
		sqlSession.update("partyns.party_join",party_no);
	}

	/* 비밀번호 확인 */
	public String pwcheck(String member_id)
	{
		return sqlSession.selectOne("partyns.pw_checek", member_id);
	}

	/* 파티방 수정 */
	public void partyedit(partybean party) 
	{
		sqlSession.update("partyns.party_edit",party);
	}
	
	/* 파티방 삭제(관리자)*/
	public void partydel(int party_no) 
	{
		sqlSession.delete("partyns.party_delete",party_no);
	}

	public int findpartyno()
	{
		return sqlSession.selectOne("partyns.findpartyno");
	}

	public List<PartyManagerBean> joinlist(String member_id) 
	{
		List<PartyManagerBean> list = sqlSession.selectList("partymanagerns.joinlist",member_id);
		return list;
	}
}
