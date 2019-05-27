package model.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.branch.BranchBean;

@Repository
public class ModelDAO {
	@Autowired
	private SessionFactory sessionFactory;
	private Session session;
	public Session getSession() {
		return this.sessionFactory.getCurrentSession();
	}

	public List<ModelBean> selectAll() {
		return this.getSession().createQuery("from ModelBean", ModelBean.class).list();
	}

	public ModelBean selectByName(String name) {
		org.hibernate.query.Query<ModelBean> query = this.getSession().createQuery("from ModelBean where name=?",
				ModelBean.class);
		query.setParameter(0, name);
		List<ModelBean> list = query.list();
		if (list.size() == 1) {
			return list.get(0);
		}
		return null;

	}

	public ModelBean selectById(int id) {
		return this.getSession().get(ModelBean.class, id);

	}
	
	public ModelBean selectByIdQ(int id) {
		session=sessionFactory.getCurrentSession();
		ModelBean bb=session.get(ModelBean.class,id);
		return bb;
	}

	public ModelBean insert(ModelBean bean) {

			this.getSession().save(bean);

		return null;
	}

	public boolean update(ModelBean bean) {
		if (bean != null) {
			this.getSession().update(bean);
			return true;
		}
		return false;
	}
	
	public boolean updateById(ModelBean bean) {
		if (bean != null) {
			this.getSession().update(bean.getId());
			return true;
		}
		return false;
	}

	public boolean delete(int deletemodelid) {
		session=sessionFactory.getCurrentSession();
		ModelBean bb=this.selectByIdQ(deletemodelid);
		if(bb!=null) {
		session.delete(bb);
		return true;
		}else {
			return false;
		}
		
	}
////////////////////查詢所有座位數
	public List<Integer> selectAllSeat(String category){
		return this.getSession().createQuery("select distinct m.seat from ModelBean m join Car_categoryBean c on m.category_id=c.id where c.license_leval='"+category+"' order by m.seat asc").list();

	}
/////////////////根據使用者選的車種及座位數查詢
	public List<Integer> selectModelBySeatAndCategory(int seat,String category){
		return this.getSession().createQuery("select m.id from ModelBean m join Car_categoryBean c on m.category_id=c.id where c.license_leval='"+category+"' and m.seat="+seat).list();
	}
////////////////同上，取出所有廠牌
	public List<String> selectDistinctBrandBySeatAndCategory(int seat,String category){
		return this.getSession().createQuery("select distinct m.brand from ModelBean m join Car_categoryBean c on m.category_id=c.id where c.license_leval='"+category+"' and m.seat="+seat).list();
	}
//////////////同上，多用廠牌分類
	public List<Integer> selectModelsByBrandsAndCategory(int seat,String category,String brand){
		return this.getSession().createQuery("select m.id from ModelBean m join Car_categoryBean c on m.category_id=c.id where c.license_leval='"+category+"' and m.seat="+seat+" and m.brand='"+brand+"'").list();
	}
////////////依車種Id查詢
	public List<ModelBean> selectByCategoryId(Integer id){
		return this.getSession().createQuery("from ModelBean where category_id="+id).list();
	}
}
