package com.project.root;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "index";
	}
	@RequestMapping(value = "blank", method = RequestMethod.GET)
	public String blank(Locale locale, Model model) {
		
		return "blank2";
	}
	@RequestMapping(value = "buttons", method = RequestMethod.GET)
	public String buttons(Locale locale, Model model) {
		
		return "buttons";
	}
	@RequestMapping(value = "cards", method = RequestMethod.GET)
	public String cards(Locale locale, Model model) {
		
		return "cards";
	}
	@RequestMapping(value = "charts", method = RequestMethod.GET)
	public String charts(Locale locale, Model model) {
		
		return "charts";
	}
	@RequestMapping(value = "forgotPassword", method = RequestMethod.GET)
	public String forgotPassword(Locale locale, Model model) {
		
		return "forgotPassword";
	}
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {
		
		return "login";
	}
	@RequestMapping(value = "register", method = RequestMethod.GET)
	public String register(Locale locale, Model model) {
		
		return "register";
	}
	@RequestMapping(value = "tables", method = RequestMethod.GET)
	public String tables(Locale locale, Model model) {
		
		return "tables2";
	}
	@RequestMapping(value = "utilitiesAnimation", method = RequestMethod.GET)
	public String utilitiesAnimation(Locale locale, Model model) {
		
		return "utilitiesAnimation";
	}
	@RequestMapping(value = "utilitiesBorder", method = RequestMethod.GET)
	public String utilitiesBorder(Locale locale, Model model) {
		
		return "utilitiesBorder";
	}
	@RequestMapping(value = "utilitiesColor", method = RequestMethod.GET)
	public String utilitiesColor(Locale locale, Model model) {
		
		return "utilitiesColor";
	}
	@RequestMapping(value = "utilitiesOther", method = RequestMethod.GET)
	public String utilitiesOther(Locale locale, Model model) {
		
		return "utilitiesOther";
	}
	
	@RequestMapping(value = "404", method = RequestMethod.GET)
	public String notFindPage(Locale locale, Model model) {
		
		return "404";
	}
	
}
