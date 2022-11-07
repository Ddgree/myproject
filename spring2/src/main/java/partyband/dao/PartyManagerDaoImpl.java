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
		System.out.println("dao, member_id : " + manager.getMember_id());
		System.out.println("dao, party_no : " + manager.getParty_no());
		System.out.println("dao, ishost : " + manager.getIshost());
		sqlSession.insert("partymanagerns.insert",manager);
		System.out.println("xml 종료, member_id : " + manager.getMember_id());
		System.out.println("xml 종료, party_no : " + manager.getParty_no());
		System.out.println("xml 종료, ishost : " + manager.getIshost());
	}
}
