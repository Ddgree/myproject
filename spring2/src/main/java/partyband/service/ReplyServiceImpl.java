package partyband.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import partyband.dao.ReplyDao;
import partyband.model.ReBoardBean;

@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyDao dao;
	
	@Override
	public List<ReBoardBean> list(int reboard_bno) throws Exception {
		return dao.list(reboard_bno);
	}

	@Override
	public void write(ReBoardBean reboard) throws Exception {
		dao.write(reboard);
	}

	@Override
	public void modify(ReBoardBean reboard) throws Exception {
		dao.modify(reboard);
	}

	@Override
	public void delete(ReBoardBean reboard) throws Exception {
		dao.delete(reboard);
	}

}
