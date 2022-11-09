package partyband.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import partyband.dao.MemberDAOImpl;
import partyband.model.MemberBean;
import partyband.model.partybean;


@Service
public class MemberServiceImpl {
	@Autowired
	private MemberDAOImpl memberDao;
	
	public int checkMemberId(String id) throws Exception{
		return memberDao.checkMemberId(id);
	}
	
	public int checkMembernickname(String nick) throws Exception{
		return memberDao.checkMembernickname(nick);
	}
	
	public MemberBean findid(MemberBean m)throws Exception {
		return memberDao.findid(m);
	}
	
	public MemberBean findpwd(MemberBean m)throws Exception {
		return memberDao.findpwd(m);
	}
	
	@Transactional
	public void insertMember(MemberBean member) throws Exception{
		memberDao.insertMember(member);
	}
	
	public MemberBean userCheck(String id) throws Exception{
		return memberDao.userCheck(id);		
	}
	
	public MemberBean pwCheck(String editpw) throws Exception{
		return memberDao.pwCheck(editpw);		
	}
	
	public void updateMember(MemberBean member) throws Exception{
		memberDao.updateMember(member);
	}
	
	public partybean findparty(String findparty)throws Exception {
		return memberDao.findparty(findparty);
	}
	
	public void deleteMember(MemberBean deletemember) throws Exception{
		memberDao.deleteMember(deletemember);
	}
	
	public List<MemberBean> dropid()throws Exception {
		return memberDao.dropid();
	}
	
	public List<partybean> joinparty(String member_id)throws Exception
	{
		return memberDao.joinparty(member_id);
	}

	public String deleteboard(String member_id) 
	{
		return memberDao.deleteboard(member_id);
	}
}
