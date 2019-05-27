package model.staff;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@Service
@Scope(value="prototype")
@Lazy(value=true)
public class StaffService {
	@Autowired
	private StaffDAO sdao;
	@Autowired
	private StaffBean sb;
	private List<StaffBean> list;
	
	public List<StaffBean> selectAll(){
		return sdao.selectAll();
	}
	public List<StaffBean> selectByName(String name) {
		return sdao.selectByName(name);
	}
	public StaffBean login(StaffBean sb) {
		List<StaffBean> verifySb=this.selectByName(sb.getName());
		if(verifySb!=null) {
			for(StaffBean staffb:verifySb) {
				if(new String(sb.getPassword()).equals(new String(staffb.getPassword()))) {
					return staffb;
				}
			}

		}
		return null;
	}
/////////依主鍵(Id)查詢
	public StaffBean selectById(Integer id) {
		return sdao.selectById(id);
	}
/////////新增或修改
	public void insertOrUpdate(StaffBean sb) {
		sdao.insertOrUpdate(sb);
		return;
	}
//////////刪除
	public boolean delete(StaffBean sb) {
		return sdao.delete(sb);
	}
}
