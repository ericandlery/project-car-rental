package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.google.gson.Gson;

import model.branch.BranchBean;
import model.branch.BranchService;
import model.car.CarBean;
import model.car.CarDAO;
import model.car.CarService;
import model.model.ModelBean;
import model.model.ModelService;

@Controller
@RequestMapping
@SessionAttributes
public class CarController {
	@Autowired
	private BranchService bs;
	@Autowired
	private BranchBean bb;
	@Autowired
	private CarService cs;
	@Autowired
	private CarBean cb;
	@Autowired
	private ServletContext ctx;
	@Autowired
	private ModelService ms;
	@Autowired
	private ModelBean mb;
	
/////新
	@RequestMapping(path="/manager_zone/allcarC.controller",method=RequestMethod.POST)
	public String CarC(CarBean cb,int newX,String production_dateB,String model_idX,String mileageX,String price_dayX
			,String rateX,String rate_countX,Model model) throws IllegalStateException, IOException, InterruptedException{	
		     
		    System.out.println("11211111111111111111="+model_idX);
//			Integer id=null;
//			try{
//				id=Integer.valueOf(model_idX);
//			}catch(NumberFormatException e){
//				System.out.println("failed");
//				return "car_list_reset";
//			}

		
		     if(model_idX==null||model_idX.equals("noSelect")||mileageX.isEmpty()||price_dayX.isEmpty()||rateX.isEmpty()||rate_countX.isEmpty()){
		    	 model.addAttribute("message", "Message : 請 勿 空 白 !!");
		    	 return "car_list_reset";
		     }else if((model_idX.matches("^[0-9]*$"))==false||(mileageX.matches("^[0-9]*$"))==false||(price_dayX.matches("^[0-9]*$"))==false||
		    		 (rateX.matches("^[0-9]*$"))==false||(rate_countX.matches("^[0-9]*$"))==false){
		    	 model.addAttribute("message", "Message : 車型ID,里程數,價錢,總評分,評分次數,請 輸 入 數 字 !!");
		    	 return "car_list_reset";
		     }
		     
				if (newX == 1) {
//					String folder=(String)ctx.getAttribute("CarFolder");
////					cb=cs.selectByCarNum(cb.getCar_num());
//					File carfile=new File(folder+cb.getCar_num()+".jpeg");
//					if(!carfile.exists()) {
//						car_photo.transferTo(carfile);
//						cb.setCar_photo(String.valueOf(cb.getCar_num())+".jpeg");
//					}
//					TimeUnit.SECONDS.sleep(2);
					String check = cs.insertCar(cb,production_dateB,model_idX,mileageX,price_dayX,rateX,rate_countX);
					if(check.equals("DateError")){
						model.addAttribute("message", "Message : 日期格式錯誤");
					}else if(check.equals("OK")){
						model.addAttribute("message", "Message : 新增成功");
					}else if(check.equals("NOTOK")){
						model.addAttribute("message", "Message : 車牌號碼不得重複");
					}
				}else if (newX==2){
//					String folder=(String)ctx.getAttribute("CarFolder");
//					cb=cs.selectByCarNum(cb.getCar_num());
//					File carfile=new File(folder+cb.getCar_num()+".jpeg");
//					if(!carfile.exists()) {
//						car_photo.transferTo(carfile);
//						cb.setCar_photo(String.valueOf(cb.getCar_num())+".jpeg");
//					}
//					TimeUnit.SECONDS.sleep(2);
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					Date dt1;
					try {
						dt1 = sdf.parse(production_dateB);
						cb.setProduction_date(dt1);
						System.out.println("dt1=" + dt1);
					} catch (ParseException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						System.out.println("dt1=error");
						return "DateError";			
					}	
					
					cb.setModel_id(Integer.valueOf(model_idX));
					cb.setMileage(Integer.valueOf(mileageX));
					cb.setPrice_day(Integer.valueOf(price_dayX));
					cb.setRate(Integer.valueOf(rateX));
					cb.setRate_count(Integer.valueOf(rate_countX));
					cs.update2(cb);			
					model.addAttribute("message", "Message : 更新成功");
//					String checkU = cs.updateCar(cb,production_dateB,model_idX,mileageX,price_dayX,rateX,rate_countX);
//					if(checkU.equals("DateError")){
//						model.addAttribute("message", "日期格式錯誤");
//					}else if(checkU.equals("OK")){
//						model.addAttribute("message", "更新成功");
//					}else if(checkU.equals("NOTOK")){
//						model.addAttribute("message", "車牌號碼不得重複");
//					}
				}
		     
		     
		     
		     
		     
		     
		     
			

			return "car_list_reset";
		}
	
	
	/////刪
	@RequestMapping(path="/manager_zone/allcarD.controller",method=RequestMethod.GET)
	public String CarD(HttpServletRequest request,CarBean cb,String allcarNum,Model model) {
		cs.delete(allcarNum);		
		return "car_list_reset";
	}
	
	/////修
	@RequestMapping(path="/manager_zone/allcarU.controller",method=RequestMethod.GET)
	public String CarE(HttpServletRequest request,CarBean cb,String allcarNumU,Model model) {
		CarBean ty = cs.selectByCarNum(allcarNumU);
		model.addAttribute("CarE", ty);
		return "car_list_reset";
	}
	
	////AJAX 自動新增select據點
	@ResponseBody //如果要調用AJAX需寫這行
	@RequestMapping(path= {"/manager_zone/searchBranchSS.controller"})
	public void selectBranch(HttpServletResponse resp) throws IOException {
		System.out.println("1231321321321321321321321321321");
		resp.setContentType("text/html;charset=UTF-8"); //設定編碼  
		PrintWriter out=resp.getWriter();               //設定印出
		List<BranchBean> list=bs.selectAll();           //抓取據點資料庫
		System.out.println(list);
		
		if(list.size()!=0) {
			String json=new Gson().toJson(list);        //把list存入json裡
			out.print(json);                            //印出json
		}else {
			out.print("");
		}

		out.flush();//送出暫存資料..確保json印出
		out.close();//關閉
		return;
		
	}
	
	////AJAX 自動新增select車型
	@ResponseBody //如果要調用AJAX需寫這行
	@RequestMapping(path= {"/manager_zone/searchModelSS.controller"})
	public void selectmodelid(HttpServletResponse resp) throws IOException {
		System.out.println("4586544654564564654564");
		resp.setContentType("text/html;charset=UTF-8"); //設定編碼  
		PrintWriter out=resp.getWriter();               //設定印出
		List<ModelBean> list=ms.selectAll();           //抓取據點資料庫
		System.out.println(list);
		
		if(list.size()!=0) {
			String json=new Gson().toJson(list);        //把list存入json裡
			out.print(json);                            //印出json
		}else {
			out.print("");
		}

		out.flush();//送出暫存資料..確保json印出
		out.close();//關閉
		return;
		
	}


	

}
