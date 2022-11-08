package partyband.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import partyband.dao.PartyManagerDaoImpl;
import partyband.model.PartyManagerBean;

@Service
public class PartyManagerServiceImpl 
{
	@Autowired
	private PartyManagerDaoImpl partymanager;

	public void create_insert(PartyManagerBean manager) 
	{
		partymanager.create_insert(manager);
	}

	public void join_insert(PartyManagerBean pm)
	{
		partymanager.join_insert(pm);
	}

	public void partyjoincancel(String member_id, int party_no) 
	{
		partymanager.partyjoincancel(member_id,party_no);
	}
}
