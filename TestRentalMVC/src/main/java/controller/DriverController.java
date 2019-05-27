package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.driver.DriverBean;
import model.driver.DriverService;
import model.pickup_order.Pickup_orderBean;
import model.pickup_order.Pickup_orderService;

@Controller
@RequestMapping
public class DriverController {
	@Autowired
	private DriverService ds;
	@Autowired
	private DriverBean db;
	@Autowired
	private Pickup_orderService pos;
	@Autowired
	private Pickup_orderBean pob;
	
///////////列出所有司機名單
	@RequestMapping(path="/manager_zone/pickup_manager/showDriverList.controller")
	public String showDriverList(Model model) {
		List<DriverBean> list=ds.selectAll();
		if(list.size()!=0) {
			model.addAttribute("driver_list",list);
		}else {
			model.addAttribute("no_driver","沒有司機了，請雇用一些司機");
		}
		
		return "pickup_driver_list";
	}
///////////Ajax取出司機的訂單
	@ResponseBody
	@RequestMapping(path="/manager_zone/pickup_manager/showSchedule.controller")
	public void showSchedule(HttpServletResponse resp,String id) throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		Integer driver_id=null;
		try {
			driver_id=Integer.valueOf(id);
		}catch(NumberFormatException e) {
			out.print("錯誤");
			return;
		}
		List<Pickup_orderBean> list=pos.showDriverSchedule(driver_id);
		String json=new Gson().toJson(list);
		out.print(json);
		out.flush();
		out.close();
		return;
	}
}
