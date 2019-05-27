package model.branch;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import model.car.CarBean;
import model.car.CarDAO;

@Service
@Scope(value="prototype")
@Lazy(value=true)
public class BranchService {
	@Autowired
	private BranchDAO bdao;
	@Autowired
	private BranchBean bb;
	@Autowired
	private CarDAO cdao;
	@Autowired
	private CarBean cb;
	
	public List<BranchBean> selectAll(){
		return bdao.selectAll();
	}
	
	public BranchBean selectByName(String name) {
		return bdao.selectByName(name);
	}
	
	public BranchBean insert(BranchBean bb) {
		if(bb.getName()!=null) {
		return bdao.insert(bb);
		}else {
			return null;
		}
	}
	

	
	public boolean delete(String name) {
		return bdao.delete(name);
	}
	
	public List<BranchBean> selectAllBranchOrder(String order,String sort){
		return bdao.selectAllBranchOrder(order, sort);
	}

	public BranchBean insertBranch(BranchBean bb,String indexBranchName,String indexBranchAddress,
			   String indexBranchTele,String indexBranchPhoto,String selectlocation01) {

		bb.setName(indexBranchName);
		bb.setAddress(indexBranchAddress);
		bb.setTele(indexBranchTele);
		bb.setLocation(selectlocation01);
		return bdao.insert(bb);
	}


	public BranchBean updateBranch(BranchBean bb,String indexBranchName, String indexBranchAddress, String indexBranchTele,String selectlocation01) {
		bb.setAddress(indexBranchAddress);
		bb.setTele(indexBranchTele);
		bb.setName(indexBranchName); 
		bb.setLocation(selectlocation01);
		return bdao.update(bb,indexBranchName,indexBranchAddress,indexBranchTele,selectlocation01);
		
	}
	public List<BranchBean> selectByLocation(String selectlocation) {
		return bdao.selectByLocation(selectlocation);
	}
	
	
	
}