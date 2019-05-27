package model.pickup_order;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class Pickup_orderDAO {
	private SessionFactory sf;
	private Session session;
	private List<Pickup_orderBean> list;
	private Pickup_orderBean pb;
	public Pickup_orderDAO(SessionFactory sf) {
		this.sf=sf;
	}
	
	public List<Pickup_orderBean> selectAll(){
		session=sf.getCurrentSession();
		Query q=session.createQuery("from Pickup_orderBean");
		return q.list();
	}
	
	public Pickup_orderBean selectById(int id) {
		session=sf.getCurrentSession();
		pb=session.get(Pickup_orderBean.class,id);
		return pb;
	}
	
	public List<Pickup_orderBean> selectByMemId(int id){
		session=sf.getCurrentSession();
		Query q=session.createQuery("from Pickup_orderBean where mem_id="+id);
		return q.list();
	}
	
	public void insert(Pickup_orderBean pb) {
		session=sf.getCurrentSession();
		session.save(pb);
	}
	
	public void update(Pickup_orderBean pb) {
		session=sf.getCurrentSession();
		session.update(pb);	
	}
	
	public void delete(Pickup_orderBean pb) {
		session=sf.getCurrentSession();
		session.delete(pb);
	}
	
//////////////找出指定日期有空的司機
	public List<Integer> selectDriversWhereDate(String work_day,int driver_id){
		session=sf.getCurrentSession();
		Query<Integer> q=session.createQuery("select d.id from DriverBean d left join Pickup_orderBean p on d.id=p.driver_id where p.start_date='"+work_day+"' and d.id="+driver_id);
		List<Integer> list=q.list();
		return list;
	}
/////////////依指定會員的訂單狀態查詢(有排序)
	public List<Pickup_orderBean> selectByMemState(int id,String state,String order,String sort){
		session=sf.getCurrentSession();
		Query<Pickup_orderBean> q=session.createQuery("from Pickup_orderBean where mem_id="+id+" and order_state='"+state+"' order by "+order+" "+sort);
		return q.list();
	}
/////////////依指定會員的訂單狀態以外查詢(有排序)
	public List<Pickup_orderBean> selectByMemStateExcept(int id,String state,String order,String sort){
		session=sf.getCurrentSession();
		Query<Pickup_orderBean> q=session.createQuery("from Pickup_orderBean where mem_id="+id+" and order_state<>'"+state+"' order by "+order+" "+sort);
	return q.list();
	}
/////////////查詢指定日期與狀態的接送訂單
	public List<Pickup_orderBean> selectByDateState(String today,String state){
		session=sf.getCurrentSession();
		Query<Pickup_orderBean> q=session.createQuery("from Pickup_orderBean where start_date='"+today+"' and order_state='"+state+"'");
		return q.list();
	}
////////////查詢指定日期之前的指定狀態訂單
	public List<Pickup_orderBean> selectBeforeDateState(String date,String state){
		session=sf.getCurrentSession();
		Query<Pickup_orderBean> q=session.createQuery("from Pickup_orderBean where start_date<'"+date+"' and order_state='"+state+"'");
		return q.list();
	}
/////////////依狀態及司機查詢
	public List<Pickup_orderBean> selectByStateAndDriver(String state,Integer driver_id){
		session=sf.getCurrentSession();
		Query<Pickup_orderBean> q=session.createQuery("from Pickup_orderBean where order_state='"+state+"' and driver_id="+driver_id);
		return q.list();
	}
}
