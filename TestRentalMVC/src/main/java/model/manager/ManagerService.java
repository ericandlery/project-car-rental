package model.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@Service
@Scope(value="prototype")
@Lazy(value=true)
public class ManagerService {
	@Autowired
	private ManagerDAO mdao;
	@Autowired
	private ManagerBean mb;
	private List<ManagerBean> list;
	
	public List<ManagerBean> selectAll(){
		return mdao.selectAll();
	}
	public ManagerBean selectByName(String name) {
		return mdao.selectByName(name);
	}
	public boolean login(ManagerBean mb) {
		ManagerBean verifyMb=this.selectByName(mb.getName());
		if(verifyMb!=null) {
			if(new String(mb.getPassword()).equals(new String(verifyMb.getPassword()))) {
				return true;
			}
		}
		return false;
	}
}
