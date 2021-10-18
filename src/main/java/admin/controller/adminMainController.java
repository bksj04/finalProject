package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class adminMainController {

	private final String command = "/adminMain.admin";
	private final String getPage = "adminMain";

	
	@RequestMapping(value=command, method=RequestMethod.GET)
	public ModelAndView doAction() {
		ModelAndView mav = new ModelAndView();
		
		String pageType = "main";
		mav.addObject("pageType", pageType);
		mav.setViewName(getPage);
		return mav;
	}
}
