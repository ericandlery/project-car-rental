package model.tour;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import model.model.ModelBean;

@Repository
public class TourDAO {
	private SessionFactory sf;
	private Session session;
	private List<TourBean> list;
	
	public Session getSession() {
		return this.sf.getCurrentSession();
	}

	public TourDAO(SessionFactory sf) {
		this.sf = sf;
	}

	public List<TourBean> selectAll() {
		session = sf.getCurrentSession();
		Query<TourBean> q = session.createQuery("from TourBean");
		list = q.list();
		if (list.size() != 0) {
			return list;
		}
		return null;
	}

	

	public List<TourBean> selectByArea(String area) {
		System.out.print("((DAO "+area+" DAO))");
		session = sf.getCurrentSession();
		Query<TourBean> q = session.createQuery("from TourBean where area='" + area + "'");
		list = q.list();
		System.out.println(list.size());
		if (list.size() != 0) {
			return list;
		} else {
			return null;
		}

	}

	
	public TourBean selectById(Integer Id) {
		session = sf.getCurrentSession();
		TourBean tb = session.get(TourBean.class, Id);
		return tb;
	}
	
	

	public TourBean insert(TourBean tb) {
		session = sf.getCurrentSession();
		System.out.println(tb);
		System.out.println("((DAO save))");
		
//		if(selectById(tb.getId()) == null) {
//			System.out.println("((DAO save if))");  //流水號尚未存在 所以無法判斷
			session.save(tb);
			return this.selectById(tb.getId());
//			return selectById(tb.getId());
//			
//			
//		}else {
//			System.out.println("((DAO save else))");
//			return null;
//			
//		}
		
	}
	
	
	public TourBean update(TourBean tb) {
		session = sf.getCurrentSession();
		
		
		System.out.print("(((   update   )))");
		
		if(selectById(tb.getId())!=null) {
			session.merge(tb);
			return selectById(tb.getId());
		}else{
			return null;
		}

	}
	
	
	
	public boolean delete(Integer Id) {
		session = sf.getCurrentSession();
		TourBean tb = selectById(Id);
		if(tb!=null) {
			session.delete(tb);
			return true;
		}else {
			return false;
		}

	}
	
	
	
	
	public TourBean insertPoto(TourBean bean) {

		this.getSession().save(bean);

	return null;
}
	
	
	
	
	
	
	
	
	
	
	
	
}
