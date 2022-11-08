package partyband.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import partyband.model.PartyManagerBean;
import partyband.model.partybean;
import partyband.dao.PartyDaoImpl;

@Service
public class PartyServiceImpl 
{
	@Autowired
	private PartyDaoImpl partydao;
	
	/* 날짜 지난 파티방 종료 시킴*/
	public void refresh() 
	{
		partydao.refresh();
	}
	
	public int getEndListCount()
	{
		return partydao.getEndListCount();
	}
	
	/* 상세정보 */
	public partybean party_cont(int party_no) throws Exception 
	{
		partybean party = partydao.getPartyCont(party_no);

		return party;
	}

	public List<partybean> getPartyList(int page) throws Exception
	{
		return partydao.getPartyList(page);
	}
	
	public List<partybean> getPartyList2(int page, String address) throws Exception {
		return partydao.getPartyList2(page,address);

	}

	public List<partybean> getEndPartyList(int page)
	{
		return partydao.getEndPartyList(page);
	}

	public int getListCount()
	{
		return partydao.getListCount();
	}
	
	public int getListCount2(String address) {
		return partydao.getListCount2(address);
	}
	
	public void insert(partybean party) 
	{
		partydao.partyinsert(party);
	}

	public void partyjoin(int party_no) 
	{
		partydao.partyjoin(party_no);
	}

	public String pwcheck(String member_id)
	{
		return partydao.pwcheck(member_id);
	}

	public void partyedit(partybean party)
	{
		partydao.partyedit(party);
	}

	public void partydel(int party_no) 
	{
		partydao.partydel(party_no);
	}

	public int findpartyno() 
	{
		return partydao.findpartyno();
	}

	public List<PartyManagerBean> joinlist(String member_id)
	{
		return partydao.joinlist(member_id);
	}

	public void partyjoincancel(int party_no) 
	{
		partydao.partyjoincancel(party_no);
	}

}
