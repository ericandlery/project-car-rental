package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.google.gson.Gson;

import model.branch.BranchBean;
import model.car.CarBean;
import model.car.CarService;
import model.friendlist.FriendlistBean;
import model.member.MemberBean;
import model.member.MemberService;
import model.pickup_order.Pickup_orderBean;
import model.pickup_order.Pickup_orderService;
import model.rental_order.Rental_orderBean;
import model.rental_order.Rental_orderService;
import model.wallethistory.WalletHistoryBean;
import model.wallethistory.WalletHistoryService;

@Controller
@RequestMapping
@SessionAttributes(names= {"login_ok","pw"})
public class MemberController {
	@Autowired
	private ServletContext ctx;
	@Autowired
	private MemberService ms;
	@Autowired
	private MemberBean mb;
	@Autowired
	private Rental_orderService rs;
	@Autowired
	private Rental_orderBean rb;
	@Autowired
	private FriendlistBean fb;
	@Autowired
	private WalletHistoryService ws;
	@Autowired
	private WalletHistoryBean wb;
	@Autowired
	private Pickup_orderService ps;
	@Autowired
	private Pickup_orderBean pb;
	@Autowired
	private CarBean cb;
	@Autowired
	private CarService cs;
	
	////////新增會員
	@RequestMapping(path="/member_registry/addNewMember.controller",method=RequestMethod.POST)
	public String addNewMember(@RequestParam(value = "file", required = false) MultipartFile file,HttpServletRequest request,
			MemberBean mb,String birthDate,Model model,
			@RequestParam(value="license_photo_t",required = false)CommonsMultipartFile license_photo)
					throws IOException, ServletException {
		///////轉換日期格式/////////重要!!!!!/////////////////////
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date date=sdf.parse(birthDate);
			mb.setBirth(date);
		} catch (ParseException e) {
//			System.out.println("failed");
			mb.setBirth(null);
		}
//因圖片部分----start	/////為方便測試，暫時先註解掉
		System.out.println("testtttt=  " + file);
		System.out.println("testtttt=  " + file);
		if(file.getSize()!=0) {   //
			String fileurl="";
			System.out.println("文件長度: " + file.getSize());
			System.out.println("文件類型: " + file.getContentType());
			System.out.println("文件名稱: " + file.getName());
			System.out.println("文件原名: " + file.getOriginalFilename());
			System.out.println("========================================");
			
			String realPath = request.getSession().getServletContext().getRealPath("/member_photo"); 
			File targetFile = new File(realPath);
			if(!targetFile.exists()){
				targetFile.mkdirs();
				System.out.println("創建資料夾="+targetFile);
			}
			System.out.println("realpath = "+realPath);
			int i = file.getOriginalFilename().lastIndexOf(".");// 返回最後一個點的位置
			String extension = file.getOriginalFilename().substring(i + 1);// 取出擴展名
			String filename =UUID.randomUUID().toString()+"."+extension;
			System.out.println("上傳檔案改名為 = "+ filename);
			//
			mb.setMem_photo(filename);
			//
			fileurl=filename;
			try {
				file.transferTo( new File(realPath, filename));
			}catch(IllegalStateException e){
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			
			mb.setMem_photo("demo.jpg");
			System.out.println("上傳的圖片 = null");
		}


//因圖片部分----end	
		//////////////////////////////////////////////////////
		if(mb.getEmail()==null || mb.getEmail().length()==0) {
			model.addAttribute("emailWrong","E-Mail不可以空白");
			return "member_registry";
		}else if(ms.selectByEmail(mb.getEmail())!=null) {
			model.addAttribute("emailWrong","有人用了");
			return "member_registry";	
		}else if(license_photo.getSize()==0) {
			model.addAttribute("license_photoWrong","請上傳您的駕照圖檔");
			return "member_registry";
		}
		else{
			/////////新增會員
			ms.addMember(mb);
			/////////會員駕照圖檔路徑
			String folder=(String)ctx.getAttribute("member_license_folder");
			//////上傳圖檔
			mb=ms.selectByEmail(mb.getEmail());
			File licensFile=new File(folder+mb.getId()+".jpeg");
//			if(!licensFile.exists()) {
				System.out.println(license_photo.getContentType());
				license_photo.transferTo(licensFile);
				//////輸入檔名到資料庫(用會員ID+jpeg)
				mb.setLicense_photo(String.valueOf(mb.getId())+".jpeg");
				ms.updateMember(mb);
//			}else {
//				System.out.println("Upload Failed.");
//			}
			
			String pw=new String(mb.getPassword());
			model.addAttribute("login_ok",mb);
			model.addAttribute("pw",pw);
			
		}
		return "reg_success";
	}

	////////會員登入
	@RequestMapping(path="/member_function/memberLogin.controller",method=RequestMethod.POST)
	public String memberLogin(MemberBean mb,Model model) {
		MemberBean testMb=ms.selectByEmail(mb.getEmail());
		if(testMb!=null) {
			if(new String(testMb.getPassword()).equals(new String(mb.getPassword()))) {
//				System.out.println("LOGIN!!!");
//				System.out.println(mb);
//				System.out.println(testMb);
				String pw=new String(testMb.getPassword());
				model.addAttribute("login_ok",testMb);
				model.addAttribute("pw",pw);
				return "index_sr";
			}
		}
		model.addAttribute("login_failed","帳號密碼錯誤");
//		System.out.println("FAILED");
		return "login";
	}
	////////查詢會員的目前訂單
	@RequestMapping(path="/member_function/activeOrder.controller",method=RequestMethod.GET)
	public String activeOrder(HttpServletRequest request,Model model) {
		HttpSession session=request.getSession();
		mb=(MemberBean)session.getAttribute("login_ok");
		if(mb==null) {
			return "login";
		}
		rb=rs.selectActiveOrderByMemId(mb.getId());
		if(rb!=null) {
		model.addAttribute("active_order",rb);
		return "inquire_active_orders";
		}else {
			model.addAttribute("no_order","您目前沒有訂單");
			return "inquire_active_orders";
		}
	}
	//////////查詢會員的歷史訂單紀錄
	@RequestMapping(path="/member_function/historyOrder.controller",method=RequestMethod.GET)
	public String historyOrder(HttpServletRequest request,Model model) {
		HttpSession session=request.getSession();
		mb=(MemberBean)session.getAttribute("login_ok");
		List<Rental_orderBean> list=rs.selectHistoryOrder(mb.getId());
		if(list!=null) {
			model.addAttribute("history_order",list);
			return "inquire_history_order";
		}else {
			model.addAttribute("no_history","您沒有租過車");
			return "inquire_history_order";
		}
	}
	///////////取消目前的(active)訂單///
	@RequestMapping(path="/member_function/cancelCurrentOrder.controller")
	public String cancelCurrentOrder(HttpServletRequest request,Model model) {
		mb=(MemberBean)request.getSession().getAttribute("login_ok");
		
		rb=rs.selectActiveOrderByMemId(mb.getId());
		
		////////判斷是否退錢到電子錢包
		if(rb.getPayment().equals("電子錢包")) {
			mb.setWallet(mb.getWallet()+rb.getPrice());
			ms.updateMember(mb);
		}
		
		rs.memberCancelOrder(rb);
		model.addAttribute("deleteOk","您的訂單已取消");
		return "inquire_active_orders";
	}
//	/////////加值電子錢包
//	@RequestMapping(path="/member_function/addWallet.controller",method=RequestMethod.POST)
//	public String addWallet(HttpServletRequest request,String credit,Model model) {
//		int intCredit;
//		try {
//		intCredit=Integer.valueOf(credit);
//		}catch(Exception e) {
//			model.addAttribute("no_text","請輸入數字");
//			return "wallet";
//		}
//		
//		mb=(MemberBean)request.getSession().getAttribute("login_ok");
//		ms.addCredit(mb,intCredit);
//		mb=ms.selectById(mb.getId());
//		model.addAttribute("login_ok",mb);
//		return "wallet";
//	}
	//////////////修改會員名單
	@RequestMapping(path="/member_function/updateMember.controller",method=RequestMethod.POST)
	public String updateMember(MemberBean mb,String tempBirth,Model model) {
		//////驗證日期格式
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date birth=null;
		try {
			birth=sdf.parse(tempBirth);
		} catch (ParseException e) {
			System.out.println("日期格式錯誤");
		}
		mb.setBirth(birth);
		mb.setRegistration_date((ms.selectById(mb.getId())).getRegistration_date());
		//先判斷更改後的欄位條件符合
		//做update
		ms.clearSession();
		Boolean suss = ms.updateMember(mb);
		if(suss) {
			MemberBean currentBean=ms.selectById(mb.getId());
			model.addAttribute("update", "會員資料修改成功");
			String pw=new String(currentBean.getPassword());
			model.addAttribute("login_ok",currentBean);
			model.addAttribute("pw",pw);
		}else {
			model.addAttribute("update", "會員資料修改失敗");
		}
		return "member_update_success";
	}
	//////////////搜尋好友
//	@ResponseBody
//	@RequestMapping(path="/member_function/searchFriend.controller")
//	public void searchFriend(HttpServletRequest request,HttpServletResponse resp,MemberBean mb,Model model) {
//		resp.setContentType("text/html;charset=utf-8");
//		return;
//	}
	//電子錢包
	@RequestMapping(path = "/member_function/addWallet.controller", method = RequestMethod.POST)
	public String addWallet(HttpServletRequest request, String credit, String creditcard01, String creditcard02,
			String creditcard03, String creditcard04, String creditcard05, Model model) {
		int intCredit;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		//日期轉字符串
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		String dateStringParse = sdf.format(date);
		System.out.println(dateStringParse);  
       
		String check = ws.check(creditcard01, creditcard02, creditcard03, creditcard04, creditcard05, credit);
		if(check=="checkok"){
//			try {				
				intCredit = Integer.valueOf(credit);			
//			} catch (Exception e) {
//				model.addAttribute("no_text", "請輸入金額 !!");
//				return "wallet";
//			}	    
			mb = (MemberBean) request.getSession().getAttribute("login_ok");
//			System.out.println(mb);
			int omg = ms.addCredit(mb,intCredit);
//			System.out.println("儲值了 :" + omg +"元");
			ws.addWalletHistory(mb.getId(),mb.getId_card(),omg,dateStringParse);
//			List<WalletHistoryBean> wb= ws.selectById(mb.getId());			
//			model.addAttribute("history","你 在 "+dateStringParse+" 儲值了  "+ omg +" 元");
//			model.addAttribute("history02",wb);
			mb = ms.selectById(mb.getId());
			model.addAttribute("login_ok", mb);
			model.addAttribute("ok", "儲值成功 !!");
		}else if(check=="checkerror01"){
			model.addAttribute("lengthcheck01", "請檢查卡號是否正確 !!");			
		}else if(check=="checkerror02"){
			model.addAttribute("lengthcheck02", "請檢查後三碼是否正確 !!");		
		}else if(check=="checkerror03"){
			model.addAttribute("lengthcheck03", "請檢查金額是否正確 !!");		
		}else if(check=="checkerror04"){
			model.addAttribute("lengthcheck01", "請輸入數字 !!");
		}else if(check=="checkerror05"){
			model.addAttribute("lengthcheck02", "請輸入數字 !!");
		}	
		return "wallet";
	}
		
	//電子錢包歷史紀錄
	@RequestMapping(path = "/member_function/WalletHistory.controller", method = RequestMethod.POST)
	public String addWallet(HttpServletRequest request, Model model) {
			mb = (MemberBean) request.getSession().getAttribute("login_ok");
			List<WalletHistoryBean> wb= ws.selectById(mb.getId());			
			model.addAttribute("history02",wb);		
	return "wallet";
	}
	
	@RequestMapping(path="/member_function/bonuspoint.controller",method=RequestMethod.POST)
	public String updateBonuspoint(HttpServletRequest request,Model model) {
		System.out.println("t111111111");
		MemberBean mbb=(MemberBean)request.getSession().getAttribute("login_ok");
		MemberBean mb=ms.updateBonusponit(mbb,2000);
		if(mb==null) {
			request.setAttribute("updateBonues","更新失敗");
		}else {
			request.setAttribute("updateBonues1","更新成功");
		}
		System.out.println("t6666666");
		return "bonuspoint";
	}
//	@RequestMapping(path="/member_function/checkPickupOrder.controller")
//	public String checkPickupOrder(Model model) {
//		return "check_pickup_order";
//	}
	
//////////////////查詢接送訂單
	@RequestMapping(path="/member_function/pickup/checkPickupOrder.controller")
	public String checkPickupOrder(String type,Model model,HttpSession session) {
		mb=(MemberBean)session.getAttribute("login_ok");
		if(mb==null) {
			return "login_sr";
		}
		
		if(type.equals("current")) {
			pb=ps.getCurrentOrder(mb.getId());
			if(pb!=null) {
				model.addAttribute("current_order",pb);
			}else {
				model.addAttribute("no_order","您目前沒有接送服務的訂單");
			}
			System.out.println(pb);
			return "current_order";
		}else {
			List<Pickup_orderBean> list=ps.getHistoryOrder(mb.getId());
			if(list!=null) {
				model.addAttribute("history_order",list);
			}else {
				model.addAttribute("no_order","您還沒有使用過接送服務");
			}
			
			return "history_pickup";
		}
	}
////////////////取消接送訂單，將狀態改為已取消(不刪除)
	@RequestMapping(path="/member_function/pickup/cancelPickupOrder.controller")
	public String cancelPickupOrder(String memId,Model model) {
		Integer id;
		try {
			id=Integer.valueOf(memId);
		}catch(NumberFormatException e) {
			model.addAttribute("cancel","無法刪除，請聯繫網站設計人員");
			return "current_order";
		}
		pb=ps.selectById(id);
		if(pb==null) {
			model.addAttribute("cancel","無法刪除，請聯繫網站設計人員");
			return "current_order";
		}
		cb=cs.selectByCarNum(pb.getCar_num());
		if(cb==null) {
			model.addAttribute("cancel","無法刪除，請聯繫網站設計人員");
			return "current_order";
		}
		
		ps.cancelPickupOrder(pb);
		cs.cancelOrFnishedPickupOrder(cb);
		
		model.addAttribute("cancel","您已經取消接送訂單");
		return "current_order";
	}
/////////////查詢會員狀態顯示在頁面上
	@ResponseBody
	@RequestMapping(path="/member_function/showMemState.controller")
	public void showMemState(HttpSession session,HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		mb=(MemberBean)session.getAttribute("login_ok");
		String json=null;
		if(mb!=null) {
			json=new Gson().toJson(mb.getMem_state());
		}else {
			json=new Gson().toJson("請重新登入");
		}
		
		out.print(json);
		out.flush();
		out.close();
		return;
	}
	////////上傳 會員更新的圖片
	@ResponseBody
	@RequestMapping(path="/member_function/memberphotochange.controller",method=RequestMethod.POST)
	public void memberphotochange(@RequestParam(value = "file", required = false) MultipartFile file,HttpServletRequest request,MemberBean mb,Model model,HttpServletResponse response) throws IOException {
		System.out.println("file = "+file);
		MemberBean mbb=(MemberBean)request.getSession().getAttribute("login_ok");
		
		if(file!=null) {   //
			String fileurl="";
			System.out.println("文件長度: " + file.getSize());
			System.out.println("文件類型: " + file.getContentType());
			System.out.println("文件名稱: " + file.getName());
			System.out.println("文件原名: " + file.getOriginalFilename());
			System.out.println("========================================");
			
			String realPath = request.getSession().getServletContext().getRealPath("/member_photo"); 
			File targetFile = new File(realPath);
			if(!targetFile.exists()){
				targetFile.mkdirs();
				System.out.println("創建資料夾="+targetFile);
			}
			System.out.println("realpath = "+realPath);
			int i = file.getOriginalFilename().lastIndexOf(".");// 返回最後一個點的位置
			String extension = file.getOriginalFilename().substring(i + 1);// 取出擴展名
			String filename =UUID.randomUUID().toString()+"."+extension;
			System.out.println("上傳檔案改名為 = "+ filename);
			//update user photo
			mbb.setMem_photo(filename);
			model.addAttribute("login_ok",mbb);
			response.getWriter().print(filename);
			response.getWriter().close();
			//
			fileurl=filename;
			try {
				file.transferTo( new File(realPath, filename));
			}catch(IllegalStateException e){
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			System.out.println("上傳的圖片 = null");
		}
		return ;
	}
/////////可以將圖片上傳至  images 資料夾內AJAX
//@ResponseBody
//@RequestMapping(path="/forum/uploadavataAJAX.controller",method=RequestMethod.POST)
//public void uploadAJAX(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, ModelMap model,HttpServletResponse response) throws IOException {
//	if(file!=null) {
//		String fileurl="";
//		System.out.println("文件長度: " + file.getSize());
//		System.out.println("文件類型: " + file.getContentType());
//		System.out.println("文件名稱: " + file.getName());
//		System.out.println("文件原名: " + file.getOriginalFilename());
//		System.out.println("========================================");
//		String realPath = request.getSession().getServletContext().getRealPath("/testtest");  
//		System.out.println("realpath="+realPath);
//		File targetFile = new File(realPath);
//		if(!targetFile.exists()){
//			targetFile.mkdirs();
//			System.out.println("創建資料夾");
//		}
//		System.out.println("realpath = "+realPath);
//		//改檔名
//		int i = file.getOriginalFilename().lastIndexOf(".");// 返回最後一個點的位置
//		String extension = file.getOriginalFilename().substring(i + 1);// 取出擴展名
//		String filename =UUID.randomUUID().toString()+"."+extension;
//		System.out.println("上傳檔案改名為 = "+ filename);
//		
//		try {
//			file.transferTo( new File(realPath, filename));////!!!!寫入檔案
//		}catch(IllegalStateException e){
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		response.getWriter().print(filename);
//		response.getWriter().close();
//	}else {
//		System.out.println("上傳的file = null");
//	}
//	return ;
//}


}
