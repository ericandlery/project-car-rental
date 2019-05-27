package model.staff;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class StaffDAO {
	private SessionFactory sf;
	private Session session;
	private List<StaffBean> list=new ArrayList<>();
	public StaffDAO(SessionFactory sf) {
		this.sf=sf;
	}
	public List<StaffBean> selectAll(){
		session=sf.getCurrentSession();
		Query<StaffBean> q=session.createQuery("from StaffBean");
		list=q.list();
		if(list.size()!=0) {
			return list;
		}
		return null;
	}
	public StaffBean selectById(Integer id) {
		session=sf.getCurrentSession();
		return session.get(StaffBean.class,id);
	}
		
	public List<StaffBean> selectByName(String name) {
		session=sf.getCurrentSession();
		Query q=session.createQuery("from StaffBean where name='"+name+"'");
		return q.list();
	}	
	
	public StaffBean insert(StaffBean sb) {
		session=sf.getCurrentSession();
		session.save(sb);
		return sb;
	}
	public StaffBean update(StaffBean sb) {
		session=sf.getCurrentSession();
		session.update(sb);
		return sb;
	}
	public boolean delete(StaffBean sb) {
		session=sf.getCurrentSession();
		session.delete(sb);
		return true;
	}
	public void insertOrUpdate(StaffBean sb) {
		session=sf.getCurrentSession();
		session.saveOrUpdate(sb);
		return;
	}
}
