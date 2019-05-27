package model.manager;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerDAO {
	private SessionFactory sf;
	private Session session;
	private List<ManagerBean> list=new ArrayList<>();
	public ManagerDAO(SessionFactory sf) {
		this.sf=sf;
	}
	public List<ManagerBean> selectAll(){
		session=sf.getCurrentSession();
		Query<ManagerBean> q=session.createQuery("from ManagerBean");
		list=q.list();
		if(list.size()!=0) {
			return list;
		}
		return null;
	}
	
	public ManagerBean selectByName(String name) {
		session=sf.getCurrentSession();
		ManagerBean mb=session.get(ManagerBean.class,name);
		if(mb!=null) {
			return mb;
		}
		return null;
	}	
	
	public ManagerBean insert(ManagerBean mb) {
		session=sf.getCurrentSession();
		session.save(mb);
		return mb;
	}
	public ManagerBean update(ManagerBean mb) {
		session=sf.getCurrentSession();
		session.update(mb);
		return mb;
	}
	public boolean delete(ManagerBean mb) {
		session=sf.getCurrentSession();
		session.delete(mb);
		return true;
	}

}
