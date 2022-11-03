package partyband.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import partyband.dao.MemberDAOImpl;
import partyband.model.MemberBean;


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
	
	public void deleteMember(MemberBean deletemember) throws Exception{
		memberDao.deleteMember(deletemember);
	}
}
