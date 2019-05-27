//package model.driverworkdate;
//
//import java.util.List;
//
//import org.hibernate.Session;
//import org.hibernate.SessionFactory;
//import org.springframework.stereotype.Repository;
//
//@Repository
//public class DriverworkdateDAO {
//	SessionFactory sf;
//	Session session;
//	
//	public DriverworkdateDAO(SessionFactory sf) {
//		this.sf=sf;
//	}
//	
//	public List<DriverworkdateBean> selectAll(){
//		session=sf.getCurrentSession();
//		return session.createQuery("from Driver_work_dateBean").list();
//	}
//	
//	public DriverworkdateBean selectById(int id) {
//		session=sf.getCurrentSession();
//		return session.get(DriverworkdateBean.class,id);
//	}
//	
//	public void insert(DriverworkdateBean db) {
//		session=sf.getCurrentSession();
//		session.save(db);
//	}
//	
//	public void update(DriverworkdateBean db) {
//		session=sf.getCurrentSession();
//		session.update(db);
//	}
//	
//	public void delete(DriverworkdateBean db) {
//		session=sf.getCurrentSession();
//		session.delete(db);
//	}
//
//}
