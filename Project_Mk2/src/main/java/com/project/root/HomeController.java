package com.project.root;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.root.basicdata.dto.BasicDataDTO;

@Controller
public class HomeController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "login";
	}	
	
	/*
	 * @RequestMapping(value = "/", method = RequestMethod.GET) public String home()
	 * { return "index"; }
	 */
	/*
	 * @RequestMapping(value = "tables", method = RequestMethod.GET) public String
	 * tables() { return "tablesTest"; }
	 */
	/*
	 * @RequestMapping(value = "buttons", method = RequestMethod.GET) public String
	 * buttons() { return "buttons"; }
	 * 
	 * @RequestMapping(value = "cards", method = RequestMethod.GET) public String
	 * cards() { return "cards"; }
	 * 
	 * @RequestMapping(value = "charts", method = RequestMethod.GET) public String
	 * charts() { return "charts"; }
	 * 
	 * @RequestMapping(value = "forgotPassword", method = RequestMethod.GET) public
	 * String forgotPassword() { return "forgotPassword"; }
	 * 
	 * @RequestMapping(value = "register", method = RequestMethod.GET) public String
	 * register() { return "register"; }
	 * 
	 * @RequestMapping(value = "utilitiesAnimation", method = RequestMethod.GET)
	 * public String utilitiesAnimation() { return "utilitiesAnimation"; }
	 * 
	 * @RequestMapping(value = "utilitiesBorder", method = RequestMethod.GET) public
	 * String utilitiesBorder() { return "utilitiesBorder"; }
	 * 
	 * @RequestMapping(value = "utilitiesColor", method = RequestMethod.GET) public
	 * String utilitiesColor() { return "utilitiesColor"; }
	 * 
	 * @RequestMapping(value = "utilitiesOther", method = RequestMethod.GET) public
	 * String utilitiesOther() { return "utilitiesOther"; }
	 * 
	 * @RequestMapping(value = "404", method = RequestMethod.GET) public String
	 * notFindPage() { return "404"; }
	 * 
	 * @RequestMapping(value = "aaa", method = RequestMethod.GET) public String
	 * aa(Locale locale, Model model) {
	 * 
	 * return "aaa";
	 * 
	 * }
	 */
}
