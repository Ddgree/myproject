package partyband.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import partyband.model.MemberBean;
import partyband.model.partybean;

@Repository
public class MemberDAOImpl {
	
	@Autowired
	private SqlSession sqlSession;	


	/***** 아이디 중복 체크 *****/
//	@Transactional
	public int checkMemberId(String id) throws Exception {
		int re=0;	// 사용 가능한 ID
		MemberBean mb = sqlSession.selectOne("login_check2", id);
		if (mb != null) {
			re = 1; 	// 중복id
		}else if(id.equals("admin")) {
			re = 3;
		}else if(mb == null){
			re = -1;	// 사용 가능한 ID	
		}
		return re;
	}
	
	/*****닉네임 중복 체크*****/
	public int checkMembernickname(String nick) throws Exception {
		int re = -1;	// 사용 가능한 닉네임
		MemberBean mb = sqlSession.selectOne("nick_check", nick);
		if (mb != null)
			re = 1; 	// 중복닉네임
		return re;
	}
	
	/* 아이디 검색 */
//	@Transactional
	public MemberBean findid(MemberBean pm) throws Exception {
		return sqlSession.selectOne("id_find", pm);
	}
	
	/* 비번 검색 */
//	@Transactional
	public MemberBean findpwd(MemberBean pm) throws Exception {
		return sqlSession.selectOne("pwd_find", pm);
	}

	/* 회원저장 */
//	@Transactional
	public void insertMember(MemberBean m) throws Exception {
		sqlSession.insert("member_join", m);
	}

	/* 로그인 인증 체크 */
//	@Transactional
	public MemberBean userCheck(String id) throws Exception {
		return sqlSession.selectOne("login_check", id);
	}
	
	/*비번 인증 체크*/
	public MemberBean pwCheck(String editpw) throws Exception {
		return sqlSession.selectOne("pw_check", editpw);
	}

	/* 회원수정 */
//	@Transactional
	public void updateMember(MemberBean member) throws Exception {
		sqlSession.update("member_edit", member);
	}
	
	/* 탈퇴 전 파티방 검색 */
//	@Transactional
	public partybean findparty(String findparty) throws Exception {
		partybean result = sqlSession.selectOne("find_party", findparty);
		
		return result;
	}

	/* 회원삭제 */
//	@Transactional
	public void deleteMember(MemberBean deletemember) throws Exception {
		sqlSession.update("member_delete", deletemember);
	}
	
	/* 탈퇴아이디 검색 */
//	@Transactional
	public List<MemberBean> dropid() throws Exception {
		return sqlSession.selectList("id_drop");
	}
	
	/* 참가파티방 검색 */
//	@Transactional
	public List<partybean> joinparty(String member_id) throws Exception 
	{
		return sqlSession.selectList("joinparty",member_id);
	}

	public String deleteboard(String member_id) 
	{
		return sqlSession.selectOne("memberns.findpasswd", member_id);
	}
}





