package partyband.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import partyband.model.partybean;
import partyband.dao.partydao;

@Service
public class PartyService
{
	@Autowired
	private partydao partydao;
	
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

	public int getListCount()
	{
		return partydao.getListCount();
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
}
