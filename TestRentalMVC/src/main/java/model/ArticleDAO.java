package model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
@Repository
public class ArticleDAO {
	private SessionFactory sf;
	private Session session;
	public ArticleDAO(SessionFactory sf) {
		this.sf=sf;
	}
	private List<ArticleBean> list;
	public Boolean insert(ArticleBean ab) {
		session=sf.getCurrentSession();
		session.save(ab);
		
		return true;
	}
	public List<ArticleBean> selectBybrowse_count(){
		session=sf.getCurrentSession();
		Query q=session.createQuery("from ArticleBean order by browse_count desc");
		list=q.list();
		return list;
	}
	public ArticleBean selectBytitle(String title) {
		session=sf.getCurrentSession();
		Query q=session.createQuery("from ArticleBean where title=?");
		q.setParameter(0,title);
		ArticleBean ab  = (ArticleBean) q.getSingleResult();
		return ab;
	}
	public List<ArticleBean> selectByauthor(int author){
		session=sf.getCurrentSession();
		Query q=session.createQuery("from ArticleBean where author = ?");
		q.setParameter(0,author);
		list=q.list();
		System.out.println("testtestArticleDAO");
		return list;
	}
	public Boolean update(ArticleBean ab) {
		session=sf.getCurrentSession();
		session.update(ab);
		return true;
	}
	public Boolean delete(String title) {
		session=sf.getCurrentSession();
		Query q=session.createQuery("delete from ArticleBean where title=?");
		q.setParameter(0,title);
		int delete = q.executeUpdate();
		if(delete>0){
			return true;
		}
		return false;
	}
}
