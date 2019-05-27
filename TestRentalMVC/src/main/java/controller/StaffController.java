package controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.branch.BranchService;
import model.car.CarBean;
import model.car.CarService;
import model.member.MemberService;
import model.rental_order.Rental_orderBean;
import model.rental_order.Rental_orderService;
import model.staff.StaffBean;
import model.staff.StaffService;

@Controller
@RequestMapping
@SessionAttributes(names="staff_login_ok")
public class StaffController {
	@Autowired
	private StaffService ss;
	@Autowired
	private BranchService bs;
	@Autowired
	private Rental_orderService rs;
	@Autowired
	private CarService cs;
	@Autowired
	private MemberService ms;
	/////////////門市人員登入
	@RequestMapping(path="/manager_zone/staffLogin.controller",method=RequestMethod.POST)
	public String staffLogin(StaffBean sb,Model model) {
		StaffBean b=ss.login(sb);
		if(b!=null) {
//			StaffBean verifiedSb=ss.selectByName(sb.getName());
//			
//			if(bs.selectByName(verifiedSb.getBranch_name())!=null) {
				
				model.addAttribute("staff_login_ok",b);
				return "staff_zone";
//			}else {
//				model.addAttribute("staff_wrong","帳號密碼錯誤");
//				return "manager_login";
//			}
		}else {
			model.addAttribute("staff_wrong","帳號密碼錯誤");
			return "manager_login";
		}
	}
///////////////取得單一據點的所有已預約(未取車)的訂單，並且按時間分類(未來、現在、過期)
	@RequestMapping(path="/manager_zone/staff_zone/getUnfinishedOrders.controller")
	public String getUnfinishedOrders(HttpSession session,Model model) {
		//////////先取得該門市的據點
		StaffBean sb=(StaffBean)session.getAttribute("staff_login_ok");
		if(sb==null) {
			return "index_sr";
		}
		String branch_name=sb.getBranch_name();
		///////////抓出所有預約中未處理的訂單
		List<Rental_orderBean> list=rs.getUnfinishedOrderInABranch(branch_name,"已預約","start");
		if(list!=null) {
			/////////取得以後比較時間，把未來訂單跟今日訂單分開
			Calendar today=Calendar.getInstance();
			today.setTime(new Date());
			Calendar orderDate=Calendar.getInstance();
			List<Rental_orderBean> todayList=new ArrayList<>();		//////今日訂單
			List<Rental_orderBean> futureList=new ArrayList<>();	//////未來訂單
			List<Rental_orderBean> oldList=new ArrayList<>();		//////過期訂單
			
			for(Rental_orderBean rb:list) {
				Date sDate=rb.getStart_date();	////抓出[取車]時間
				orderDate.setTime(sDate);
				//////////抓出今日的訂單然後比較先後
				if(today.get(Calendar.YEAR)==orderDate.get(Calendar.YEAR) && today.get(Calendar.DAY_OF_YEAR)==orderDate.get(Calendar.DAY_OF_YEAR)) {
					todayList.add(rb);
				}else if(TimeUnit.DAYS.convert(new Date().getTime()-sDate.getTime(),TimeUnit.MILLISECONDS)>0) {
					///////////////如果今天已經超過了取車日期
					oldList.add(rb);
				}else {
					//////////////未處理(未來)訂單
					futureList.add(rb);
				}
			}
			if(todayList.size()!=0) {
				model.addAttribute("todayList",todayList);
			}
			if(futureList.size()!=0) {
				model.addAttribute("futureList",futureList);
			}
			if(oldList.size()!=0) {
				model.addAttribute("oldList",oldList);
			}
			model.addAttribute("no_order","沒有待處理的訂單");

			return "send_car_list";
		}else {
			model.addAttribute("no_order","沒有待處理的訂單");
			return "send_car_list";
		}
	}
///////////////處理取車手續，將訂單改為'已取車'、將車的狀態改為'出租中'、將車的所在據點改為出租中
	@RequestMapping(path="/manager_zone/staff_zone/dealOrder.controller",method=RequestMethod.POST)
	public String dealOrder(String id,Model model) {
		//////////先將ID轉型成數字
		int orderId;
		try {
		orderId=Integer.valueOf(id);
		}catch(NumberFormatException e) {
			return "manager_login_sr";
		}
		/////////抓出訂單和車
		Rental_orderBean rb=rs.selectById(orderId);
		rs.sendCar(rb);
		CarBean cb=cs.selectByCarNum(rb.getCar_num());
		cs.sendCar(cb);
		
		return "send_car_list_sr";
	}
/////////////////取得單一據點的所有'已取車'要來還的訂單，再用還車時間分類
	@RequestMapping(path="/manager_zone/staff_zone/getCarBackOrders.controller")
	public String getCarBackOrders(HttpSession session,Model model) {
		///////////取得據點
		StaffBean sb=(StaffBean)session.getAttribute("staff_login_ok");
		if(sb==null) {
			return "index_sr";
		}
		String branch_name=sb.getBranch_name();
		//////////取得單一據點訂單
		List<Rental_orderBean> list=rs.getUnfinishedOrderInABranch(branch_name,"已取車","end");
		if(list!=null) {
			Calendar today=Calendar.getInstance();
			today.setTime(new Date());
			Calendar orderDate=Calendar.getInstance();
			List<Rental_orderBean> todayList=new ArrayList<>();		//////今日訂單
			List<Rental_orderBean> futureList=new ArrayList<>();	//////未來訂單
			List<Rental_orderBean> oldList=new ArrayList<>();		//////過期訂單
			
			for(Rental_orderBean rb:list) {
				Date eDate=rb.getEnd_date();	/////抓出[還車]時間
				orderDate.setTime(eDate);
				//////////抓出今日的訂單然後比較先後
				if(today.get(Calendar.YEAR)==orderDate.get(Calendar.YEAR) && today.get(Calendar.DAY_OF_YEAR)==orderDate.get(Calendar.DAY_OF_YEAR)) {
					todayList.add(rb);
				}else if(TimeUnit.DAYS.convert(new Date().getTime()-eDate.getTime(),TimeUnit.MILLISECONDS)>0) {
					///////////////如果今天已經超過了取車日期
					oldList.add(rb);
				}else {
					futureList.add(rb);
				}
			}
			if(todayList.size()!=0) {
				model.addAttribute("todayList",todayList);
			}
			if(futureList.size()!=0) {
				model.addAttribute("futureList",futureList);
			}
			if(oldList.size()!=0) {
				model.addAttribute("oldList",oldList);
			}
			model.addAttribute("no_order","沒有待處理的訂單");

			return "getback_car_list";

		}else {
			model.addAttribute("no_order","沒有待處理的訂單");
			return "getback_car_list";
		}
	}
//////////////////處理還車手續
	@RequestMapping(path="/manager_zone/staff_zone/dealOrderback.controller",method=RequestMethod.POST)
	public String dealOrderback(String id,Model model) {
		/////轉型id
		Integer orderId=null;
		try {
			orderId=Integer.valueOf(id);
		}catch(NumberFormatException e) {
			return "manager_login_sr";
		}
		/////////修改訂單、車的狀態並將車轉移到還車據點
		Rental_orderBean rb=rs.selectById(orderId);
		rs.getbackCar(rb);
		CarBean cb=cs.selectByCarNum(rb.getCar_num());
		cs.getbackCar(cb,rb.getEnd_branch_name());
		
		
		return "getback_car_list_sr";
	}
	
//////////////門市人員取消過期訂單
	@RequestMapping(path="/manager_zone/staff_zone/cancelOldOrder.controller",method=RequestMethod.POST)
	public String cancelOldOrder(String id,Model model) {
		Integer orderId=null;
		try {
			orderId=Integer.valueOf(id);
		}catch(NumberFormatException e) {
			return "send_car_list";
		}
		Rental_orderBean rb=rs.selectById(orderId);
		rs.memberCancelOrder(rb);
		
		return "send_car_list_sr";
	}
	
//////////////門市人員處理逾期還車+罰錢
	@RequestMapping(path="/manager_zone/staff_zone/dealOrderBackWithFine.controller",method=RequestMethod.POST)
	public String dealOrderBackWithFine(String id,Model model) {
		Integer orderId=null;
		try {
			orderId=Integer.valueOf(id);
		}catch(NumberFormatException e) {
			return "manager_login_sr";
		}
		Rental_orderBean rb=rs.selectById(orderId);
		model.addAttribute("oldPrice",rb.getPrice());
		
		CarBean cb=cs.selectByCarNum(rb.getCar_num());
		int price_day=cb.getPrice_day();
		/////根據逾期天數重新計算價錢+罰錢
		Rental_orderBean newOrder=rs.getBackCarWithFine(rb,price_day,1.33F);
		cs.getbackCar(cb,rb.getEnd_branch_name());
		
		long today=new Date().getTime();
		long endDate=rb.getEnd_date().getTime();
		long diffDays=TimeUnit.DAYS.convert(today-endDate,TimeUnit.MILLISECONDS);
		model.addAttribute("diffDays",diffDays);
		
		model.addAttribute("newPrice",newOrder.getPrice());
		
		return "get_back_car_with_fine";
	}
}
