package model.coupon;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class CouponDAO {

	private Session session;
	private SessionFactory sf;

	public CouponDAO(SessionFactory sf) {
		this.sf = sf;
	}

	private List<CouponBean> list;

	public List<CouponBean> selectAll() {
		session = sf.getCurrentSession();
		Query<CouponBean> q = session.createQuery("from CouponBean");
		list = q.list();
		return list;
	}

	public CouponBean selectByName(String name) {
		session = sf.getCurrentSession();
		Query<CouponBean> q = session.createQuery("from CouponBean where name=?");
		q.setParameter(0, name);
		list = q.list();
		if (list.size() == 1) {
			return list.get(0);
		} else {
			return null;
		}
	}

	public CouponBean insertOrUpdate(CouponBean cb) {
		session = sf.getCurrentSession();
		if (this.selectByName(cb.getName()) == null) {
			session.saveOrUpdate(cb);
			return cb;
		} else {
			return null;
		}
	}

	public boolean delete(String name) {
		session = sf.getCurrentSession();
		CouponBean cbd = new CouponBean();
		cbd.setName(name);
		session.delete(cbd);
		return true;
	}

}
