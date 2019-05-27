package model.member;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	private Session session;
	private SessionFactory sf;
	public MemberDAO(SessionFactory sf) {
		this.sf=sf;
	}
	private List<MemberBean> list;
	
	public void clearSession() {
		session.clear();
	}
	
	public List<MemberBean> selectAll(){
		session=sf.getCurrentSession();
		Query<MemberBean> q=session.createQuery("from MemberBean");
		list=q.list();
		return list;
	}
	public MemberBean selectById(int id) {
		session=sf.getCurrentSession();
		Query<MemberBean> q=session.createQuery("from MemberBean where id=?");
		q.setParameter(0,id);
		list=q.list();
		if(list.size()==1) {
			return list.get(0);
		}else {
			return null;
		}
	}
	public MemberBean selectByEmail(String email) {
		session=sf.getCurrentSession();
		Query<MemberBean> q=session.createQuery("from MemberBean where email=?");
		q.setParameter(0,email);
		list=q.list();
		if(list.size()==1) {
			return list.get(0);
		}else {
			return null;
		}
	}
	public MemberBean insert(MemberBean mb) {
		session=sf.getCurrentSession();
		if(this.selectByEmail(mb.getEmail())==null) {
		session.save(mb);
		return mb;
		}else {
			return null;
		}
	}
	public MemberBean update(MemberBean mb) {
		session=sf.getCurrentSession();
		session.update(mb);
		return mb;
	}
	public Boolean updateBoolean(MemberBean mb) {
		session=sf.getCurrentSession();
		System.out.println(mb);
		session.update(mb);
		return true;
	}
	public List<MemberBean> selectAllMemberOrderBy(String order,String sort){
		session=sf.getCurrentSession();
		Query<MemberBean> q=session.createQuery("from MemberBean order by "+order+" "+sort);
		if(q.list().size()!=0) {
			return q.list();
		}
		return null;
	}
/////////依會員狀態查詢
	public List<MemberBean> selectByState(String mem_state){
		session=sf.getCurrentSession();
		return session.createQuery("from MemberBean where mem_state='"+mem_state+"'").list();
	}
}
