package model.car;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.metamodel.SetAttribute;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@Service
@Scope(value="prototype")
@Lazy(value=true)
public class CarService {
	@Autowired
	private CarDAO cdao;
	@Autowired
	private CarBean cb;
	
	public List<CarBean> selectAll(){
		return cdao.selectAll();
	}
	
	public String insertCar(CarBean cb,String production_dateB,String model_idX,String mileageX,String price_dayX
			,String rateX,String rate_countX){
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
		Integer modelidA=Integer.valueOf(model_idX);
		Integer mileageA=Integer.valueOf(mileageX);
		Integer price_dayA=Integer.valueOf(price_dayX);
		Integer rateA=Integer.valueOf(rateX);
		Integer rate_countA=Integer.valueOf(rate_countX);
		cb.setModel_id(modelidA);
		cb.setMileage(mileageA);
		cb.setPrice_day(price_dayA);
		cb.setRate(rateA);
		cb.setRate_count(rate_countA);
		cb = cdao.insert(cb);
		System.out.println("cb="+cb);
		if(cb!=null){
			return "OK";
		}else{
			return "NOTOK";
		}
		
	}
	
	public List<CarBean> selectAllOrder(String order,String sort){
		return cdao.selectAllCarOrder(order, sort);
	}
	
	public String selectByBranchName(String name) {		
		return cdao.selectByBranchName(name);
	}
	
	///////////////找出據點中的車，可以依車況分類///////////
	public List<CarBean> selectAvailableCarsInABranch(String branch_name,String car_state){
		List<CarBean> tempList=cdao.selectAllCarsByBranchName(branch_name);
		if(tempList!=null) {
			List<CarBean> list=new ArrayList();
			for(CarBean temp:tempList) {
				if(temp.getCar_state().equals(car_state)) {
					list.add(temp);
				}
			}
			if(list.size()!=0) {
				return list;
			}else {
				return null;
			}			
		}else {
		return null;
		}
	}
/////////
	public CarBean selectByCarNum(String car_num) {
		return cdao.selectByCarNum(car_num);
	}
////////////
	public CarBean selectByCarNum2(String car_num) {
		return cdao.selectByCarNum(car_num);
	}
//////////完成取車動作，將車的狀態改為'出租中'、將車的地點改為'出租中'
	public CarBean sendCar(CarBean cb) {
		cb.setCar_state("出租中");
		cb.setBranch_name("出租中");
		return cdao.update(cb);
	}
//////////完成還車動作，將車的狀態改為'良好'、將車的地點改為'還車地點'
	public CarBean getbackCar(CarBean cb,String end_branch_name) {
		cb.setCar_state("良好");
		cb.setBranch_name(end_branch_name);
		return cdao.update(cb);
	}
//////////依Model Id，車的狀態查詢所有車款(接送服務)	
	public List<CarBean> getCarsByModelId(Integer id,String car_state){
		List<CarBean> list=cdao.selectByModelId(id,car_state);
		if(list.size()!=0) {
			return list;
		}else {
			return null;
		}
	}
////////////接送服務下單，將車的狀態改為預約中
	public CarBean acceptPickupOrder(CarBean cb) {
		cb.setCar_state("預約中");
		return cdao.update(cb);
	}


	public boolean delete(String allcarNum) {
		
		return cdao.delete(allcarNum);
	}


	

////////////接送服務完成或取消訂單，將車的狀態改為良好
	public void cancelOrFnishedPickupOrder(CarBean cb) {
		cb.setCar_state("良好");
		cdao.update(cb);
	}

	public String updateCar(CarBean cb2, String production_dateB, String model_idX, String mileageX, String price_dayX,
			String rateX, String rate_countX) {
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
		cb = cdao.update2(cb);
		System.out.println("cb="+cb);
		if(cb!=null){
			return "OK";
		}else{
			return "NOTOK";
		}
	}

	
///////////////////TEST
	public void update2(CarBean cb){
		
		cdao.update2(cb);
		
	}

//////////選擇同一款車型的車
	public List<CarBean> selectByModelId(int id){
		return cdao.selectByModelId(id);
	}

	public List<CarBean> selectByBranchNameDialog(String name) {
		// TODO Auto-generated method stub
		return cdao.selectByBranchNameDialog(name);
	}

}
