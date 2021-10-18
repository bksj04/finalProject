package video.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import member.model.MemberWatchBean;
import member.model.MemberWatchDao;

@Controller
public class videoPlayController {

	@Autowired
	MemberWatchDao mwdao;
	
	private final String command = "/play.video";
	private final String getPage = "videoPlay";
	
	@RequestMapping(value=command)
	public ModelAndView doAction(MemberWatchBean watch) {
		ModelAndView mav = new ModelAndView();
		
		int cnt = mwdao.insertWatch(watch);
		
		mav.addObject("watch", watch);
		mav.setViewName(getPage);
		return mav;
	}
}
