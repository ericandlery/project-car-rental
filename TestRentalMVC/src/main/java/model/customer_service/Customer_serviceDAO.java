package model.customer_service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class Customer_serviceDAO {
	private SessionFactory sf;
	private Session session;
	public Customer_serviceDAO(SessionFactory sf) {
		this.sf=sf;
	}
	
	public List<Customer_serviceBean> selectAll(){
		session=sf.getCurrentSession();
		return session.createQuery("from Customer_serviceBean").list();
	}
	
	public Customer_serviceBean selectById(Integer id) {
		session=sf.getCurrentSession();
		return session.get(Customer_serviceBean.class,id);
	}
	
/////////以名字查詢
	public List<Customer_serviceBean> selectByName(String name){
		session=sf.getCurrentSession();
		return session.createQuery("from Customer_serviceBean where name='"+name+"'").list();
	}
	
	public void insert(Customer_serviceBean csb) {
		session=sf.getCurrentSession();
		session.save(csb);
	}
	
	public void update(Customer_serviceBean csb) {
		session=sf.getCurrentSession();
		session.update(csb);
	}
	
	public void delete(Customer_serviceBean csb) {
		session=sf.getCurrentSession();
		session.delete(csb);
	}

}
