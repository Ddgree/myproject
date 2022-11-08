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
		System.out.println("reboard:"+reboard.getReboard_bno());
		System.out.println("reboard:"+reboard.getReboard_content());
		System.out.println("reboard:"+reboard.getReboard_id());
		session.insert("reply.write", reboard);
		System.out.println("XML 갔다옴");
	}

	@Override
	public void modify(ReBoardBean reboard) throws Exception {
		session.update("reply.modify", reboard);
	}

	@Override
	public void delete(ReBoardBean reboard) throws Exception {
		session.delete("reply.delete", reboard);
	}

}
