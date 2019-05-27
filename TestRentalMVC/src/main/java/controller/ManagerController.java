package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

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

import model.ArticleBean;
import model.ArticleService;
import com.google.gson.Gson;
import model.branch.BranchBean;
import model.branch.BranchService;
import model.car.CarBean;
import model.car.CarService;
import model.car_category.Car_categoryBean;
import model.car_category.Car_categoryService;
import model.customer_service.Customer_serviceBean;
import model.customer_service.Customer_serviceService;
import model.driver.DriverService;
import model.manager.ManagerBean;
import model.manager.ManagerService;
import model.member.MemberBean;
import model.member.MemberService;
import model.message.MessageBean;
import model.message.MessageService;
import model.model.ModelBean;
import model.model.ModelService;
import model.pickup_order.Pickup_orderBean;
import model.pickup_order.Pickup_orderService;
import model.rental_order.Rental_orderBean;
import model.rental_order.Rental_orderService;
import model.staff.StaffBean;
import model.staff.StaffService;

@Controller
@RequestMapping
@SessionAttributes(names="manager_login_ok")
public class ManagerController {
	@Autowired
	private ManagerService ms;
	@Autowired
	private ManagerBean mb;
	@Autowired
	private MemberService members;
	@Autowired
	private MemberBean memberb;
	@Autowired
	private Rental_orderService rs;
	@Autowired
	private Rental_orderBean rb;
	@Autowired
	private CarService cs;
	@Autowired
	private CarBean cb;
	@Autowired
	private BranchService bs;
	@Autowired
	private Car_categoryService categoryService;
	@Autowired
	private ModelService modelService;
	@Autowired
	private Pickup_orderService ps;
	@Autowired
	private Pickup_orderBean pb;
	@Autowired
	private DriverService ds;
	@Autowired
	private ArticleService as;
	@Autowired
	private ArticleBean ab;
	@Autowired
	private MessageService mes;
	@Autowired
	private model.member.MemberService mems;
	@Autowired
	private MessageBean messagebean;
	@Autowired
	private List<ArticleBean> list;
	@Autowired
	private Customer_serviceService css;
	@Autowired
	private Customer_serviceBean csb;
	@Autowired
	private StaffBean staffb;
	@Autowired
	private StaffService staffs;
	/////////////管理員登入
	@RequestMapping(path="/manager_zone/managerLogin.controller",method=RequestMethod.POST)
	public String managerLogin(ManagerBean mb,Model model) {
		if((ms.login(mb))==true) {
			mb=ms.selectByName(mb.getName());
			model.addAttribute("manager_login_ok",mb);
			return "manager_zone";
		}
		model.addAttribute("wrong","帳號密碼錯誤");
		return "manager_login";
	}
	/////////////管理員登出
//	@RequestMapping(path= {"/manager_zone/managerLogout.controller",
//							"/manager_zone/member/managerLogout.controller",
//							"/manager_zone/order/managerLogout.controller"})
//	public String managerLogout(HttpSession session,Model model,SessionStatus status) {
////		if(status.isComplete()==false) {
//		status.setComplete();
////		return "index_sr";
////		}
//		return "index_sr";
//	}
	/////////////查看所有的會員名單(依輸入值排序)
	@RequestMapping(path= {"/manager_zone/selectAllMembersOrderById.controller",
							"/manager_zone/member/selectAllMembersOrderById.controller"})
	public String selectAllMembersOrder(String order,String sort,Model model) {
		//////////預設使用id小到大排序
		if(order==null || order.length()==0) {
			order="id";
		}
		if(sort==null || sort.length()==0) {
			sort="asc";
		}
		////////////////////////
		List<MemberBean> list=new ArrayList<>();
		list=members.selectAllMemberOrderBy(order,sort);
		if(list!=null) {
			model.addAttribute("member_list",list);
		}else {
			model.addAttribute("no_member","沒有會員");
		}
		
		return "memebr_list";
	}
	@RequestMapping(path={"/manager_zone/selectAllOrderOrder.controller",
							"/manager_zone/order/selectAllOrderOrder.controller"})
	public String selectAllOrderOrder(String order,String sort,Model model) {
		//////////預設使用id小到大排序
		if(order==null || order.length()==0) {
			order="id";
		}
		if(sort==null || sort.length()==0) {
			sort="asc";
		}
		/////////////////////////
		List<Rental_orderBean> list=new ArrayList<>();
		list=rs.selectAllOrderBy(order, sort);
		
		if(list!=null) {
			model.addAttribute("order_list",list);
		}else {
			model.addAttribute("no_order","沒有訂單");
		}
		return "order_list";
	}
	@RequestMapping(path={"/manager_zone/selectAllCarOrder.controller",
							"/manager_zone/car/selectAllCarOrder.controller"})
	public String selectAllCarOrder(String order,String sort,Model model) {
		//////////預設使用car_num小到大排序
		if(order==null || order.length()==0) {
		order="car_num";
		}
		if(sort==null || sort.length()==0) {
		sort="asc";
		}
		/////////////////////////
		List<CarBean> list=new ArrayList<>();
		list=cs.selectAllOrder(order, sort);
		
		if(list!=null) {
		model.addAttribute("car_list",list);
		}else {
		model.addAttribute("no_car","沒有車了");
		}
		return "car_list";
	}
	
	@RequestMapping(path={"/manager_zone/selectAllBranchOrder.controller",
	"/manager_zone/branch/selectAllBranchOrder.controller"})
	public String selectAllBranchOrder(String order,String sort,Model model) {
	//////////預設使用name小到大排序
	if(order==null || order.length()==0) {
	order="name";
	}
	if(sort==null || sort.length()==0) {
	sort="asc";
	}
	/////////////////////////
	List<BranchBean> list=new ArrayList<>();
	list=bs.selectAllBranchOrder(order, sort);
	
	if(list!=null) {
	model.addAttribute("branch_list",list);
	}else {
	model.addAttribute("no_branch","沒有據點了???");
	}
	return "branch_list";
	}
	
	@RequestMapping(path="/manager_zone/selectAllCarCategory.controller")
	public String selectAllCarCategory(Model model) {
		//抓車種
		List<Car_categoryBean> list=new ArrayList<>();
		list=categoryService.showCarCategory();
		//抓車型名單
		List<ModelBean> list_model=modelService.showAllModel();
		if(list!=null) {
			System.out.println(list);
			model.addAttribute("category",list);
		}else
			model.addAttribute("error_category","車種欄位錯誤!");
		
		if(list_model!=null) {
			System.out.println(list_model);
			model.addAttribute("select",list_model);
		}else
			model.addAttribute("error_model","查不到model list");
		return "model_list";
	}
/////////////顯示今天與明天的接送訂單和司機名稱
	@RequestMapping(path="/manager_zone/pickup_manager/showTodayPickupOrder.controller")
	public String showTodayPickupOrder(Model model) {
		////今天
		List<Pickup_orderBean> list=ps.getTodayPickupOrder();
		////明天
		List<Pickup_orderBean> list2=ps.getFuturePickupOrder(1);
		////未處理
		List<Pickup_orderBean> list3=ps.getUnfinishedOrders();
		
		
		if(list.size()!=0) {
			model.addAttribute("today_order",list);
			Set<String> driverNames=new LinkedHashSet<>();
			for(Pickup_orderBean pb:list) {
				driverNames.add(ds.selectById(pb.getDriver_id()).getName());
			}
			model.addAttribute("driver_names",driverNames);
			model.addAttribute("drivers",driverNames.size());
		}else {
			model.addAttribute("no_order","今天沒有接送訂單");
		}
		
		if(list2.size()!=0) {
			model.addAttribute("today_order2",list2);
			Set<String> driverNames=new LinkedHashSet<>();
			for(Pickup_orderBean pb:list2) {
				driverNames.add(ds.selectById(pb.getDriver_id()).getName());
			}
			model.addAttribute("driver_names2",driverNames);
			model.addAttribute("drivers2",driverNames.size());
		}else {
			model.addAttribute("no_order2","明天沒有接送訂單");
		}
		
		if(list3.size()!=0) {
			model.addAttribute("today_order3",list3);
			Set<String> driverNames=new LinkedHashSet<>();
			for(Pickup_orderBean pb:list3) {
				driverNames.add(ds.selectById(pb.getDriver_id()).getName());
			}
			model.addAttribute("driver_names3",driverNames);
			model.addAttribute("drivers3",driverNames.size());
		}else {
			model.addAttribute("no_order3","所有訂單都已處理完畢");
		}
		
		return "pickup_today";
	}
////////////////司機接送完成後，完成接送手續，將訂單狀態改為已結束，並輸入結束日期時間
	@RequestMapping(path="/manager_zone/pickup_manager/finishPickupOrder.controller",method=RequestMethod.POST)
	public String finishPickupOrder(Model model,String orderId) {
		Integer id=null;
		try {
			id=Integer.valueOf(orderId);
		}catch(NumberFormatException e) {
			model.addAttribute("web_error","系統異常");
			System.out.println("系統異常，數字轉型失敗");
			return "pickup_today_controller";
		}
		pb=ps.selectById(id);
		if(pb==null) {
			model.addAttribute("finished","無法處理訂單，請聯絡網站設計人員");
		}else {
			cb=cs.selectByCarNum(pb.getCar_num());
			///////////完成訂單，更改狀態
			ps.finishedPickupOrder(pb);
			cs.cancelOrFnishedPickupOrder(cb);

			model.addAttribute("finished","處理完畢");
		}
		
		return "pickup_today_controller";
	}
	////////管理  顯示熱門文章
	@RequestMapping(path= {"/manager_zone/forum_manager/manageArticle.controller","/manager_zone/manageArticle.controller"},method=RequestMethod.GET)
	public String manageArticle(HttpServletRequest request,Model model){
		list = as.showhotarticle();
		if(list.size()!=0) {
			model.addAttribute("hotarticlelist",list);
		}else {
			model.addAttribute("hotarticlelistNULL","暫無資料");
		}
		return "messageboardmanage";
	}
	////////管理  讀取該篇文章
	@RequestMapping(path="/manager_zone/forum_manager/manageshowArticle.controller",method=RequestMethod.POST)
	public String managethisArticle(HttpServletResponse response,HttpServletRequest request,Model model) throws IOException {
		String title = request.getParameter("title");
		
		//顯示文章
		ab = as.showthisarticle(title);
			//抓文章作者id資料
		if(ab.getAuthor()!=0) {
			MemberBean author = mems.selectById(ab.getAuthor());
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
		return "managearticlepage";
	}
	////////管理  封鎖留言
	@RequestMapping(path= "/manager_zone/forum_manager/lockthismessage.controller",method=RequestMethod.POST)
	public String lockthismessage(HttpServletResponse response,HttpServletRequest request,Model model) throws IOException {
		System.out.println("test");
		//封鎖
		String id = request.getParameter("id");
		System.out.println("id="+id);
		MessageBean messageBean=mes.select(Integer.valueOf(id));
		System.out.println("messageBean="+messageBean);
		messageBean.setMessage("封鎖不當言論");
		Boolean lock = mes.locktoupdate(messageBean);
		System.out.println("lock = "+lock);
		
		
		String title = request.getParameter("title");
		//顯示文章
		ab = as.showthisarticle(title);
			//抓文章作者id資料
		MemberBean author = mems.selectById(ab.getAuthor());
		model.addAttribute("author",author);
		model.addAttribute("ab",ab);
		//顯示留言
		List list = mes.showthisarticlemessage(title);
		if(list.size()!=0) {
			model.addAttribute("messagelist", list);
		}else {
			model.addAttribute("messagelistNULL","暫無留言");
		}
		return "managearticlepage";
	}
	
////////管理  封鎖被檢舉留言
@RequestMapping(path= {"/manager_zone/lockreportmessage.controller","/manager_zone/forum_manager/lockreportmessage.controller"},method=RequestMethod.POST)
public String lockreportmessage(HttpServletResponse response,HttpServletRequest request,Model model) throws IOException {
	//封鎖
	String id = request.getParameter("id");
	System.out.println("id = "+id);
	MessageBean messageBean=mes.select(Integer.valueOf(id));
	System.out.println("messageBean="+messageBean);
	messageBean.setMessage("封鎖不當言論");
	Boolean lock = mes.locktoupdate(messageBean);
	System.out.println("lock = "+lock);
	
	//顯示被檢舉留言
	List list = mes.showreportmessahe();
	if(list.size()!=0) {
		model.addAttribute("reportlist", list);
		System.out.println("test1");
	}else {
		model.addAttribute("reportlistNULL","無檢舉留言");
		System.out.println("test2");
	}
	return "managereportmessage";
}
	////////管理  刪除文章
	@RequestMapping(path="/manager_zone/forum_manager/deletethisarticle.controller",method=RequestMethod.POST)
	public String deletethisarticle(HttpServletResponse response,HttpServletRequest request,Model model) throws IOException {
		String title = request.getParameter("title");
		//先刪除該文章所有留言
		Boolean delete_message = mes.delete(title);
		//在刪除該文章
		Boolean delete_article = as.delete(title);
		System.out.println("文章"+title+"所有留言刪除 = "+delete_message);
		System.out.println("文章"+title+"所有留言刪除 = "+delete_article);
		//顯示熱門文章
		list = as.showhotarticle();
		if(list.size()!=0) {
			model.addAttribute("hotarticlelist",list);
		}else {
			model.addAttribute("hotarticlelistNULL","暫無資料");
		}
		
		return "messageboardmanage";
	}

/////////////意見系統，顯示所有客戶的意見
	@RequestMapping(path="/manager_zone/showOpinionList.controller")
	public String showOpinionList(Model model) {
		List<Customer_serviceBean> list=css.selectAll();
		if(list.size()!=0) {
			model.addAttribute("list",list);
		}else {
			model.addAttribute("zero","目前沒有任何客戶有意見");
		}
		return "opinion_list";
	}
//////////顯示客戶的留言在小視窗
	@ResponseBody
	@RequestMapping(path="/manager_zone/showTxt.controller")
	public void showTxt(HttpServletResponse resp,String id) throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		Map<String,String> map=new HashMap();
		Integer memId=null;
		try {
			memId=Integer.valueOf(id);
		}catch(NumberFormatException e) {
			map.put("txt","錯誤，請聯繫網站人員");
			String json=new Gson().toJson(map);
			out.println(json);
			out.flush();
			out.close();
			return;
		}
		csb=css.selectById(memId);
		map.put("name",csb.getName());
		map.put("txt",csb.getText());
		map.put("reply",csb.getReply());
		String json=new Gson().toJson(map);
		out.println(json);
		out.flush();
		out.close();
		return;
	}
	
///////////////審核會員資格，印出審核表給管理員
	@RequestMapping(path="/manager_zone/reviewMembership.controller")
	public String reviewMembership(Model model) {
		List<MemberBean> list=members.getUnReviewedMembers();
		if(list.size()!=0) {
			model.addAttribute("list",list);
		}else {
			model.addAttribute("no_list","目前還沒有任何會員註冊");
		}
		
		return "audit_list";
	}
//////////////審核會員資格，決定要過關並輸入資料還是退回
	@RequestMapping(path="/manager_zone/reviewOrReject.controller",method=RequestMethod.POST)
	public String reviewOrReject(String mem_id,String license_leval,String license_num,String submitType,Model model) {
		Integer id=null;
		try {
			id=Integer.valueOf(mem_id);
		}catch(NumberFormatException e) {
			System.out.println("數字轉換錯誤");
			return "reviewMembership";
		}
		memberb=members.selectById(id);
		/////////1審核過關，0退回
		if(submitType.equals("1")) {
			memberb.setMem_state("良好");
			memberb.setLicense_num(license_num);
			memberb.setLicense_leval(license_leval);
			members.updateMember(memberb);
		}else {
			memberb.setMem_state("未通過");
			members.updateMember(memberb);
		}
		
		return "reviewMembership";
	}
	////////建立討論區公告
	@RequestMapping(path="/manager_zone/forum_manager/insertannouncement.controller",method=RequestMethod.GET)
	public String insertannouncement(HttpServletRequest request,Model model) {
		HttpSession session=request.getSession();
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println(title);
		System.out.println(content);
		//管理者設為1
		ab.setAuthor(0);///////////GMid
		ab.setTitle(title);
		ab.setContent(content);
		ab.setArticle_datetime(new Date());
		ab.setBrowse_count(999999);//閱覽人數
		System.out.println(ab.toString());
		Boolean add = as.insertArticle(ab);
		if(add) {
			System.out.println("新文章建立 = "+add);
		}else {
			System.out.println("新文章建立 = "+add);
		}
		return "manageArticle";
	}
	////////顯示被檢舉留言
	@RequestMapping(path= {"/manager_zone/handleportmessage.controller","/manager_zone/forum_manager/handleportmessage.controller"},method=RequestMethod.GET)
	public String handleportmessage(HttpServletRequest request,Model model) {
		List list = mes.showreportmessahe();
		if(list.size()!=0) {
			model.addAttribute("reportlist", list);
			System.out.println("test1");
		}else {
			model.addAttribute("reportlistNULL","無檢舉留言");
			System.out.println("test2");
		}
		return "managereportmessage";
	}
///////////////顯示門市人員列表
	@RequestMapping(path= {"/manager_zone/showStaffList.controller","/manager_zone/staff/showStaffList.controller"})
	public String showStaffList(Model model) {
		List<StaffBean> list=staffs.selectAll();
		if(list==null) {
			model.addAttribute("error","目前沒有指派任何門市人員");
		}else {
			model.addAttribute("list",list);
		}
		
		return "staff_list";
	}
/////////////對門市人員新刪修
	@RequestMapping(path= {"/manager_zone/crudStaff.controller","/manager_zone/staff/crudStaff.controller"},method=RequestMethod.POST)
	public String crudStaff(Model model,String type,StaffBean staffb) {
		/////(2新增)		(1修改)		(0刪除)
		switch(type) {
		case "2":////新增
			if(staffb.getName().length()==0 || staffb.getPassword().length==0 || staffb.getBranch_name()==null) {
				model.addAttribute("formMessage","請確實輸入資料再新增");
				return "staff_list_con";
			}else {
				if(staffs.selectByName(staffb.getName()).size()==0) {
					staffs.insertOrUpdate(staffb);
					model.addAttribute("formMessage","新增成功");
				}else {
					model.addAttribute("formMessage","帳號已經有人使用過，請換一個");
				}
			}
			break;
		case "1":////修改
			if(staffb.getName().length()==0 || staffb.getPassword().length==0 || staffb.getBranch_name()==null) {
				model.addAttribute("formMessage","請確實輸入資料再更新");
				return "staff_list_con";
			}else {
				StaffBean temp=staffs.selectById(staffb.getId());
				if(temp!=null){
					temp.setName(staffb.getName());
					temp.setPassword(staffb.getPassword());
					temp.setBranch_name(staffb.getBranch_name());
					staffs.insertOrUpdate(temp);
				}else {
					System.out.println("系統錯誤，請聯絡程式設計師");
					model.addAttribute("formMessage","系統錯誤，請聯絡程式設計師");
				}
			}
			break;
		case "0":////刪除
			staffb=staffs.selectById(staffb.getId());
			staffs.delete(staffb);
			System.out.println("DD");
			break;
		}
		
		return "staff_list_con";
	}
}