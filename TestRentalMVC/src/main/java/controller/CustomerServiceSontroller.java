package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.customer_service.Customer_serviceBean;
import model.customer_service.Customer_serviceService;
import model.member.MemberBean;

@Controller
@RequestMapping
public class CustomerServiceSontroller {
	@Autowired
	private Customer_serviceService css;
	@Autowired
	private Customer_serviceBean csb;
	@Autowired
	private MemberBean mb;
///////////會員新增意見	
	@RequestMapping(path="/opinion/addNewOpinion.controller",method=RequestMethod.POST)
	public String addNewOpinion(Customer_serviceBean csb,Model model) {
		Map<String,String> errors=new HashMap<>();
		model.addAttribute("errors",errors);
		if(csb.getName()==null || csb.getName().length()==0) {
			errors.put("name","請輸入您的大名");
		}
		if(csb.getEmail()==null || csb.getEmail().length()==0) {
			errors.put("email","請輸入您的Email");
		}
		if(csb.getTitle()==null || csb.getTitle().length()==0) {
			errors.put("title","請輸入標題");
		}
		if(csb.getText()==null || csb.getText().length()==0) {
			errors.put("text","請輸入意見");
		}
		if(errors.size()!=0) {
			return "send_opinion";
		}
		System.out.println(csb);
		css.addNewOpinion(csb);
		
		return "opinion_sent";
	}
////////////管理員回覆意見
	@RequestMapping(path="/manager_zone/replyOpinion.controller")
	public String replyOpinion(Model model,Integer id,String reply) {
		if(id==null || reply==null || reply.length()==0) {
			model.addAttribute("error","請確實填寫再送出");
			return "showOpinionList.controller";
		}
		csb=css.selectById(id);
		if(csb==null) {
			model.addAttribute("error","系統錯誤，請聯絡網站人員");
			return "showOpinionList.controller";
		}else {
			csb.setReply(reply);
			csb.setRe_time(new Timestamp(new Date().getTime()));
			css.updateOpinion(csb);
			
			return "showOpinionList.controller";
		}

	}
//////////////AJAX顯示管理員的回覆
//	@ResponseBody
//	@RequestMapping(path="/manager_zone/getReply.controller")
//	public void getReply(HttpServletResponse resp,String id) throws IOException {
//		resp.setContentType("text/html;charset=utf-8");
//		PrintWriter out=resp.getWriter();
//		Map<String,String> map=new HashMap();
//		Integer memId=null;
//		try {
//			memId=Integer.valueOf(id);
//		}catch(NumberFormatException e) {
//			map.put("txt","錯誤，請聯繫網站人員");
//			String json=new Gson().toJson(map);
//			out.println(json);
//			out.flush();
//			out.close();
//			return;
//		}
//		csb=css.selectById(memId);
//		
//		
//		return;
//	}

///////////////會員專區顯示會員的留言及回覆
	@RequestMapping(path="/member_function/showOpinionsAndReplys.controller")
	public String showOpinionsAndReplys(Model model,HttpSession session) {
		mb=(MemberBean)session.getAttribute("login_ok");
		if(mb==null) {
			return "login_sr";
		}
		
		List<Customer_serviceBean> list=css.selectByName(mb.getName());
		if(list.size()==0) {
			model.addAttribute("error","您目前沒有留言紀錄");
		}else {
			model.addAttribute("list",list);
		}
		
		return "show_opinions";
	}
}
