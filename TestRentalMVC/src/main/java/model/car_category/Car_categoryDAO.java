package model.car_category;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class Car_categoryDAO {
	@Autowired
	private SessionFactory sessionFactory;
	private Session session;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	public List<Car_categoryBean> selectAll() {
		return this.getSession().createQuery("from Car_categoryBean",Car_categoryBean.class).list();
	}
//////////取得所有駕照的名稱	
	public List<String> selectAllLicenseName(){
		session=sessionFactory.getCurrentSession();
		return session.createQuery("select distinct license_leval from Car_categoryBean").list();
	}
	
	public Car_categoryBean selectById(int id){
		session=sessionFactory.getCurrentSession();
		return session.get(Car_categoryBean.class,id);
	}
//////////以駕照名稱搜尋
	public Car_categoryBean selectByName(String name) {
		session=sessionFactory.getCurrentSession();
		return (Car_categoryBean)session.createQuery("from Car_categoryBean where license_leval='"+name+"'").list().get(0);
	}
}
