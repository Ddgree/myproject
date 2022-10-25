package partyband.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class partycontroller {

	@Autowired

	// 메인페이지
	@RequestMapping("start.do")
	public String boardform() {
		return "party/partycreate";
	}

}
