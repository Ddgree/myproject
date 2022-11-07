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
		System.out.println("Service, member_id : " + manager.getMember_id());
		System.out.println("Service, party_no : " + manager.getParty_no());
		System.out.println("Service, ishost : " + manager.getIshost());
		partymanager.create_insert(manager);
	}
}
