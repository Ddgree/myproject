package partyband.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import partyband.service.PartyManagerServiceImpl;

@Controller
public class PartyManagerController 
{
	@Autowired
	private PartyManagerServiceImpl partymanager;
	
	@RequestMapping("")
	public String name()
	{
		return "";
	}
}
