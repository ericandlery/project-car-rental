package model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import model.member.MemberBean;

@Repository
public class PicDAO {
	private SessionFactory sf;
	private Session session;
	public PicDAO(SessionFactory sf) {
		this.sf=sf;
	}
	
	public void insert(PictureBean pb) {
		session=sf.getCurrentSession();
		session.save(pb);
		return;
	}
	public PictureBean selectBypicture_name(String picture_name) {
		PictureBean pb = new PictureBean();
		session=sf.getCurrentSession();
		Query<PictureBean> q=session.createQuery("from PictureBean where picture_name=?");
		q.setParameter(0,picture_name);
		pb=q.getSingleResult();
		return pb;
	}
}
