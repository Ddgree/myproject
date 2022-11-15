package partyband.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import partyband.model.ReBoardBean;

@Repository
public class ReplyDaoImpl implements ReplyDao {

	@Autowired
	private SqlSession session;
	@Override
	public List<ReBoardBean> list(int board_no) throws Exception {
		return session.selectList("reply.list", board_no);
	}

	@Override
	public void write(ReBoardBean reboard) throws Exception {
		session.insert("reply.write", reboard);
	}

	@Override
	public void modify(ReBoardBean reboard) throws Exception {
		session.update("reply.modify", reboard);
	}

	@Override
	public void delete(int reboard_rno) throws Exception {
		session.delete("reply.delete", reboard_rno);
	}


}
