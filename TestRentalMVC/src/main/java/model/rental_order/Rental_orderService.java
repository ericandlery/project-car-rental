package model.rental_order;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import model.car.CarBean;
import model.car.CarDAO;
import model.member.MemberBean;
import model.member.MemberDAO;
import model.member.MemberService;
import net.sf.ehcache.search.parser.MValue.MShort;

@Service
@Scope(value="prototype")
@Lazy(value=true)
public class Rental_orderService {
	@Autowired
	private Rental_orderDAO rdao;
//	@Autowired
//	private Rental_orderBean rb;
	@Autowired
	private CarDAO cdao;
	@Autowired
	private MemberDAO mdao;
	
	public List<Rental_orderBean> selectAll() {
		return rdao.selectAll();
	}
	public Rental_orderBean selectById(int id) {
		return rdao.selectById(id);
	}
	public List<Rental_orderBean> selectByMemId(int id){
		return rdao.selectByMemId(id);
	}
	//////////查詢目前訂單
	public Rental_orderBean selectActiveOrderByMemId(int id) {
		List<Rental_orderBean> list=rdao.selectByMemId(id);
		if(list!=null) {
		for(Rental_orderBean rb:list) {
			if(rb.getOrder_state().equals("已預約") || rb.getOrder_state().equals("已取車")) {
				return rb;
			}
		}
		}
		return null;
	}
	/////////查詢歷史訂單
	public List<Rental_orderBean> selectHistoryOrder(int id) {
		List<Rental_orderBean> list=rdao.selectByMemIdOrderByDate(id);
		if(list!=null) {
			List<Rental_orderBean> historyOrder=new ArrayList<>();;
			for(Rental_orderBean rb:list) {
				if(rb.getOrder_state().equals("已還車") || rb.getOrder_state().equals("已取消") || rb.getOrder_state().equals("已結束")) {					
				historyOrder.add(rb);
				}
			}
			if(historyOrder.size()!=0) {
			return historyOrder;
			}else {
				return null;
			}
		}
		return null;
	}
	/////////新增訂單
//	public Rental_orderBean addRentalOrder(Rental_orderBean rb) {
//		return rdao.insert(rb);
//	}
	/////////修改訂單/////
	public Rental_orderBean updateRental_orderBean(Rental_orderBean rb) {
		return rdao.update(rb);
	}
	/////////刪除訂單
	public boolean deleteOrder(int id) {
		return rdao.delete(id);
	}
	//////////所有訂單排序
	public List<Rental_orderBean> selectAllOrderBy(String order,String sort){
		return rdao.selectAllOrderBy(order, sort);
	}
	//////////會員下訂單
	public Rental_orderBean addNewOrder(Rental_orderBean rb,MemberBean mb,String wallet) {
		///////////////先確認用戶目前有沒有正在進行的訂單，沒有才新增
		if(this.selectActiveOrderByMemId(mb.getId())!=null) {
			return null;
		}
		
		rb.setMemid(mb.getId());
		rb.setRemark(null);
		///////////計算借車還車的天數///////////
		long d1=rb.getStart_date().getTime();
		long d2=rb.getEnd_date().getTime();
		int diff=(int)TimeUnit.DAYS.convert(d2-d1,TimeUnit.MILLISECONDS);
		///////////計算訂單的總價////////////
		CarBean cb=cdao.selectByCarNum(rb.getCar_num());
		cb.setCar_state("預約中");
		cdao.update(cb);
		int price_day=cb.getPrice_day();
		int price=price_day*diff;
		///////////////////////////////
		rb.setPrice(price);
		rb.setOrder_date(new Date());
		rb.setOrder_state("已預約");
		rb.setCode(null);
		rb.setTrip_id(null);
		/////////////更新錢包
		if(wallet.equals("wallet")) {
			rb.setPayment("電子錢包");
			mb.setWallet(mb.getWallet()-price);
			mdao.update(mb);
		}else {
			rb.setPayment("現場付款");
		}
		
		rdao.insert(rb);

		//////////傳回剛做好的訂單
		return this.selectActiveOrderByMemId(mb.getId());
	}
/////////////檢查電子錢包夠不夠多
	public boolean checkWalletPay(Rental_orderBean rb,MemberBean mb) {
		CarBean cb=cdao.selectByCarNum(rb.getCar_num());
		
		long d1=rb.getStart_date().getTime();
		long d2=rb.getEnd_date().getTime();
		int diff=(int)TimeUnit.DAYS.convert(d2-d1,TimeUnit.MILLISECONDS);
		
		int price_day=cb.getPrice_day();
		int price=price_day*diff;
		/////如果不夠多--
		if(mb.getWallet()<price) {
			return false;
		}else {
			return true;
		}
	}
//////////////會員(或管理員)取消訂單，將訂單狀態改為"已取消"，但不刪除資料庫的資料
	public boolean memberCancelOrder(Rental_orderBean rb) {
		//////////將車的狀態從"預約中"改回"良好"
		CarBean cb=cdao.selectByCarNum(rb.getCar_num());
		cb.setCar_state("良好");
		cdao.update(cb);
		Rental_orderBean temp=rdao.selectById(rb.getId());
		temp.setOrder_state("已取消");
		rdao.update(temp);
		
		return true;
	}
	///////////取得所有單一據點order_state狀態的訂單
	public List<Rental_orderBean> getUnfinishedOrderInABranch(String branch_name,String order_state,String startend){
		List<Rental_orderBean> temp=rdao.selectByStartEndBranch(branch_name,startend);
		if(temp==null) {
			return null;
		}
		
		List<Rental_orderBean> list=new ArrayList<>();
		for(Rental_orderBean rb:temp) {
			if(rb.getOrder_state().equals(order_state)) {
				list.add(rb);
			}
		}
		if(list.size()!=0) {
			return list;
		}else {
			return null;
		}
		
	}
	////////////完成取車動作，將訂單狀態改為'已取車'
	public Rental_orderBean sendCar(Rental_orderBean rb) {
		rb.setOrder_state("已取車");
		return rdao.update(rb);
	}
	////////////完成還車動作，將訂單狀態改為'結束'
	public Rental_orderBean getbackCar(Rental_orderBean rb) {
		rb.setOrder_state("已結束");
		return rdao.update(rb);
	}
////////////////完成還車動作，將訂單狀態改為'結束'外加罰錢，倍率可自己決定
	public Rental_orderBean getBackCarWithFine(Rental_orderBean rb,int price_day,float multi) {
		////////計算天數
		long today=new Date().getTime();
		long endDate=rb.getEnd_date().getTime();
		long diffDays=TimeUnit.DAYS.convert(today-endDate,TimeUnit.MILLISECONDS);
		/////加總
		int oldPrice=rb.getPrice();
		int newPrice=(int)Math.ceil(price_day*multi*diffDays)+oldPrice;
		rb.setPrice(newPrice);
		rb.setOrder_state("已結束");
		return rdao.update(rb);
	}
}
