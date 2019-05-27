package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import model.car_category.Car_categoryBean;
import model.car_category.Car_categoryService;

@Controller
@RequestMapping
public class CarCategoryController {
	@Autowired
	private Car_categoryBean ccb;
	@Autowired
	private Car_categoryService ccs;
	
/////////////抓出所有車種
	@ResponseBody
	@RequestMapping(path="/manager_zone/getAllCategory.controller")
	public void getAllCategory(HttpServletResponse resp) throws IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out=resp.getWriter();
		
		List<String> list=ccs.getAllLicense();
		String json=null;
		if(list!=null) {
			json=new Gson().toJson(list);
		}

		out.println(json);
		out.flush();
		out.close();
		return;
	}

}
