package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.branch.BranchBean;
import model.branch.BranchService;
import model.car.CarBean;
import model.car.CarService;
import model.car_category.Car_categoryBean;
import model.car_category.Car_categoryService;
import model.member.MemberBean;
import model.model.ModelBean;
import model.model.ModelService;
import model.rental_order.Rental_orderBean;
import model.rental_order.Rental_orderService;

@Controller
@RequestMapping
public class RentCarController {
	@Autowired
	private CarService cs;
	@Autowired
	private CarBean cb;
	@Autowired
	private BranchService bs;
	@Autowired
	private Rental_orderService rs;
	@Autowired
	private ModelBean modelb;
	@Autowired
	private ModelService models;
	@Autowired
	private Car_categoryBean ccb;
	@Autowired
	private Car_categoryService ccs;
//	@ResponseBody
//	@RequestMapping(path="/rent_car_function/make_reservation/findAvailableCarsByDate.controller",method=RequestMethod.GET)
//	public String findAvailableCarsByDate(String start_date,String end_date) {
//		
//		
//		return start_date+" "+end_date;
//
//	}
	///////////////AJAX取得起點據點中可以借的車的JSON物件
	@ResponseBody
	@RequestMapping(path="/rent_car_function/make_reservation/findAvailableCars.controller")
	public String findAvailableCars(String start_branch_name,String end_branch_name,String start_date,String end_date,String car_state,HttpServletResponse resp){
		resp.setContentType("text/html;charset=utf-8");
//		int stbId;
		Map<String,String> error=new HashMap<>();
//		try {
//			stbId=Integer.parseInt(start_branch_id);
//		}catch(NumberFormatException e) {
//			//////////輸入格式錯誤
//			error.put("error","Invalid Number");
//			String errorJson=new Gson().toJson(error);
//			return errorJson;
//		}
		
		List<CarBean> list= cs.selectAvailableCarsInABranch(start_branch_name, car_state);
		if(list!=null) {
			String carJson=new Gson().toJson(list);
			return carJson;
		}else {
			/////////沒有可以租的車
			error.put("error","抱歉，目前該據點沒有車可以出租了");
			String errorJson=new Gson().toJson(error);
			return errorJson;
		}
	}
	//////////////AJAX取得所有據點的JSON物件
	@ResponseBody
	@RequestMapping(path="/rent_car_function/make_reservation/findAllBranchs.controller")
	public void findAllBranchs(HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		////////////////注意!!中文亂碼問題解決方法
		Map<String,String> error=new HashMap<>();
		List<BranchBean> list=bs.selectAll();
		if(list!=null) {
			String json=new Gson().toJson(list);
			resp.getWriter().println(json);
			resp.getWriter().flush();
			resp.getWriter().close();
			return;
		}else {
			error.put("error","沒有據點!");
			String json=new Gson().toJson(error);
			resp.getWriter().println(json);
			resp.getWriter().flush();
			resp.getWriter().close();
			return;
		}
	}
///////////////////下訂單、驗證資料、若錯誤便傳回錯誤訊息
	@ResponseBody
	@RequestMapping(path="/rent_car_function/make_reservation/addNewOrder.controller",method=RequestMethod.POST)
	public void addNewOrder(Rental_orderBean rb,String sd,String ed,String wallet,Model model,HttpServletResponse resp,HttpSession session) throws IOException {
		System.out.println(wallet);
		//////////
		
		
		///////////
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		Map<String,String> error=new HashMap<>();
		Map<String,String> ok=new HashMap<>();
		Date today=new Date();
		String json;
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date start_date=null,end_date=null;
		try {
		start_date=sdf.parse(sd);
		end_date=sdf.parse(ed);
		}catch(ParseException e) {
			error.put("error","請輸入有效的日期格式");
			json=new Gson().toJson(error);
			out.println(json);
			out.flush();
			out.close();
			return;
		}
		long diffDaysStartNow=start_date.getTime()-new Date().getTime();	///////預約日期跟今天的天數差(毫秒)
		long diffDaysEndStart=end_date.getTime()-start_date.getTime();		///////還車日期與租車日期的天數差(毫秒)
		
		if(!start_date.after(today)) {
			error.put("error","您只能從隔天開始預約");
			
			json=new Gson().toJson(error);
			out.println(json);
			out.flush();
			out.close();
			return;
		}else if(TimeUnit.DAYS.convert(diffDaysStartNow,TimeUnit.MILLISECONDS)>7) {
			error.put("error","預約日期不可超過七天");
			
			json=new Gson().toJson(error);
			out.println(json);
			out.flush();
			out.close();
			return;
		}else if(!end_date.after(start_date)){
			error.put("error","還車日期不可在取車日期之前");
			
			json=new Gson().toJson(error);
			out.println(json);
			out.flush();
			out.close();
			return;
		}else if(TimeUnit.DAYS.convert(diffDaysEndStart,TimeUnit.MILLISECONDS)>7) {
			error.put("error","還車日期與租車日期不可以超過七天");
			
			json=new Gson().toJson(error);
			out.println(json);
			out.flush();
			out.close();
			return;
		}else {
			MemberBean mb=(MemberBean)session.getAttribute("login_ok");
			/////////檢查登入
			if(mb==null) {
				error.put("error","請重新登入");
				json=new Gson().toJson(error);
				out.println(json);
				out.flush();
				out.close();
				return;
			}
			
			//////////檢查會員狀態是否良好
			if(!mb.getMem_state().equals("良好")) {
				error.put("error","請先等審核過關才能使用此服務");
				json=new Gson().toJson(error);
				out.println(json);
				out.flush();
				out.close();
				return;
			}
			//////////檢查會員駕照資格夠不夠
			String memLevel=mb.getLicense_leval();
			cb=cs.selectByCarNum(rb.getCar_num());
			int cateId=models.selectById(cb.getModel_id()).getCategory_id();
			if(!ccs.compareLevel(memLevel,cateId)) {
				error.put("error","您的駕照等級不夠開這台車喔，請選擇其它台");
				json=new Gson().toJson(error);
				out.println(json);
				out.flush();
				out.close();
				return;
			}
			
			///////////////////////
			rb.setStart_date(start_date);
			rb.setEnd_date(end_date);
			////////////資料格式驗證完後新增訂單
			//////////檢查付款方式及餘額夠不夠
			if(wallet.equals("wallet")) {
				boolean b=rs.checkWalletPay(rb,mb);
			
				if(b==false) {
					error.put("error","您的電子錢包餘額不夠，請先加值或選擇其它付款方式");
					
					json=new Gson().toJson(error);
					out.println(json);
					out.flush();
					out.close();
					return;
				}
			}
			///////////////////驗證及新增訂單
			Rental_orderBean returnRb=rs.addNewOrder(rb, mb,wallet);
			

			
			if(returnRb==null) {
				error.put("error","您目前已經有訂單了，在這張訂單結束前不可以下別張訂單");
				
				json=new Gson().toJson(error);
				out.println(json);
				out.flush();
				out.close();
				return;
			}else {	
				
				ok.put("ok","下單成功，請進會員專區查看訂單");
				json=new Gson().toJson(ok);
				out.println(json);
				out.flush();
				out.close();
				return;
			}
			
		}
		
	}
///////////////提醒使用者目前仍有單在身
	@ResponseBody
	@RequestMapping(path="/rent_car_function/make_reservation/checkActive.controller")
	public void checkActive(HttpServletResponse resp,HttpSession session) throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		MemberBean mb=(MemberBean)session.getAttribute("login_ok");
		Rental_orderBean rb=rs.selectActiveOrderByMemId(mb.getId());
		
		if(rb!=null) {
			out.print("true");
		}else {
			out.print("false");
		}
		out.flush();
		out.close();
		return;
	}
}
