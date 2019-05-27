package model.message;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
@Repository
public class MessageDAO {
	private Session session;
	private SessionFactory sf;
	public MessageDAO(SessionFactory sf) {
		this.sf=sf;
	}
	
	public List selectBytitle (String title) {
		session=sf.getCurrentSession();
//		"select m.mem_photo,m.id,m.name,m.email,f.relationship,f.id from FriendlistBean f join MemberBean m on m.id=f.mem_id_myself where f.mem_id_friend = ? and f.relationship = ?"
		Query q=session
		.createQuery("select mbr.mem_photo,mbr.name,mes.message,mes.message_datetime,mes.id from MessageBean mes join MemberBean mbr on mes.mem_id=mbr.id   where mes.title=?");
		q.setParameter(0,title);
		List list=q.list();
		
		return list;
	}
	public List selectreportmessage() {
		session=sf.getCurrentSession();
		Query q=session
				.createQuery("select mbr.mem_photo,mbr.name,mes.message,mes.message_datetime,mes.id from MessageBean mes join MemberBean mbr on mes.mem_id=mbr.id   where mes.report='report'");
		List list=q.list();
		return list;
	}
	public Boolean insert(MessageBean mesb) {
		session=sf.getCurrentSession();
		session.save(mesb);
		return true;
	}
	
	public Boolean update(MessageBean mesb) {
		session=sf.getCurrentSession();
		session.update(mesb);
		return true;
	}
	public MessageBean selectbyid(int id) {
		session=sf.getCurrentSession();
		Query q=session.createQuery("from MessageBean where id =?");
		q.setParameter(0,id);
		MessageBean messbean = (MessageBean) q.getSingleResult();
		return messbean;
	}
	public Boolean updatereport(MessageBean mesb) {
		mesb.setReport("report");
		return true;
	}
	public Boolean delete(String title) {
		session=sf.getCurrentSession();
		Query q=session.createQuery("delete from MessageBean where title=?");
		q.setParameter(0,title);
		int delete = q.executeUpdate();
		if(delete>0){
			return true;
		}
		return false;
	}
}
