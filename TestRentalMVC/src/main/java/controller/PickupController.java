package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.annotation.processing.SupportedOptions;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.annotations.SQLUpdate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.airfield.AirfieldBean;
import model.airfield.AirfieldService;
import model.car.CarBean;
import model.car.CarService;
import model.driver.DriverBean;
import model.driver.DriverService;
import model.member.MemberBean;
import model.member.MemberService;
import model.model.ModelService;
import model.pickup_order.Pickup_orderBean;
import model.pickup_order.Pickup_orderService;

@Controller
@RequestMapping
public class PickupController {
	@Autowired
	private AirfieldService as;
	@Autowired
	private ModelService ms;
	@Autowired
	private MemberService members;
	@Autowired
	private MemberBean mb;
	@Autowired
	private CarService cs;
	@Autowired
	private DriverService ds;
	@Autowired
	private Pickup_orderService ps;
	@Autowired
	private Pickup_orderBean pb;
	@Autowired
	private CarBean cb;
	@Autowired
	private DriverBean db;

//////////////////傳回所有機場
	@ResponseBody
	@RequestMapping(path="/pickup_service/airfield/selectType.controller")
	public void selectType(HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		
		List<AirfieldBean> list=as.selectAll();
		String json=new Gson().toJson(list);
		
		out.println(json);
		out.flush();
		out.close();
		return;
	}
////////////////傳回所有普通房車的座位數
	@ResponseBody
	@RequestMapping(path="/pickup_service/airfield/getAllSeat.controller")
	public void getAllSeat(HttpServletResponse resp,String category) throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
				
		List<Integer> list=ms.showAllSeat(category);
		String json=new Gson().toJson(list);
		
		out.println(json);
		out.flush();
		out.close();
		return;
	}
//////////////根據使用者選擇的座位數傳回車型
	@ResponseBody
	@RequestMapping(path="/pickup_service/airfield/getAllModelsBySeat.controller")
	public void getAllModelsBySeat(HttpServletResponse resp,String category,String seatCount) throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		
		Integer seat;
		try {
			seat=Integer.valueOf(seatCount);
		}catch(NumberFormatException e) {
			return;
		}
		//////所有同座位數的ModelBean並且用Brand分類
		List<List> list=ms.showAllModelCarsOrderByCategory(seat, category);
		//////////////////////
		
		
		//////////////////////
		String json=new Gson().toJson(list);
		
		out.println(json);
		out.flush();
		out.close();
		return;
	}
////////////////傳回廠牌名字
//	@ResponseBody
//	@RequestMapping(path="/pickup_service/airfield/getAllBrandsBySeat.controller")
//	public void getAllBrandsBySeat(HttpServletResponse resp) throws IOException {
//		resp.setContentType("text/html;charset=utf-8");
//		PrintWriter out=resp.getWriter();
//		
//		String json=new Gson().toJson("test double ajax");
//		
//		out.println(json);
//		out.flush();
//		out.close();
//		return;
//	}
	
/////////////////////////////////
////////////////接受機場接送服務訂單、驗證
//	@RequestMapping(path="/pickup_service/airfield/addNewPickupOrder.controller",method=RequestMethod.POST)
//	public String addNewPickupOrder() {
//		System.out.println("Kimi");
//		return "airfield_service";
//	}
///////////////顯示會員電子錢包餘額
	@ResponseBody
	@RequestMapping(path="/pickup_service/airfield/showWallet.controller")
	public void showWallet(HttpServletResponse resp,HttpSession session) throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		MemberBean mb=(MemberBean)session.getAttribute("login_ok");
		if(mb==null) {
			out.println("尚未登入");
			out.flush();
			out.close();
			return;
		}else {
			int credit=mb.getWallet();
			
			out.println(credit);
			out.flush();
			out.close();
		return;
		}
	}
////////////////////根據距離及車種做價格試算
	@ResponseBody
	@RequestMapping(path="/pickup_service/airfield/testPrice.controller")
	public void testPrice(HttpServletResponse resp,HttpSession session,String modelId,String car_state) throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		Integer id=null;
		try {
			id=Integer.valueOf(modelId);
		}catch(NumberFormatException e) {
			out.println("error");
			out.flush();
			out.close();
			return;
		}
		
		List<CarBean> list=cs.getCarsByModelId(id,car_state);
		/////////////隨機取得車輛的對應價錢
		if(list==null) {
			out.println("error");
			out.flush();
			out.close();
			return;
		}
		
		int randomId=list.size();
		CarBean cb=(CarBean)list.get((int)Math.floor(Math.random()*randomId));
				
		out.println(cb.getPrice_day());
		out.flush();
		out.close();
		return;
	}
///////////////////接受、驗證訂單
	@RequestMapping(path="/pickup_service/airfield/acceptPickupOrder.controller")
	public String acceptPickupOrder(String select_type,String start,String end,
									String address,String work_day,String work_time,
									String modelId,String payment,String car_state,String km,Model model,HttpSession session) {
		Calendar cal=Calendar.getInstance();
		////////////////檢查會員登入狀況
		MemberBean mb=(MemberBean)session.getAttribute("login_ok");
		if(mb==null) {
			return "index_sr";
		}
		//////////檢查會員資格
		if(!mb.getMem_state().equals("良好")) {
			model.addAttribute("order","請等到審查通過才能使用此服務");
			return "airfield_service";
		}
		
		////////////檢查會員目前有沒有訂單，有的話返回
		if(ps.checkCurrentOrder(mb.getId())) {
			model.addAttribute("order","您目前已經有接送訂單了，在這張訂單前不可以重覆下");
			return "airfield_service";
		}
		
		
		Timestamp date=null;	////////出發日期
		Timestamp time=null;	////////出發時間
		
//		Pickup_orderBean pb=new Pickup_orderBean();
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timeFormat=new SimpleDateFormat("HH:mm");
		Map<String,String> errors=new HashMap<>();
		model.addAttribute("errors",errors);
		///////////////驗證表單
		if(select_type==null || select_type.length()==0) {
			errors.put("select_type","請選擇接機還是送機");
		}
		if(start==null || start.length()==0) {
			errors.put("start","請選擇出發地");
		}
		if(end==null || end.length()==0) {
			errors.put("end","請選擇目的地");
		}
		if(address==null || address.length()==0) {
			errors.put("address","請填寫地址");
		}
		if(work_day==null || work_day.length()==0) {
			errors.put("work_day","請選擇出發日期");
		}
		if(work_time==null || work_time.length()==0) {
			errors.put("work_time","請選擇出發時間");
		}
		if(modelId==null || modelId.length()==0) {
			errors.put("modelId","請選擇車型");
		}
		if(payment==null || payment.length()==0) {
			errors.put("payment","請選擇付款方式");
		}
		/////////////驗證日期時間格式，同時設定要輸入至訂單的日期時間
		try {
		Date tempDate=dateFormat.parse(work_day);
		date=new Timestamp(tempDate.getTime());
		}catch(ParseException e) {
			errors.put("work_day","請輸入正確的日期格式");
		}
		try {
		Date tempTime=timeFormat.parse(work_time);
		time=new Timestamp(tempTime.getTime());
		}catch(ParseException e) {
			errors.put("work_time","請輸入正確的時間格式");
		}
		
		////////////驗證日期時間有沒有0
		String[] dayString=work_day.split("-");
		for(int i=0;i<dayString.length;i++) {
			try {
				Integer.valueOf(dayString[i]);
			}catch(NumberFormatException e) {
				errors.put("work_day","請輸入正確的日期格式");
				return "airfield_service"; 
			}
			if(Integer.valueOf(dayString[i])==0) {
				errors.put("work_day","請輸入正確的日期格式");
				return "airfield_service"; 
			}
		}
		
		
		
		///////////將傳入的文字ID轉型數字
		Integer id=null;
		Integer distance=0;
		try {
			id=Integer.valueOf(modelId);
			distance=Integer.valueOf(km);
		}catch(NumberFormatException e) {
			errors.put("number","系統異常，請等待修復");
		}
		///////////尋找可提供的車款(用車型ID和狀態"良好")
		List<CarBean> carList=cs.getCarsByModelId(id,car_state);
		if(carList==null) {
			errors.put("modelId","目前無法提供該車款，請選擇其它車款");
		}
		//////////若有錯便終止下單，回傳錯誤訊息
		if(errors.size()!=0) {
			model.addAttribute("errors",errors);
			return "airfield_service";
		}
		/////////////比較日期時間，出發日期必須過一天以後，驗證沒過便傳回前頁
		
		Long today=new Date().getTime();
		int hoursDiff=(int)TimeUnit.HOURS.convert(date.getTime()-today,TimeUnit.MILLISECONDS);
		//////////超過一天就返回
		if(hoursDiff<0) {
			model.addAttribute("date_error","請選擇至少明天以後的日期");
			return "airfield_service";
		}
		/////////超過七天也返回
		if(hoursDiff>168) {
			model.addAttribute("date_error","最多只能提前一個禮拜預約");
			return "airfield_service";
		}
		
		///////////"隨機"挑選可以提供的車輛
		int totalCar=carList.size();
		cb=carList.get((int)Math.floor(Math.random()*totalCar));
		//////////"隨機"挑選可以做接送服務(閒置中)的司機
		List<DriverBean> driverList=ds.selectAll();
		
		do {
			if(driverList.size()==0) {
				break;
			}
			db=driverList.remove((int)Math.floor(Math.random()*driverList.size()));
		}while(ps.checkWorkDay(work_day,db.getId()));
		
		if(db.getId()!=null) {
			System.out.println("有找到司機");
			if(!ps.checkWorkDay(work_day,db.getId())) {
				pb.setDriver_id(db.getId());
			}else {
				errors.put("no_driver","當天沒有司機可以接送了，請選擇其它日期");
				model.addAttribute("errors",errors);
				return "airfield_service";
			}
		}else {
			errors.put("no_driver","當天沒有司機可以接送了，請選擇其它日期");
			model.addAttribute("errors",errors);
			return "airfield_service";
		}
		
//		if(ps.checkWorkDay(work_day,db.getId())) {
//			errors.put("no_driver","當天沒有司機可以接送了，請選擇其它日期");
//			model.addAttribute("errors",errors);
//			return "airfield_service";
//		}else {
//			System.out.println("PASSED");
//		}
		
//		List<DriverBean> idleDriverList=ds.getAllIdleDrivers();
//		int randomDriver=idleDriverList.size();
		///////////若沒有司機，便返回
//		if(randomDriver==0) {
//			errors.put("no_driver","目前沒有司機可以接送了，請過幾天再回來");
//			model.addAttribute("errors",errors);
//			return "airfield_service";
//		}
		
		///"挑出"要接這個單的司機
//		DriverBean db=idleDriverList.get((int)Math.floor(Math.random()*randomDriver));
		//////////判斷接機還是送機，以設定起點終點
		if(select_type.equals("接機")) {
			////接機
			////轉型
			Integer startId=null;
			try {
				startId=Integer.valueOf(start);
			}catch(NumberFormatException e) {
				System.out.println("系統異常(接機)");
				return "airfield_service";
			}
			pb.setStart_location(as.selectById(startId).getName());
			pb.setEnd_location(address);
		}else {
			////送機
			///轉型
			Integer endId=null;
			try {
				endId=Integer.valueOf(end);
			}catch(NumberFormatException e) {
				System.out.println("系統異常(送機)");
				return "airfield_service";
			}
			pb.setStart_location(address);
			pb.setEnd_location(as.selectById(endId).getName());
		}

		//////////////////////修改訂單資料
		pb.setMem_id(mb.getId());
		pb.setCar_num(cb.getCar_num());
//		pb.setDriver_id(db.getId());
		pb.setStart_date(new Timestamp(date.getTime()));
		pb.setStart_time(new Timestamp(time.getTime()));
		pb.setPrice(cb.getPrice_day()+distance);
		
		////////////決定付款方式
			if(payment.equals("wallet")) {
				System.out.println("你用電子付款");
				if(mb.getWallet()>=pb.getPrice()) {
					System.out.println("錢包夠多");
					mb.setWallet(mb.getWallet()-pb.getPrice());
					pb.setPayment("電子錢包");
					members.updateMember(mb);
				}else {
					errors.put("wallet","您的電子錢包餘額不夠，請先儲值或是使用其它付款方式");
					return "airfield_service";
				}
				
			}else {
				pb.setPayment("現場付款");
				System.out.println("現場付!");
			}
		
		
		/////////////////////新增訂單並修改車款資料
		cs.acceptPickupOrder(cb);
		ps.addNewOrder(pb);
		//////////////接送服務下單Service
		
		return "new_order_sr";
	}
	
/////////////////////顯示會員剛下的訂單明細
	@RequestMapping(path="/pickup_service/airfield/showPickupOrderDetails.controller")
	public String showPickupOrderDetails(HttpSession session,Model model) {
		mb=(MemberBean)session.getAttribute("login_ok");
		/////驗證登入
		if(mb==null) {
			return "login";
		}
		List<Pickup_orderBean> list=ps.selectByMemId(mb.getId());
		
		
		return "new_order";
	}
////////////////////顯示所有接送訂單
	@RequestMapping(path="/manager_zone/pickup_manager/showPickupOrderList.controller")
	public String showPickupOrderList(Model model) {
		List<Pickup_orderBean> list=ps.selectAll();
		if(list!=null) {
			model.addAttribute("pickup_list",list);
		}else {
			model.addAttribute("no_list","目前沒有任何接送訂單");
		}
		
		return "pickup_list";
	}
}
