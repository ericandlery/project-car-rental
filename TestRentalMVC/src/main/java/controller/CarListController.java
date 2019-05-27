package controller;


import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;

import model.branch.BranchBean;
import model.branch.BranchService;
import model.car.CarBean;
import model.car.CarService;
import model.car_category.Car_categoryBean;
import model.car_category.Car_categoryService;
import model.member.MemberBean;
import model.member.MemberService;
import model.model.ModelBean;
import model.model.ModelService;
import model.rental_order.Rental_orderBean;
import model.rental_order.Rental_orderService;

@Controller
@RequestMapping
@SessionAttributes(names="order")
public class CarListController {
	@Autowired
	private Car_categoryService ccs;
	@Autowired
	private Car_categoryBean ccb;
	@Autowired
	private ModelService ms;
	@Autowired
	private ModelBean mb;
	@Autowired
	private CarService cs;
	@Autowired
	private CarBean cb;
	@Autowired
	private MemberService mems;
	@Autowired
	private MemberBean memb;
	@Autowired
	private BranchService bs;
	@Autowired
	private BranchBean bb;
	@Autowired
	private Rental_orderService ros;
	
///////////////秀出所有的車種
	@RequestMapping(path= {"/car_list/showCategoryList.controller","/car_list/order/showCategoryList.controller"})
	public String showCategoryList(Model model) {
		List<Car_categoryBean> list=ccs.showCarCategory();
		if(list!=null) {
			model.addAttribute("list",list);
		}else {
			model.addAttribute("no","沒有車種");
		}
		
		return "all_category";
	}
//////////////秀出所有的車型
	@RequestMapping(path= {"/car_list/showModelList.controller","/car_list/order/showModelList.controller"})
	public String showModelList(Model model,Integer modelId) {
		///////////所有的車型
		if(modelId==null) {
		List<ModelBean> list=ms.showAllModel();
		model.addAttribute("categoryName","所有車種");
		if(list!=null) {
			
			model.addAttribute("list",list);
		}else {
			model.addAttribute("no","沒有車型");
		}
		System.out.println(modelId);

		return "all_model";

		}
		//////////依車種分類
		else {
			String categoryName=ccs.selectById(modelId).getName();
			model.addAttribute("categoryName",categoryName);
			
			List<ModelBean> list=ms.selectByCategoryId(modelId);
			if(list.size()!=0) {
				model.addAttribute("list",list);
			}else {
				model.addAttribute("no","沒有車型");
			}
			
			return "all_model";
		}
	}
//////////依車型ID秀出所有車款
	@RequestMapping(path="/car_list/showCarList.controller")
	public String showCarList(Model model,String id) {
		Integer modelId=null;
		try {
			modelId=Integer.valueOf(id);
		}catch(NumberFormatException e) {
			System.out.println("轉換數字錯誤");
			return "model_cars";
		}
		mb=ms.selectById(modelId);
		if(mb!=null) {
			model.addAttribute("model",mb);
		}else {
			model.addAttribute("nomodel","沒有該車型");
			return "model_cars";
		}
		
		List<CarBean> list=cs.selectByModelId(modelId);
		
		if(list.size()!=0) {
			model.addAttribute("list",list);
		}else {
			model.addAttribute("no","目前該車型還沒有開放出租");
		}
		
		
		return "model_cars";
	}
////////////檢查會員是否審核過了
	@ResponseBody
	@RequestMapping(path="/car_list/checkReviewd.controller")
	public void checkReviewd(HttpServletResponse resp,Integer mem_id) throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		memb=mems.selectById(mem_id);
		String state=null;
		if(memb==null) {
			
		}else {
			state=memb.getMem_state();
		}
		
		out.print(state);
		out.flush();
		out.close();
		return;
	}
//////////下訂單，存車牌號碼之後選擇起終點時間付款方式
	@RequestMapping(path="/car_list/saveCarNum.controller",method=RequestMethod.POST)
	public String saveCarNum(Model model,Rental_orderBean rb,Integer modelId) {
		//////////驗證會員駕照等級
		
		String memLevel=mems.selectById(rb.getMemid()).getLicense_leval();///會員駕照等級
		if(memLevel==null) {
			System.out.println("系統異常");
			return "index_sr";
		}
		
		mb=ms.selectById(modelId);
		int cateId=mb.getCategory_id();////該車型的Category Id
		
//		System.out.println("您的駕照："+ccs.compareLevel(memLevel, cateId));////true表示合格，false表示沒過
		if(ccs.compareLevel(memLevel, cateId)==true) {
			//////////若等級夠，便繼續
			model.addAttribute("model",mb);
			model.addAttribute("order",rb);
			
			return "save_car_num";
		}else {
			/////////若駕照等級不夠，便幫他返回車種列表重新選擇
			return "license_not_enough";
		}
		
	}
//////////Ajax取得所有據點
	@ResponseBody
	@RequestMapping(path= {"/car_list/getAllBranchs.controller","/car_list/order/getAllBranchs.controller"})
	public void getAllBranchs(HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html;charset=UTF-8");  
		PrintWriter out=resp.getWriter();
		
		List<BranchBean> list=bs.selectAll();
		if(list.size()!=0) {
			String json=new Gson().toJson(list);
			out.print(json);
		}else {
			out.print("");
		}

		out.flush();
		out.close();
		return;
		
	}
///////////驗證、確認訂單
	@RequestMapping(path= {"/car_list/acceptOrder.controller","/car_list/order/acceptOrder.controller"},method=RequestMethod.POST)
	public String acceptOrder(Rental_orderBean rb,String start_dateX,String end_dateX,HttpSession session,Model model) {
		memb=(MemberBean)session.getAttribute("login_ok");
		Rental_orderBean order=(Rental_orderBean)session.getAttribute("order");
		///////驗證會員資格、狀態
		if(order==null || memb==null) {
			return "index_sr";
		}
		if(!memb.getMem_state().equals("良好")) {
			model.addAttribute("dataError","您還沒有通過審查，請先通過再使用此功能");
			return "save_car_num";
		}
		///////////驗證使用者輸入的日期
		if(start_dateX==null) {
			start_dateX="";
		}
		if(end_dateX==null) {
			end_dateX="";
		}
//		if(start_dateX.matches("\\d{4}-\\d{2}-\\d{2}")==false || end_dateX.matches("\\d{4}-\\d{2}-\\d{2}")==false){
//			model.addAttribute("dataError","請輸入正確的日期格式(\"YYYY-MM-DD\")");
//			System.out.println("日期轉型失敗");
//			return "save_car_num";
//		}
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date dateS=null;
		Date dateE=null;
		try {
			dateS=sdf.parse(start_dateX);
			dateE=sdf.parse(end_dateX);
		}catch(ParseException e) {
			model.addAttribute("dataError","請輸入正確的日期格式(\"YYYY-MM-DD\")");
			System.out.println("日期轉型失敗");
			return "save_car_num";
		}
		Date today=new Date();
		int startDiff=(int)TimeUnit.HOURS.convert(dateS.getTime()-today.getTime(),TimeUnit.MILLISECONDS);
		System.out.println(startDiff);
		if(startDiff<0 || startDiff>192) {
			model.addAttribute("dataError","借車日期以隔天開始算起七日內為限");
			return "save_car_num";
		}		
		int days=(int)TimeUnit.DAYS.convert(dateE.getTime()-dateS.getTime(),TimeUnit.MILLISECONDS);
		if(days<1) {
			model.addAttribute("dataError","還車日期不可在取車日期之前，且必須至少隔一天");
			return "save_car_num";
		}
		int endDiff=(int)TimeUnit.HOURS.convert(dateE.getTime()-dateS.getTime(),TimeUnit.MILLISECONDS);
		if(endDiff<0 || endDiff>192) {
			model.addAttribute("dataError","租借時間以七日內為限");
			return "save_car_num";
		}
		///////////驗證還車據點
		if(rb.getEnd_branch_name()==null) {
			model.addAttribute("dataError","請輸入還車據點");
			return "save_car_num";
		}
		////////驗證電子錢包
		if(rb.getPayment()==null) {
			model.addAttribute("dataError","請選擇付款方式");
			return "save_car_num";
		}
		
		//////////依租借日期計算價錢
		cb=cs.selectByCarNum(order.getCar_num());
		int price=cb.getPrice_day();
		int totalPrice=days*price;
		/////////////驗證完畢，輸入至訂單
		order.setEnd_branch_name(rb.getEnd_branch_name());
		order.setPayment(rb.getPayment());
		order.setStart_date(dateS);
		order.setEnd_date(dateE);
		order.setPrice(totalPrice);
		order.setOrder_date(new Date());
		System.out.println(order);
		///////檢查電子錢包夠不夠
		if(rb.getPayment().equals("電子錢包")) {
			boolean b=ros.checkWalletPay(order,memb);
			if(b==false) {
				model.addAttribute("dataError","您的電子錢包餘額不足，請先儲值或用其他付款方式");
				return "save_car_num";
			}
			
		}
			
		////////////電子錢包扣款
		String wallet=null;
		if(rb.getPayment().equals("電子錢包")) {
			wallet="wallet";
		}else{
			wallet="paynow";
		}
		
		Rental_orderBean result=ros.addNewOrder(order,memb,wallet);
		if(result==null) {
			model.addAttribute("dataError","您已經有訂單在身了，請先結束目前的訂單才能下別張");
			return "save_car_num";
		}else {
			return "order_success";
		}
	}
}
