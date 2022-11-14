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
	public List<ReBoardBean> list(int reboard_bno) throws Exception {
		return session.selectList("reply.list", reboard_bno);
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

	@Override
	public List<ReBoardBean> reboardlist(int board_no) {
		List<ReBoardBean> slist = session.selectList("reply.slist", board_no);
		return slist;
	}

}
