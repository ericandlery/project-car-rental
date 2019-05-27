package model.airfield;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@Service
@Scope(value="prototype")
@Lazy(value=true)
public class AirfieldService {
	@Autowired
	private AirfieldDAO adao;
	@Autowired
	private AirfieldBean ab;
	
	public List<AirfieldBean> selectAll(){
		List<AirfieldBean> list=adao.selectAll();
		if(list.size()!=0) {
			return list;
		}
		return null;
	}
	
	public AirfieldBean selectById(int id) {
		return adao.selectById(id);
	}
}
