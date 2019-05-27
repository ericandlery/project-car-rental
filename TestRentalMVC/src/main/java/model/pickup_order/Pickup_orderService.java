package model.pickup_order;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@Service
@Scope(value="prototype")
@Lazy(value=true)
public class Pickup_orderService {
	@Autowired
	private Pickup_orderDAO pdao;
	
	public List<Pickup_orderBean> selectAll(){
		List<Pickup_orderBean> list=pdao.selectAll();
		if(list.size()!=0) {
			return list;
		}else {
			return null;
		}
	}

	public Pickup_orderBean selectById(int id) {
		return pdao.selectById(id);
	}
	
	public List<Pickup_orderBean> selectByMemId(int id){
		return pdao.selectByMemId(id);
	}
	
	public Pickup_orderBean insert(Pickup_orderBean pb) {
		pdao.insert(pb);
		return pdao.selectById(pb.getId());
	}
	
	public Pickup_orderBean update(Pickup_orderBean pb) {
		pdao.update(pb);
		return this.selectById(pb.getId());
	}
	
	public void delete(Pickup_orderBean pb) {
		pdao.delete(pb);
	}
	
///////////////機場接送服務，新增會員下單並修改訂單資料
	public Pickup_orderBean addNewOrder(Pickup_orderBean pb) {
		pb.setOrder_state("已預約");
		pb.setOrder_s_datetime(new Timestamp(new Date().getTime()));
		pdao.insert(pb);
		return pdao.selectById(pb.getId());
	}
///////////////查詢司機在接送服務當天是否忙碌，忙碌則回傳true，有空則回傳false
	public boolean checkWorkDay(String work_day,int driver_id) {
		List<Integer> list=pdao.selectDriversWhereDate(work_day, driver_id);
			if(list.size()==0) {
				return false;
		}else {
			return true;
		}
	}
//////////////檢查會員目前是否有接送訂單
	public boolean checkCurrentOrder(int id) {
		List<Pickup_orderBean> list=pdao.selectByMemState(id,"已預約","id","desc");
		if(list.size()!=0) {
			return true;
		}else {
			return false;
		}
	}
/////////////查詢會員目前的接送訂單
	public Pickup_orderBean getCurrentOrder(int memId) {
		List<Pickup_orderBean> list=pdao.selectByMemState(memId,"已預約","id","desc");
		if(list.size()!=0) {
			return list.get(0);
		}else {
			return null;
		}
	}
///////////查詢會員歷史接送記錄
	public List<Pickup_orderBean> getHistoryOrder(int memId){
		List<Pickup_orderBean> list=pdao.selectByMemStateExcept(memId,"已預約","id","desc");
		if(list.size()!=0) {
			return list;
		}else {
			return null;
		}
	}
/////////查詢今天要接送的名單(已預約)
	public List<Pickup_orderBean> getTodayPickupOrder(){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String today=sdf.format(new Date());
		
		List<Pickup_orderBean> list=pdao.selectByDateState(today,"已預約");
			return list;
	}
/////////查詢幾天後(可自己設定)要接送的名單(已預約)
public List<Pickup_orderBean> getFuturePickupOrder(int days){
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	Date date=new Date();
	Calendar cal=Calendar.getInstance();
	cal.setTime(date);
	cal.add(Calendar.DATE,days);
	date=cal.getTime();
	String day=sdf.format(date);
	
	List<Pickup_orderBean> list=pdao.selectByDateState(day,"已預約");
		return list;
}
////////查詢已過期還未處理(已預約)的訂單
public List<Pickup_orderBean> getUnfinishedOrders(){
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
	String today=sdf.format(new Date());
	
	List<Pickup_orderBean> list=pdao.selectBeforeDateState(today,"已預約");
	return list;
}
/////////取消訂單，將狀態改為已取消，寫入取消日期時間
	public void cancelPickupOrder(Pickup_orderBean pb) {
		pb.setOrder_state("已取消");
		pb.setOder_e_datetime(new Timestamp(new Date().getTime()));
		pdao.update(pb);
	}
/////////完成接送訂單，將狀態改為已結束，寫入完成日期時間
	public void finishedPickupOrder(Pickup_orderBean pb) {
		pb.setOrder_state("已結束");
		pb.setOder_e_datetime(new Timestamp(new Date().getTime()));
		pdao.update(pb);
	}
////////////////查出一個司機未來的行程
	public List<Pickup_orderBean> showDriverSchedule(Integer driver_id){
		List<Pickup_orderBean> list=pdao.selectByStateAndDriver("已預約",driver_id);
		return list;
	}
}