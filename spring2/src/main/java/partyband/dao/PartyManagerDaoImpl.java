package partyband.dao;

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
}
