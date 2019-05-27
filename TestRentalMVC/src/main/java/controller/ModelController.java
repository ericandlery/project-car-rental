package controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import model.model.ModelBean;
import model.model.ModelService;

@Controller
@RequestMapping
@SessionAttributes
public class ModelController {
	@Autowired
	private ModelService service;
	@Autowired
	private ServletContext ctx;
	
	@RequestMapping(method=RequestMethod.GET,path="/manager_zone/NewModel.controller")
	public String Model() {

		return "";
	}
	//create
	@RequestMapping(path="/manager_zone/modelC.controller",method=RequestMethod.POST)
	public String AddNewModel(ModelBean bean,int newX,String name,String brand,
			@RequestParam("car_photoX") CommonsMultipartFile car_photo,
			@RequestParam("car_videoX") CommonsMultipartFile car_video,Model model) throws IllegalStateException, IOException, InterruptedException {
		System.out.println("bean!!!!"+bean);
		System.out.println("brand!!!!"+brand);
		System.out.println("car_photo!!!!"+car_photo);
		System.out.println("car_video!!!!"+car_video);
		if(name.isEmpty()){
			model.addAttribute("Message", "Message:請勿空白");
			return "model_list_reset";	
		}
		
		if(newX==1){

			String folder1=(String)ctx.getAttribute("Carfolder");
			String folder2=(String)ctx.getAttribute("CarVideofolder");
//			bean=service.selectById(bean.getId());
			File carfile=new File(folder1+ bean.getName()+".jpeg");
			File carvideo=new File(folder2+ bean.getName()+".mp4");
//			if(!carfile.exists()) {
				car_photo.transferTo(carfile);//存入圖片
				car_video.transferTo(carvideo);
				bean.setPhoto(String.valueOf(bean.getName())+".jpeg");//寫入資料庫
				bean.setVideo(String.valueOf(bean.getName())+".mp4");
//			}
//			TimeUnit.SECONDS.sleep(2);
		service.addNewCar(bean);
		model.addAttribute("Message","Message:新增成功");

		}else if(newX==2){
			String folder1=(String)ctx.getAttribute("Carfolder");
			String folder2=(String)ctx.getAttribute("CarVideofolder");
//			bean=service.selectById(bean.getId());
			File carfile=new File(folder1+ bean.getName()+".jpeg");
			File carvideo=new File(folder2+ bean.getName()+".mp4");
//			if(!carfile.exists()) {
				car_photo.transferTo(carfile);
				car_video.transferTo(carvideo);
				bean.setPhoto(String.valueOf(bean.getName())+".jpeg");
				bean.setVideo(String.valueOf(bean.getName())+".mp4");
//			}
//			TimeUnit.SECONDS.sleep(2);	
//		System.out.println("start update");
//		System.out.println("bean="+bean);
				System.out.println("HAHAHA"+bean);
	    service.updateById(bean);
	    model.addAttribute("Message","Message:更新成功");
		}
		return "model_list_reset";
	}
	//delete
	@RequestMapping(path="/manager_zone/modelD.controller",method=RequestMethod.POST)
	public String deleteModel(ModelBean bean,int deletemodelid,Model model) {
		service.deleteById(deletemodelid);
		model.addAttribute("Message","Message:刪除成功");
		return "model_list_reset";
	}
	//edit
	@RequestMapping(path="/manager_zone/modelE.controller",method=RequestMethod.POST)
	public String editModel(ModelBean bean,int deletemodelid,Model model) {
		ModelBean aa = service.selectById(deletemodelid);
		model.addAttribute("modelaa", aa);
		return "model_list_reset";
	}
}
