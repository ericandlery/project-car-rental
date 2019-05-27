package controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.ArticleBean;
import model.ArticleService;
import model.member.MemberBean;
import model.message.MessageBean;
import model.message.MessageService;

@Controller
@RequestMapping
@SessionAttributes(names= {"login_ok","pw"})
public class MessageController {
	@Autowired
	private MessageService mes;
	@Autowired
	private MessageBean mesb;
	@Autowired
	private MemberBean mb;
	@Autowired
	private ArticleBean ab;
	@Autowired
	private ArticleService as;
	@Autowired
	private model.member.MemberService ms;
	////////新增留言
	@RequestMapping(path="/forum/addNewMessage.controller",method=RequestMethod.POST)
	public String addNewMessage(HttpServletRequest request,Model model) {
		System.out.println("新增留言=========");
		HttpSession session=request.getSession();
		mb=(MemberBean)session.getAttribute("login_ok");
		String title = request.getParameter("title");
		String message = request.getParameter("message");
		
		//新增留言
		mesb.setMem_id(mb.getId());
		mesb.setTitle(title);
		mesb.setMessage(message);
		mesb.setMessage_datetime(new Date());
		mesb.setReport("none");
		mes.insertmessage(mesb);
		//顯示文章
		ab = as.showthisarticle(title);
			//抓文章作者id資料
		MemberBean author = ms.selectById(ab.getAuthor());
		model.addAttribute("author",author);
		model.addAttribute("ab",ab);
		//顯示留言
		List list = mes.showthisarticlemessage(title);
		if(list.size()!=0) {
			model.addAttribute("messagelist", list);
		}else {
			model.addAttribute("messagelistNULL","暫無留言");
		}
		
		return "articlepage";
	}
	
	////////檢舉留言
	@RequestMapping(path="/forum/reportMessage.controller",method=RequestMethod.POST)
	public String reportMessage(HttpServletRequest request,Model model) {
		String messageid  = request.getParameter("messageid");
		System.out.println("messageid = "+messageid);
		mesb = mes.select(Integer.valueOf(messageid));
		Boolean update = mes.reporttoupdate(mesb);
		System.out.println("檢舉="+update);
//		mes.locktoupdate(mesb);
		
		return "articlepage";
	}
}
