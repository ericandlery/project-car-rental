package test;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

@Repository
public class TestDAO {
	
	private SessionFactory sf;
	private Session session;
	public TestDAO(SessionFactory sf) {
		this.sf=sf;
	}

	public List<Carcar> selectAllCar(){
		session=sf.getCurrentSession();
		return session.createQuery("from Carcar").list();
	}
	
	public List<Model> selectAllModel(){
		session=sf.getCurrentSession();
		return session.createQuery("from Model").list();
	}
	
	public void saveModel(Model m) {
		session=sf.getCurrentSession();
		session.save(m);
	}
	
	public void deleteModel(int i) {
		session=sf.getCurrentSession();
		session.delete(session.get(Model.class,i));
	}
	
	public void insertCarcar(Carcar c) {
		session=sf.getCurrentSession();
		session.save(c);
	}
	
	public Carcar selectById(int car_id) {
		session=sf.getCurrentSession();
		return session.get(Carcar.class,car_id);
	}
}
