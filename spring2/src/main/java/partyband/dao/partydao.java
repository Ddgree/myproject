package partyband.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import partyband.model.partybean;

@Repository
public class partydao 
{
	@Autowired
	private SqlSession sqlSession;
	
	/* 작성된 파티방 보기  */
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
	
	/* 파티방 총 개수 */
	public int getListCount() 
	{
		int count = ((Integer)sqlSession.selectOne("partyns.party_count"));
		return count;
	}

	public void partyinsert(partybean party)
	{
		sqlSession.insert("partyns.party_insert", party);
	}

	public void partyjoin(int party_no)
	{
		sqlSession.update("partyns.party_join",party_no);
	}

	public String pwcheck(String member_id)
	{
		return sqlSession.selectOne("partyns.pw_checek", member_id);
	}

	public void partyedit(partybean party) 
	{
		sqlSession.update("partyns.party_edit",party);
	}

	public void partydel(int party_no) 
	{
		sqlSession.delete("partyns.party_delete",party_no);
	}
}
