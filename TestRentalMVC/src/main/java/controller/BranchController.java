package controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
import model.car.CarService;
import model.model.ModelBean;

@Controller
@RequestMapping
@SessionAttributes
public class BranchController {
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
	
	////////查詢據點
	@RequestMapping(path="/branch_zone/searchBranch.controller")
	public String BranchSearch(HttpServletRequest request,BranchBean bb,Model model) {
		
		List<BranchBean> list = bs.selectAll();		
		
		model.addAttribute("Search", list);
		model.addAttribute("size",list.size());
		
		return "BranchSearch";
	}
	
	/////新
	@RequestMapping(path="/manager_zone/BranchOrderC.controller",method=RequestMethod.POST)
	public String BranchSearchC(HttpServletRequest request,int newX,BranchBean bb,String indexBranchName,String indexBranchAddress,
		   String indexBranchTele,String indexBranchPhoto,@RequestParam("branch_photoX") CommonsMultipartFile branch_photo,String selectlocation01,Model model) throws IllegalStateException, IOException {
		//System.out.println(newX);
		System.out.println("------------------1---------------");
		System.out.println(bb.getName());
		System.out.println(bb.getTele());
		System.out.println(bb.getAddress());
		if (indexBranchName.length()==0||indexBranchAddress.length()==0||indexBranchTele.length()==0){
			model.addAttribute("CRUD_D", "Message : 請勿空白");
			return "branch_list_reset";
		}
		if (newX == 1) {
			System.out.println("----------------2------------------");
			System.out.println(bb.getName());
			System.out.println(bb.getTele());
			System.out.println(bb.getAddress());
			String folder=(String)ctx.getAttribute("Branchfolder");
			File branchfile=new File(folder+indexBranchAddress+".jpeg");	
			branch_photo.transferTo(branchfile);				
			bb.setPhoto(indexBranchAddress+".jpeg");
				
			BranchBean check = bs.insertBranch(bb,indexBranchName, indexBranchAddress, indexBranchTele, indexBranchPhoto,selectlocation01);
			if (check == null) {
				model.addAttribute("CRUD_D", "Message : 據點名稱不能重複");
			} else {
				model.addAttribute("CRUD_D", "Message : 新增成功");
			}
		}else if (newX==2){
			String folder=(String)ctx.getAttribute("Branchfolder");
			System.out.println("----------------3-----------------");
			System.out.println(indexBranchName);
			System.out.println(indexBranchAddress);
			System.out.println(indexBranchTele);
			File branchfile=new File(folder+indexBranchAddress+".jpeg");	
			branch_photo.transferTo(branchfile);				
			bb.setPhoto(indexBranchAddress+".jpeg");
			BranchBean checkU = bs.updateBranch(bb,indexBranchName, indexBranchAddress, indexBranchTele,selectlocation01);
			if (checkU == null) {
				model.addAttribute("CRUD_D", "Message : 據點名稱不能重複");
			} else {
				model.addAttribute("CRUD_D", "Message : 修改成功");
			}
		}
		return "branch_list_reset";
	}
	/////刪
	@RequestMapping(path="/manager_zone/BranchOrderD.controller",method=RequestMethod.POST)
	public String BranchSearchD(HttpServletRequest request,BranchBean bb,String deleteBranchName,Model model) {
		
		String check = cs.selectByBranchName(deleteBranchName);
		if(check=="CanDelete"){
		bs.delete(deleteBranchName);		
		}else if(check=="NotDelete"){
		model.addAttribute("CRUD_D","Message : 此據點還有車輛 ");	
		}
		return "branch_list_reset";
	}
	
	/////修
	@RequestMapping(path="/manager_zone/BranchOrderU.controller",method=RequestMethod.POST)
	public String BranchSearchU(HttpServletRequest request,BranchBean bb,String updateBranchName,
		   String updateBranchAddress,String updateBranchTele,String updateBranchPhoto,Model model) {
		System.out.println(updateBranchName);
		System.out.println(updateBranchAddress);
		System.out.println(updateBranchTele);
		System.out.println(updateBranchPhoto);
	    model.addAttribute("UName", updateBranchName);
	    model.addAttribute("UAddress", updateBranchAddress);
	    model.addAttribute("UTele", updateBranchTele);
		return "branch_list_reset";
	}

	/////篩
	@RequestMapping(path="/manager_zone/selecetLocation.controller",method=RequestMethod.POST)
	public String BranchSearchS(HttpServletRequest request,BranchBean bb,String selectlocation,Model model) {
		System.out.println("se = "+selectlocation);
	if(!selectlocation.equals("all")){	
	List<BranchBean> list = bs.selectByLocation(selectlocation);
	System.out.println(list);
	model.addAttribute("branch_list", list);
	}else{		
    List<BranchBean> list2 = bs.selectAll();
    System.out.println(list2);
    model.addAttribute("branch_list", list2);
	}
    
    
	return "branch_list";
	}
	
	/////篩2
	@RequestMapping(path="/branch_zone/selecetLocation02.controller",method=RequestMethod.POST)
	public String BranchSearchSS(HttpServletRequest request,BranchBean bb,String selectlocation,Model model) {
	System.out.println("se2 = "+selectlocation);
	if(!selectlocation.equals("all")){	
	List<BranchBean> list = bs.selectByLocation(selectlocation);
	System.out.println(list);
	model.addAttribute("Search", list);
	}else{		
    List<BranchBean> list2 = bs.selectAll();
    System.out.println(list2);
    model.addAttribute("Search", list2);
	}
    
    
	return "BranchSearch";
	}
	
	////AJAX 自動新增select車型
	@ResponseBody //如果要調用AJAX需寫這行
	@RequestMapping(path= {"/branch_zone/branchsearchSSS.controller"})
	public void selectmodelid(HttpServletResponse resp,String name) throws IOException {
		System.out.println("AAAAAAA="+name);
		resp.setContentType("text/html;charset=UTF-8"); //設定編碼  
		PrintWriter out=resp.getWriter();               //設定印出
		List<CarBean> list=cs.selectByBranchNameDialog(name);           //抓取據點資料庫
		System.out.println("AAAAAA="+list);
		
//		if(list.size()!=0) {
			String json=new Gson().toJson(list);        //把list存入json裡
			out.print(json);                            //印出json
//		}else {
//			out.print("");
//		}

		out.flush();//送出暫存資料..確保json印出
		out.close();//關閉
		return;
		
	}

///////////AJAX取得所有據點	
	@ResponseBody
	@RequestMapping(path="/manager_zone/getAllBranchs.controller")
	public void getAllBranchs(HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out=resp.getWriter();
		List<BranchBean> list=bs.selectAll();
		String json=new Gson().toJson(list);
		out.print(json);
		
		out.flush();
		out.close();
		return;
	}
	

}
