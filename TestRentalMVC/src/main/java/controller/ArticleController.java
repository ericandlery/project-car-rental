package controller;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.ArticleBean;
import model.ArticleService;
import model.friendlist.FriendlistService;
import model.member.MemberBean;
import model.message.MessageBean;
import model.message.MessageService;
@Controller
@RequestMapping
@SessionAttributes(names= {"login_ok","pw"})
public class ArticleController {
	@Autowired
	private model.member.MemberService ms;
	@Autowired
	private model.member.MemberBean mb;
	@Autowired
	private ArticleBean ab;
	@Autowired
	private ArticleService as;
	private List<ArticleBean> list;
	@Autowired
	private MessageService mes;
	@Autowired
	private MessageBean mesb;
	@Autowired
	private FriendlistService fs;
//	
//	private PageBean pageBean;
	
	////////建立新文章
	@RequestMapping(path="/forum/insertArticle.controller",method=RequestMethod.POST)
	public String insertArticle(HttpServletRequest request,Model model) {
		HttpSession session=request.getSession();
		mb=(MemberBean) session.getAttribute("login_ok");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println(title);
		System.out.println(content);
		
		ab.setAuthor(mb.getId());
		ab.setTitle(title);
		ab.setContent(content);
		ab.setArticle_datetime(new Date());
		ab.setBrowse_count(0);//閱覽人數
		System.out.println(ab.toString());
		Boolean add = as.insertArticle(ab);
		if(add) {
			System.out.println("新文章建立 = "+add);
		}else {
			System.out.println("新文章建立 = "+add);
		}
		return "newarticlefinish";
	}
	
	////////讀取熱門文章
	@RequestMapping(path="/forum/showhotArticle.controller",method=RequestMethod.GET)
	public String showhotArticle(HttpServletRequest request,Model model){
		list = as.showhotarticle();
		if(list.size()!=0) {
			model.addAttribute("hotarticlelist",list);
		}else {
			model.addAttribute("hotarticlelistNULL","暫無資料");
		}
		return "messageboard";
	}
	////////讀取該篇文章
	@RequestMapping(path="/forum/showthisArticle.controller",method=RequestMethod.POST)
	public String showthisArticle(HttpServletResponse response,HttpServletRequest request,Model model) throws IOException {
		System.out.println("========================讀該篇文章");
		String title = request.getParameter("title");
		//增加瀏覽人數+1
		ab = as.showthisarticle(title);
		if(ab.getAuthor()!=0) {///////GMid
			ab.setBrowse_count(ab.getBrowse_count()+1);
			Boolean update = as.updatebrowse_count(ab);
			System.out.println("update = "+update);
		
		//顯示文章
			//抓文章作者id資料
		MemberBean author = ms.selectById(ab.getAuthor());
		model.addAttribute("author",author);
		
		}
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
	
	////////讀取我的文章
	@RequestMapping(path="/forum/showmyArticle.controller",method=RequestMethod.GET)
	public String showmyArticle(HttpServletRequest request,Model model) {
		HttpSession session=request.getSession();
		mb=(MemberBean)session.getAttribute("login_ok");
		list = as.showmyarticle(mb.getId());
		if(list.size()!=0) {
			model.addAttribute("myarticlelist",list);
		}else {
			model.addAttribute("myarticlelistNULL","暫無發表文章");
		}
		return "myarticle";
	}
	////////讀取好友的文章
	@RequestMapping(path="/forum/showfriendArticle.controller",method=RequestMethod.POST)
	public String showfriendArticle(HttpServletRequest request,Model model) {
		HttpSession session=request.getSession();
		String mid = request.getParameter("mid");
		MemberBean obj =  ms.selectById(Integer.valueOf(mid));
		
		model.addAttribute("friendname", obj.getName());
		list = as.showmyarticle(Integer.valueOf(mid));
		if(list.size()!=0) {
			model.addAttribute("friendarticlelist",list);
		}else {
			model.addAttribute("friendarticlelistNULL","無文章");
		}
		return "friendarticle";
	}
}
