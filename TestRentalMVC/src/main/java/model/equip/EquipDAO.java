package model.equip;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public class EquipDAO {

	private SessionFactory sf;
	private Session session;
	private List<EquipBean> list=new ArrayList<>();
	public EquipDAO(SessionFactory sf) {
		   this.sf=sf;
	}
	
	public EquipBean insert(EquipBean eb) {
		session=sf.getCurrentSession();
		session.save(eb);
		return eb;
	}
	
	private EquipBean selectById(int id) {
		session=sf.getCurrentSession();
		Query<EquipBean> q=session.createQuery("from EquipBean where id=?");
		q.setParameter(0,id);
		list=q.list();
		if(list.size()==1) {
			return list.get(0);
		}else {
			return null;
		}
	}

	public EquipBean update(EquipBean eb) {
			session=sf.getCurrentSession();
			session.update(eb);
			return eb;
	}

	public Boolean updateBoolean(EquipBean mb) {
		session=sf.getCurrentSession();
		System.out.println(mb);
        session.update(mb);
		return true;
	}
	
	public boolean delete(EquipBean eb) {
		session=sf.getCurrentSession();
		session.delete(eb);
		return true;
	}
}
