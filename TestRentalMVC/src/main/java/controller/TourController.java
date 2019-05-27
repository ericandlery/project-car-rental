package controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import model.car.CarBean;
import model.model.ModelBean;
import model.tour.TourBean;
import model.tour.TourService;

@Controller
@RequestMapping
@SessionAttributes(names = { "all", "size","noTour" }) // HttpSession方法必放物件
public class TourController {
	@Autowired
	private TourService ts;
	@Autowired
	private TourBean tb;
	
	@Autowired
	private ServletContext ctx;
	
	
	
	

	// HttpSession //瀏覽器開著 資料則一直存在

	@RequestMapping(path = "/manager_zone/tour_all.controller")
	 
	public String tourAll(HttpSession Session, Model model) {
		
		
		List<TourBean> result = ts.selectAll();

		if(result != null) {
			System.out.println("ok,bean=" + result);
			model.addAttribute("all", result);
			model.addAttribute("size", result.size());
			
			System.out.println(result.size());
		}else {
			System.out.println("沒有景點");
			model.addAttribute("noTour","尚未新增景點");
		}
		return "tour_all_list";

	}

	@RequestMapping(path = "/Tour/tour_north.controller") // 呼叫的controller的jsp路徑
	public String tourNorth(HttpSession Session, Model model, String location) throws InterruptedException {

		
		
		
		System.out.println(location+"99999999999999");

		List<TourBean> result = ts.selectByArea(location);

		System.out.println("ok,bean=" + result);
		
		if (result == null) {
			model.addAttribute("area_noTour","該地區尚未新增任何景點");
			
		}else {
			TimeUnit.SECONDS.sleep((long) 0.5);
			model.addAttribute("all", result);
			model.addAttribute("size", result.size());
			System.out.println(result.size());
			
		}
			return "tour_all";

	}
	
	
	
	@RequestMapping(path = "/manager_zone/tour_insert.controller",method=RequestMethod.POST) //新增景點    //前端select選擇值
	public String tourNorth(HttpSession Session,int select,Integer indexTourId,TourBean tb,
			String indexTourName,String indexTourAddress,Integer indexTourPrice,
			String indexTourBranch_name,
			String indexTourDescription,String indexTourArea,Model model,
			@RequestParam("tour_photoX") CommonsMultipartFile tour_photo) throws IllegalStateException, IOException, InterruptedException {
		
		
//		if(indexTourName.isEmpty()|| indexTourId != null ){
//			model.addAttribute("addTourPoto", "Message:請勿空白");
//			return "tour_edit";	
//		}
		
		System.out.println(tb+","+indexTourName +","+indexTourAddress +","+indexTourPrice +","+
				indexTourBranch_name +","+indexTourDescription +","+indexTourArea);
		
		
		if(        indexTourName.isEmpty()        || indexTourAddress.isEmpty()    
				|| indexTourPrice== null          || indexTourBranch_name.isEmpty() 
				|| indexTourDescription.isEmpty() 
				|| indexTourArea.isEmpty()  ) {
			model.addAttribute("noDate","資料輸入錯誤");
			
		}else {
				
		System.out.println(tour_photo);
		
			
		System.out.print("(((insert.controller)))");
		
		if(select == 1) { 
			
			System.out.print("(((1 select)))");
			
			
			System.out.println("((((((POTO)))))))))))");
			//圖片
//			String folder=(String)ctx.getAttribute("tourFolder");//提取路徑
//			File tourFile=new File(folder + tb.getName()+".jpeg");//設定存檔路徑名稱
//			tour_photo.transferTo(tourFile);//存入圖片
//			tb.setPhoto(String.valueOf(tb.getName())+".jpeg");//寫入資料庫
//			TimeUnit.SECONDS.sleep(1);
//			ts.addTourPoto(tb);
		

			TourBean insert_check = ts.insertTour(tb,indexTourName, indexTourAddress, indexTourPrice, indexTourBranch_name, indexTourDescription, indexTourArea);
			if(insert_check == null) {
				model.addAttribute("dateTour", "名稱不能為空值");
			}else {
				String folder=(String)ctx.getAttribute("tourFolder");//提取路徑
				File tourFile=new File(folder + tb.getName()+".jpeg");//設定存檔路徑名稱
				tour_photo.transferTo(tourFile);//存入圖片
				
				TimeUnit.SECONDS.sleep(1);
				model.addAttribute("dateTour", "新增成功");
				model.addAttribute("addTourPoto","新增景點圖片成功");
				
//				Date Date = new Date();
//				model.addAttribute("Date",Date);
//				
				
			}	
		}else if(select == 2) {
			
			System.out.print("(((2 select)))");
			
			
			TourBean update_check = ts.updateTour(tb, indexTourId, indexTourName, indexTourAddress, indexTourPrice, indexTourBranch_name, indexTourDescription, indexTourArea);
			if(update_check == null) {
				model.addAttribute("dateTour", "更新失敗，名字重複");
			}else {
				
				String folder=(String)ctx.getAttribute("tourFolder");//提取路徑
				File tourFile=new File(folder + tb.getName()+".jpeg");//設定存檔路徑名稱
				tour_photo.transferTo(tourFile);//存入圖片
				
				TimeUnit.SECONDS.sleep(1);
				model.addAttribute("dateTour", "更新成功");
			}
		}
		}
		return "tour_edit";
	}
	
	
	@RequestMapping(path = "/manager_zone/tour_delete.controller",method = RequestMethod.POST)
	public String tourDelete(HttpSession Session,Integer tourDeleteId,Model model) {
		
		System.out.print("(((2 Delete)))");
		
		TourBean delId = ts.selectById(tourDeleteId);
		
		if(delId == null) {
			
			System.out.print("(((2 Delete if)))");
			model.addAttribute("delTour", "查無此景點");
			
		}else {
			
			System.out.print("(((2 Delete else)))");
			ts.delete(tourDeleteId);
			model.addAttribute("delTour", "成功刪除該景點");
			
		}

		return "tour_edit";

	}
	
	
	
	

/////修
	@RequestMapping(path="/manager_zone/tourUpdate.controller",method=RequestMethod.GET)
	public String tourUpdate(HttpServletRequest request,TourBean tb,Integer Id,Model model) {
		TourBean ty = ts.selectById(Id);
		model.addAttribute("tourUpdate", ty);
		return "tour_edit";
	}
	

	
	
	////////////照片
	

//	//create
//		@RequestMapping(path="/manager_zone/tourPoto.controller",method=RequestMethod.POST)
//		public String AddTourPoto(TourBean tb,int select,Integer Id,String name,
//				@RequestParam("tour_photoX") CommonsMultipartFile tour_photo,
//				@RequestParam("car_videoX") CommonsMultipartFile car_video,Model model) throws IllegalStateException, IOException, InterruptedException {
//			
//			System.out.println("((((((POTO)))))))))))");
//			
//			
//			if(name.isEmpty()|| Id != null ){
//				model.addAttribute("addTourPoto", "Message:請勿空白");
//				return "tour_all_list";	
//			}
//			if(select==1){
//				String folder=(String)ctx.getAttribute("tourFolder");//提取路徑
////				cb=cs.selectByCarNum(cb.getCar_num());
//				
//				File tourFile=new File(folder + tb.getId()+".jpeg");//設定存檔路徑名稱
////				File carvideo=new File(folder+ bean.getName()+".mp4");
////				if(!carfile.exists()) {
//				tour_photo.transferTo(tourFile);//存入圖片
////					car_video.transferTo(carvideo);
//				tb.setPhoto(String.valueOf(tb.getId())+".jpeg");//寫入資料庫
////					bean.setVideo(String.valueOf(bean.getName())+".mp4");
////				}
//				TimeUnit.SECONDS.sleep(2);
//				ts.addTourPoto(tb);
//			model.addAttribute("addTourPoto","Message:新增景點圖片成功");
//			}
//			
//			
//			
	
//			else if(select==2){
//				
//				System.out.println("NNNNNNNnulLLLLLLLLLLL");
//				
//				String folder=(String)ctx.getAttribute("CarFolder");
//				bean=ts.selectById(bean.getId());
//				File carfile=new File(folder+ bean.getName()+".jpeg");
////				if(!carfile.exists()) {
//					car_photo.transferTo(carfile);
//					bean.setPhoto(String.valueOf(bean.getName())+".jpeg");
////				}
//				TimeUnit.SECONDS.sleep(2);	
////			System.out.println("start update");
////			System.out.println("bean="+bean);
//				ts.updateById(bean);
//		    model.addAttribute("Message","Message:更新成功");
//			}
//			return "tour_all_list";
//		}
	
	

	
	
}