package model.wallethistory;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

@Repository
public class WalletHistoryDAO {
	
	private Session session;
	private SessionFactory sf;
	public WalletHistoryDAO(SessionFactory sf) {
		this.sf=sf;
	}
	private List<WalletHistoryBean> list = new ArrayList<>();;
	
	public List<WalletHistoryBean> selectAll(){
		session=sf.getCurrentSession();
		Query<WalletHistoryBean> q=session.createQuery("from WalletHistoryBean");
		list=q.list();
		return list;
	}

	public WalletHistoryBean selectBy(int id) {
		session=sf.getCurrentSession();
		Query<WalletHistoryBean> q=session.createQuery("from WalletHistoryBean where id=?");
		q.setParameter(0,id);
		list=q.list();
		if(list.size()==1) {
			return list.get(0);
		}else {
			return null;
		}
	}
	public WalletHistoryBean insert(WalletHistoryBean wb) {
		session=sf.getCurrentSession();
		session.save(wb);
		return wb;	
	}
	public List<WalletHistoryBean> selectById(Integer id) {
		session=sf.getCurrentSession();
		Query<WalletHistoryBean> q=session.createQuery("from WalletHistoryBean where id = ? order by thedate desc ");
//		Query<WalletHistoryBean> q=session.createQuery("from WalletHistoryBean");
		q.setParameter(0,id);
		q.setFirstResult(0).setMaxResults(5);//找出第1筆到第5筆的資料    
		list=q.list();
		for(WalletHistoryBean wb:list){
			System.out.println(wb);
		}
		return list;
		
	}


}
