package model.driver;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class DriverDAO {
	private SessionFactory sf;
	private Session session;
	public DriverDAO(SessionFactory sf) {
		this.sf=sf;
	}
	
	public List<DriverBean> selectAll(){
		session=sf.getCurrentSession();
		return session.createQuery("from DriverBean").list();
	}
	
	public DriverBean selectById(int id) {
		session=sf.getCurrentSession();
		return session.get(DriverBean.class,id);
	}
	
	public void insert(DriverBean db) {
		session=sf.getCurrentSession();
		session.save(db);
	}
	
	public void update(DriverBean db) {
		session=sf.getCurrentSession();
		session.update(db);
	}
	
	public void delete(DriverBean db) {
		session=sf.getCurrentSession();
		session.delete(db);
	}
/////////////依工作日期時間(可以null)做查詢
//	public List<DriverBean> selectIdleDrivers(String work_day,String work_time){
//		session=sf.getCurrentSession();
//		if(work_day==null && work_time==null) {
//			Query<DriverBean> q=session.createQuery("from DriverBean where work_day is null and work_time is null");
//			return q.list();
//		}else if(work_day==null && work_time!=null) {
//			Query<DriverBean> q=session.createQuery("from DriverBean where work_time='"+work_time+"'");
//			return q.list();
//		}else if(work_day!=null && work_time==null) {
//			Query<DriverBean> q=session.createQuery("from DriverBean where work_day='"+work_day+"'");
//			return q.list();
//		}else if(work_day!=null && work_time!=null){
//			Query<DriverBean> q=session.createQuery("from DriverBean where work_day='"+work_day+"' and work_time='"+work_time+"'");
//			return q.list();
//		}else {
//			return null;
//		}
//		
//	}
	
//////////////找出指定日期有空的司機
	public List<Integer> selectDriversWhereDate(String work_day,int driver_id){
		session=sf.getCurrentSession();
		Query<Integer> q=session.createQuery("select d.id from DriverBean d left join DriverworkdateBean w on d.id=w.driver_id where w.work_day='"+work_day+"' and d.id="+driver_id);
		List<Integer> list=q.list();
		return list;
	}

}
