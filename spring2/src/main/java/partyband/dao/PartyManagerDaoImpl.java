package partyband.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import partyband.model.PartyManagerBean;

@Repository
public class PartyManagerDaoImpl 
{
	@Autowired
	private SqlSession sqlSession;

	public void create_insert(PartyManagerBean manager) 
	{
		sqlSession.insert("partymanagerns.insert",manager);
	}

	public void join_insert(PartyManagerBean pm) 
	{
		sqlSession.insert("partymanagerns.insert2",pm);
	}

	public void partyjoincancel(String member_id, int party_no)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("member_id", member_id);
		map.put("party_no", party_no);
		sqlSession.delete("partymanagerns.delete",map);
	}
}
