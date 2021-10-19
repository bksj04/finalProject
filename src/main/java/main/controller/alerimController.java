package main.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cs.model.CsQnABean;
import cs.model.CsQnADao;
import member.model.MemberBean;

@Controller
public class alerimController {

	@Autowired
	CsQnADao cqdao;
	private final String command = "alert.wa";
	private final String getPage = "alrim";

	@RequestMapping(value = command)
	public ModelAndView doAction(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		MemberBean loginInfo = (MemberBean) session.getAttribute("loginInfo"); 
		List<CsQnABean> lists = cqdao.getByData(loginInfo.getId());
		
		mav.addObject("lists", lists);
		mav.setViewName(getPage);
		return mav;
	}
}
