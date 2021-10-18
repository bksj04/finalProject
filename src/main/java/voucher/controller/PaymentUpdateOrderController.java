package voucher.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import order.model.OrderDao;

@Controller
public class PaymentUpdateOrderController {
	
	private final String command="/updateOrder.voucher";
	private final String getPage="updateOrder";
	
	@Autowired(required = false)
	OrderDao odao;
	
	@RequestMapping(value=command,method = RequestMethod.POST)
	public ModelAndView doAction(@RequestParam("mnum")int mnum,
			@RequestParam("pageNumber")int pageNumber) {
		
		ModelAndView mav=new ModelAndView();
		mav.setViewName(getPage);
		return mav;
	}
	
}
