package model.friendlist;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.mapping.Array;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class FriendlistDAO {
	private Session session;
	private SessionFactory sf;
	public FriendlistDAO(SessionFactory sf) {
		this.sf=sf;
	}
	public List<FriendlistBean> selectbyid(int fid[]){
		session=sf.getCurrentSession();
		List<FriendlistBean> list = new ArrayList<FriendlistBean>();
		for(int i = 0;i<fid.length;i++) {
			Query q=session.createQuery("from FriendlistBean where id =?");
			q.setParameter(0,fid[i]);
			System.out.println("ffff"+fid[i]);
			FriendlistBean temp=(FriendlistBean) q.getSingleResult();
			list.add(temp);
		}
		return list;
	}
	public List select (int mem_id_myself,String relationship) {
		session=sf.getCurrentSession();
		Query q=session
		.createQuery("select m.mem_photo,m.id,m.name,m.email,f.relationship,f.id from FriendlistBean f join MemberBean m on m.id=f.mem_id_myself where f.mem_id_friend = ? and f.relationship = ?");
		q.setParameter(0,mem_id_myself);
		q.setParameter(1,relationship);
		List<Object[]> list=q.list();
		return list;
	}
	public List selectcheck (int mem_id_myself,String relationship) {
		session=sf.getCurrentSession();
		Query q=session
				.createQuery("select m.mem_photo,m.id,m.name,m.email,f.relationship,f.id from FriendlistBean f join MemberBean m on m.id=f.mem_id_myself where f.mem_id_friend = ? and f.relationship = ? and lookcheck is null");
		q.setParameter(0,mem_id_myself);
		q.setParameter(1,relationship);
		List<Object[]> list=q.list();
		return list;
	}
	public List selectName(String name) {
		session=sf.getCurrentSession();
		Query q=session
		.createQuery("select m.mem_photo,m.id,m.name,m.email,f.relationship,f.id from MemberBean m left join FriendlistBean f on m.id=f.mem_id_myself where m.name = ?");
		q.setParameter(0,name);
		List<Object[]> list=q.list();
		return list;
	}
	public Boolean insert(FriendlistBean fb,FriendlistBean fb2) {
		session=sf.getCurrentSession();
		session.save(fb);
		session.save(fb2);
		return true;
	}
	public Boolean update(FriendlistBean fb,FriendlistBean fb2) {
		session=sf.getCurrentSession();
		//好問題
//		session.update(fb);
//		session.update(fb2);
		session.merge(fb);
		session.merge(fb2);
		return true;
	}
	public FriendlistBean select(int mem_id_myself,int mem_id_friend) {
		session=sf.getCurrentSession();
		Query q=session
		.createQuery("from FriendlistBean where mem_id_myself = ? and mem_id_friend=?");
		q.setParameter(0,mem_id_myself);
		q.setParameter(1,mem_id_friend);
		FriendlistBean userfb = (FriendlistBean) q.getSingleResult();
		return userfb;
	}
//	select * from member m  left join friendlist f
//	on f.mem_id_friend = 2 and f.mem_id_myself = m.id
//	where not m.id=2 and name='Sam'
	public List selectNameandrelationship(String name,int id) {
		session=sf.getCurrentSession();
//		Query q=session
//		.createQuery("select m.mem_photo,m.id,m.name,m.email,f.relationship from MemberBean m  left join FriendlistBean f on f.mem_id_friend = 2 and f.mem_id_myself = m.id where not m.id=2 and name='Sam'");
		String use = "%"+name+"%";
		
		
		
		Query q=session
				.createQuery("select m.mem_photo,m.id,m.name,m.email,f.relationship from MemberBean m  left join FriendlistBean f on f.mem_id_friend = ? and f.mem_id_myself = m.id where not m.id=? and name like ?");
		q.setParameter(0,id);
		q.setParameter(1,id);
		q.setParameter(2,use);
		List<Object[]> list=q.list();
		System.out.println("==============");
		for(Object[] tt:list) {
			System.out.println(tt[0]+","+tt[1]);
		}
		System.out.println("==============");
		
		return list;
	}
	
}
