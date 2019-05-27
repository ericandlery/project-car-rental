package model.car;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.engine.jdbc.spi.SqlExceptionHelper;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class CarDAO {
	private SessionFactory sf;
	private Session session;
	public CarDAO(SessionFactory sf) {
		this.sf=sf;
	}
	private List<CarBean> list=new ArrayList<>();
	
	public List<CarBean> selectAll(){
		session=sf.getCurrentSession();
		Query q=session.createQuery("from CarBean");
		list=q.list();
		if(list.size()!=0) {
			return list;
		}else {
			return null;
		}
	}
///////////////
	public List<CarBean> selectByCarNum2(String car_num) {
		session=sf.getCurrentSession();
		return session.createQuery("from CarBean where car_num="+car_num).list();
			
		
	}
	
///////////////
	public CarBean selectByCarNum(String car_num) {
		session=sf.getCurrentSession();
		CarBean cb=session.get(CarBean.class,car_num);
		if(cb!=null) {
			return cb;
		}else {
			return null;
		}
	}
	
	public CarBean insert(CarBean cb) {
		session=sf.getCurrentSession();
		if(this.selectByCarNum(cb.getCar_num())==null) {
		session.save(cb);
		return this.selectByCarNum(cb.getCar_num());
		}else {
			return null;
		}
	}
	
	public CarBean update(CarBean cb) {
		session=sf.getCurrentSession();
		if(this.selectByCarNum(cb.getCar_num())!=null) {
		    session.update(cb);
		    return this.selectByCarNum(cb.getCar_num());
		}else{
			return null;
		}
		
	}
	
	public boolean delete(String car_num) {
		session=sf.getCurrentSession();
		CarBean cb=this.selectByCarNum(car_num);
		if(cb!=null) {
		session.delete(cb);
		return true;
		}else {
			return false;
		}
	}
	
	public List<CarBean> selectAllCarOrder(String order,String sort){
		session=sf.getCurrentSession();
		Query q=session.createQuery("from CarBean order by "+order+" "+sort);
		list=q.list();
		if(list.size()!=0) {
			return list;
		}else {
			return null;
		}
	}
	//////////////依據點查詢
	public List<CarBean> selectAllCarsByBranchName(String branch_name){
		session=sf.getCurrentSession();
		Query q=session.createQuery("from CarBean where branch_name=?");
		q.setParameter(0,branch_name);
		list=q.list();
		if(list.size()!=0) {
			return list;
		}else {
			return null;
		}
	}
	
	public String selectByBranchName(String name){
		session=sf.getCurrentSession();
		Query q=session.createQuery("from CarBean where branch_name=?");
		q.setParameter(0,name);
		list=q.list();
		if(list.size()!=0) {
			return "NotDelete";
		}else {
			return "CanDelete";
		}
	}
	///////////依車型Model、狀態查詢
	public List<CarBean> selectByModelId(Integer id,String car_state){
		session=sf.getCurrentSession();
		Query q=session.createQuery("from CarBean where model_id="+id+" and car_state='"+car_state+"'");
		list=q.list();
		return list;
	}

//////////////
	public CarBean update2(CarBean cb){
		session=sf.getCurrentSession();
		session.saveOrUpdate(cb);
		return cb;
	}

/////////////依ModelId選擇
	public List<CarBean> selectByModelId(int id){
		session=sf.getCurrentSession();
		return session.createQuery("from CarBean where model_id="+id).list();
	}
	public List<CarBean> selectByBranchNameDialog(String name) {
		session=sf.getCurrentSession();
		Query q=session.createQuery("from CarBean where branch_name="+"'"+name+"'");
		list=q.list();
		return list;
	}

}
