package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.friendlist.FriendlistBean;
import model.friendlist.FriendlistService;
import model.member.MemberBean;
import model.member.MemberService;

@Controller
@RequestMapping
@SessionAttributes(names= {"login_ok","pw"})
public class FriendlistController {
	@Autowired
	private MemberService ms;
	@Autowired
	private MemberBean mb;
	@Autowired
	private FriendlistBean fb;
	@Autowired
	private FriendlistService fs;
	
		
	////////顯示好友名單
	@RequestMapping(path="/forum/showfriend.controller",method=RequestMethod.GET)
	public String showfriend(HttpServletRequest request,Model model) {
		HttpSession session=request.getSession();
		mb=(MemberBean)session.getAttribute("login_ok");
		System.out.print(mb.getId());
		List list= fs.showfriend(mb.getId(), "好友");
		if(list.size()!=0) {
			model.addAttribute("list",list);
		}else {
			model.addAttribute("listNULL","暫無資料");
		}
		return "friend";
	}
		
	////////顯示邀請請求名單
	@RequestMapping(path="/forum/searchinvite.controller",method=RequestMethod.GET)
	public String searchinvite(HttpServletRequest request,Model model) {
		//顯示邀請請求名單
		HttpSession session=request.getSession();
		mb=(MemberBean)session.getAttribute("login_ok");
		List listinvite= fs.showfriend(mb.getId(), "邀請者");
		if(listinvite.size()!=0) {
			model.addAttribute("listinvite",listinvite);
		}else {
			model.addAttribute("listinviteNULL","無資料");
		}
		//把名單的 lookcheck 給值check     自動update??
		int fid[] = new int[listinvite.size()];
		 for(int i = 0 ;  i <listinvite.size(); i++ ){
	         Object[] tempObj = (Object[]) listinvite.get(i);
	         System.out.println("fid = "+tempObj[5].toString());
	         fid[i] = (int) tempObj[5];
		 }
		List<FriendlistBean> list = fs.selectbyid(fid);
		for(FriendlistBean fbb:list) {
			fbb.setLookcheck("check");
		}
		for(FriendlistBean fbb:list) {
			System.out.println(fbb.toString());
		}
		
		return "invitask";
	}
	////////姓名查詢
	@RequestMapping(path="/forum/searchname.controller",method=RequestMethod.POST)
	public String searchname(HttpServletRequest request,Model model) {
		////////姓名查詢
		HttpSession session=request.getSession();
		mb=(MemberBean)session.getAttribute("login_ok");
		String name = request.getParameter("name");
		System.out.println(name);
		
			List listname= fs.searchname(name,mb.getId());
			if(listname.size()!=0) {
				model.addAttribute("listname",listname);
			}else {
				model.addAttribute("listnameNULL","查無資料");
			}
		model.addAttribute("name", name);
		return "addnewfriend";
	}
	////////接受邀請請求加好友 
	@RequestMapping(path="/forum/addinvite.controller",method=RequestMethod.POST)
	public String addinvite(HttpServletRequest request,Model model) {
		HttpSession session=request.getSession();
		mb=(MemberBean)session.getAttribute("login_ok");
		//接受邀請請求加好友
		String id = request.getParameter("id");
		String relationship = request.getParameter("relationship");
		String friendid = request.getParameter("friendid");
		System.out.println("id = "+id);
		System.out.println("relationship = "+relationship);
		FriendlistBean fb = new FriendlistBean();
		FriendlistBean fb2 = new FriendlistBean();
		if(relationship.equals("邀請者")) {
			System.out.println("test");
			FriendlistBean userfb = fs.select(mb.getId(), Integer.valueOf(id));
			fb.setId(userfb.getId());
			fb.setMem_id_myself(mb.getId());
			fb.setMem_id_friend(Integer.valueOf(id));
			fb.setRelationship("好友");
			fb2.setId(Integer.valueOf(friendid));
			fb2.setMem_id_myself(Integer.valueOf(id));
			fb2.setMem_id_friend(mb.getId());
			fb2.setRelationship("好友");
			Boolean add = fs.update(fb, fb2);
			System.out.println("update = "+add);
		}else if(relationship=="" || relationship.length()==0) {
			fb.setMem_id_myself(mb.getId());
			fb.setMem_id_friend(Integer.valueOf(id));
			fb.setRelationship("邀請者");
			fb2.setMem_id_myself(Integer.valueOf(id));
			fb2.setMem_id_friend(mb.getId());
			fb2.setRelationship("受邀者");
			Boolean add = fs.invite(fb, fb2);
			System.out.println("insert = "+add);
		}
		//顯示邀請請求名單
		List listinvite= fs.showfriend(mb.getId(), "邀請者");
		if(listinvite.size()!=0) {
			model.addAttribute("listinvite",listinvite);
		}else {
			model.addAttribute("listinviteNULL","無資料");
		}
		return "invitask";
	}
	////////接受邀請請求加好友
	@RequestMapping(path="/forum/addinvitetoaddnewfriend.controller",method=RequestMethod.POST)
	public String addinvitetoaddnewfriend(HttpServletRequest request,Model model) {
		HttpSession session=request.getSession();
		mb=(MemberBean)session.getAttribute("login_ok");
		String id = request.getParameter("id");
		String relationship = request.getParameter("relationship");
		System.out.println("id = "+id); ////
		System.out.println("relationship="+relationship);   ///
		FriendlistBean fb = new FriendlistBean();
		FriendlistBean fb2 = new FriendlistBean();
		if(relationship.equals("邀請者")) {
			System.out.println("testrrr");    ///
			FriendlistBean userfb = fs.select(mb.getId(), Integer.valueOf(id));
			System.out.println("userfb="+userfb);      ////
			fb.setId(userfb.getId());
			fb.setMem_id_myself(mb.getId());
			fb.setMem_id_friend(Integer.valueOf(id));
			fb.setRelationship("好友");
			FriendlistBean userfb2 = fs.select(Integer.valueOf(id),mb.getId());
			System.out.println("userfb2="+userfb2);
			fb2.setId(userfb2.getId());
			fb2.setMem_id_myself(Integer.valueOf(id));
			fb2.setMem_id_friend(mb.getId());
			fb2.setRelationship("好友");
			System.out.println("fb="+fb.toString());
			System.out.println("fb2="+fb2.toString());
			Boolean add = fs.update(fb, fb2);
			System.out.println("update = "+add);
		}else if(relationship=="" || relationship.length()==0) {
			fb.setMem_id_myself(mb.getId());
			fb.setMem_id_friend(Integer.valueOf(id));
			fb.setRelationship("邀請者");
			fb2.setMem_id_myself(Integer.valueOf(id));
			fb2.setMem_id_friend(mb.getId());
			fb2.setRelationship("受邀者");
			Boolean add = fs.invite(fb, fb2);
			System.out.println("insert = "+add);
		}
		return "addnewfriend";
	}
	////////邀請通知提醒
	@ResponseBody
	@RequestMapping(path="/forum/remind.controller",method=RequestMethod.GET)
	public void remind(HttpServletRequest request,Model model,HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		//邀請通知提醒
		HttpSession session=request.getSession();
		mb=(MemberBean)session.getAttribute("login_ok");
		List list2= fs.selectcheck(mb.getId(), "邀請者");
		if(!list2.isEmpty()) {
			response.getWriter().print("invite");
			response.getWriter().flush();
			response.getWriter().close();
		}else {
		}
		return;
	}
	
}
