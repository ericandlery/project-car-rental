package test;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.branch.BranchBean;
import model.branch.BranchService;
import model.car.CarBean;
import model.car.CarDAO;
import model.car.CarService;
import model.car_category.Car_categoryService;
import model.driver.DriverBean;
import model.driver.DriverDAO;
import model.driver.DriverService;
import model.manager.ManagerService;
import model.member.MemberBean;
import model.member.MemberService;
import model.model.ModelBean;
import model.model.ModelDAO;
import model.model.ModelService;
import model.pickup_order.Pickup_orderBean;
import model.pickup_order.Pickup_orderDAO;
import model.pickup_order.Pickup_orderService;
import model.rental_order.Rental_orderBean;
import model.rental_order.Rental_orderService;

@Controller
@RequestMapping
public class TestController {
	@Autowired
	private Pickup_orderService ps;
	@Autowired
	private Pickup_orderBean pb;
	
	@RequestMapping(path="/test/test.controller")
	public String test(Model model) throws ParseException {
		System.out.println("test start");
		
		List<Pickup_orderBean> list=ps.getTodayPickupOrder();
		System.out.println(list.size());
		for(Pickup_orderBean b:list) {
			System.out.println(b);
		}
		
		System.out.println("test end");
		return "test";
	}

}
