package model.airfield;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public class AirfieldDAO {
	private SessionFactory sf;
	private Session session;
	public AirfieldDAO(SessionFactory sf) {
		this.sf=sf;
	}
	
	public List<AirfieldBean> selectAll(){
		session=sf.getCurrentSession();
		return session.createQuery("from AirfieldBean").list();
	}
	
	public AirfieldBean selectById(int id) {
		session=sf.getCurrentSession();
		return session.get(AirfieldBean.class,id);
	}
	
	public void insert(AirfieldBean ab) {
		session=sf.getCurrentSession();
		session.save(ab);
	}
	
	public void update(AirfieldBean ab) {
		session=sf.getCurrentSession();
		session.update(ab);
	}
	
	public void delete(AirfieldBean ab) {
		session=sf.getCurrentSession();
		session.delete(ab);
	}

}
