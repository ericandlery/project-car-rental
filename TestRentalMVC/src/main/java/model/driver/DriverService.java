package model.driver;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@Service
@Scope(value="prototype")
@Lazy(value=true)
public class DriverService {
	@Autowired
	private DriverDAO ddao;
	@Autowired
	private DriverBean db;
	
	public List<DriverBean> selectAll(){
		List<DriverBean> list= ddao.selectAll();
		return list;
	}
	
	public DriverBean selectById(int id) {
		return ddao.selectById(id);
	}
/////////////////找出所有閒置中的司機(接送服務)
//	public List<DriverBean> getAllIdleDrivers(){
//		return ddao.selectIdleDrivers(null,null);
//	}
	
///////////////查詢司機在接送服務當天是否忙碌，忙碌則回傳true，有空則回傳false
	public boolean checkWorkDay(String work_day,int driver_id) {
		List<Integer> list=ddao.selectDriversWhereDate(work_day, driver_id);
		if(list.size()==0) {
			return false;
		}else {
			return true;
		}
	}
	
}
