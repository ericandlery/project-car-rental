package model.branch;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class BranchDAO {
	private SessionFactory sf;
	private Session session;
	public BranchDAO(SessionFactory sf) {
		this.sf=sf;
	}
	private List<BranchBean> list=new ArrayList<>();
	
	public List<BranchBean> selectAll(){
		session=sf.getCurrentSession();
		Query q=session.createQuery("from BranchBean");
		list=q.list();
//		System.out.println(list);
			return list;

	}
	
	public BranchBean selectByName(String name) {
		session=sf.getCurrentSession();
		BranchBean bb=session.get(BranchBean.class,name);
		return bb;
	}
	
	public BranchBean insert(BranchBean bb) {
		session=sf.getCurrentSession();
		if(this.selectByName(bb.getName())==null) {
		session.save(bb);
		return this.selectByName(bb.getName());
		}else {
			return null;
		}
	}
	
	
	public BranchBean update(BranchBean bb,String indexBranchName, String indexBranchAddress, String indexBranchTele,String selectlocation01) {
		session=sf.getCurrentSession();
		if(this.selectByName(indexBranchName)!=null) {
			session.clear();
			session.update(bb);
			return this.selectByName(indexBranchName);
		}else {
			return null;
		}
	}
	
	public boolean delete(String name) {
		session=sf.getCurrentSession();
		BranchBean bb=this.selectByName(name);
		if(bb!=null) {
		session.delete(bb);
		return true;
		}else {
			return false;
		}
	}
	
	
	public List<BranchBean> selectAllBranchOrder(String order,String sort){
		session=sf.getCurrentSession();
		Query<BranchBean> q=session.createQuery("from BranchBean order by "+order+" "+sort);
		list=q.list();
		if(list.size()!=0) {
			return list;
		}else {
			return null;
		}
	}

	public List<BranchBean> selectByLocation(String selectlocation){
		session=sf.getCurrentSession();
		System.out.println("bdao="+selectlocation);
		Query q=session.createQuery("from BranchBean where location=?");
		q.setParameter(0,selectlocation);
		list=q.list();
		System.out.println("bdao="+list);
		if(list.size()!=0) {
			return list;
		}else {
			return null;
		}
	}
	
}
