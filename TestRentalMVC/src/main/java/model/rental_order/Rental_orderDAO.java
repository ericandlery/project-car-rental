package model.rental_order;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class Rental_orderDAO {
	
	private Session session;
	private SessionFactory sf;
	private List<Rental_orderBean> list=new ArrayList<>();;
	
	public Rental_orderDAO(SessionFactory sf) {
		this.sf=sf;
	}
	public List<Rental_orderBean> selectAll(){
		session=sf.getCurrentSession();
		Query<Rental_orderBean> q=session.createQuery("from Rental_orderBean");
		list=q.list();
		return list;
	}
	public Rental_orderBean selectById(int id) {
		session=sf.getCurrentSession();
		Rental_orderBean rb=session.get(Rental_orderBean.class,id);
		return rb;
	}
	public List<Rental_orderBean> selectByMemId(int id) {
		session=sf.getCurrentSession();
		Query<Rental_orderBean> q=session.createQuery("from Rental_orderBean where memid=?");
		q.setParameter(0,id);
		list=q.list();
		System.out.println(list.size());
		if(list.size()!=0) {
			return list;
		}else {
			return null;
		}
	}
	//////////依日期排序
	public List<Rental_orderBean> selectByMemIdOrderByDate(int id) {
		session=sf.getCurrentSession();
		Query<Rental_orderBean> q=session.createQuery("from Rental_orderBean where memid=? order by order_date desc");
		q.setParameter(0,id);
		list=q.list();
		if(list.size()!=0) {
			return list;
		}else {
			return null;
		}
	}
	public Rental_orderBean insert(Rental_orderBean rb) {
		session=sf.getCurrentSession();
		session.save(rb);
		return rb;
	}
	public Rental_orderBean update(Rental_orderBean rb) {
		session=sf.getCurrentSession();
		session.update(rb);
		return this.selectById(rb.getId());
	}
	public boolean delete(int id) {
		session=sf.getCurrentSession();
		Rental_orderBean rb=session.get(Rental_orderBean.class,id);
		if(rb!=null) {
		session.delete(rb);
		return true;
		}else {
			return false;
		}
	}
	public List<Rental_orderBean> selectAllOrderBy(String order,String sort){
		session=sf.getCurrentSession();
		Query<Rental_orderBean> q=session.createQuery("from Rental_orderBean order by "+order+" "+sort);
		if(q.list().size()!=0) {
			return q.list();
		}
		return null;
	}
	///////////依"取車"或"還車"據點查詢
	public List<Rental_orderBean> selectByStartEndBranch(String branch_name,String startend){
		session=sf.getCurrentSession();
		Query<Rental_orderBean> q=null;
		if(startend.equals("start")) {
			q=session.createQuery("from Rental_orderBean where start_branch_name='"+branch_name+"'");
		}else {
			q=session.createQuery("from Rental_orderBean where end_branch_name='"+branch_name+"'");
		}
		list=q.list();
		if(list.size()!=0) {
			return list;
		}else {
			return null;
		}
	}

}
