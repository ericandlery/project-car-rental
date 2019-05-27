package model.tour;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@Service
@Scope(value="prototype")
@Lazy(value=true)
public class TourService {
	@Autowired
	private TourDAO tdao;
	@Autowired
	private TourBean tb;
	private List<TourBean> list;
	
	public List<TourBean> selectAll(){
		return tdao.selectAll();
	}
	
	
	
	
	
	public List<TourBean> selectByArea(String area){
		
		//location==area
		System.out.print("((Service"+area+"  Service))");
		
		
		if(area.equals("north")) {
			return tdao.selectByArea("北部");	
			
		}else if(area.equals("west")) {
			return tdao.selectByArea("中部");
			
		}else if(area.equals("south")) {
			return tdao.selectByArea("南部");
			
		}else if(area.equals("east")) {
			return tdao.selectByArea("東部");
			
		}else {
			return null;
		}
		
	}
	
	
	public TourBean insert(TourBean tb) {
		
		if(tb.getId()!=null) {
			return tdao.insert(tb);
		}else
		return null;
	}
	
	
	public TourBean insertTour(TourBean tb,String indexTourName,String indexTourAddress,Integer indexTourPrice,
			String indexTourBranch_name,
			String indexTourDescription,String indexTourArea) {
		
		tb.setName(indexTourName);
		tb.setAddress(indexTourAddress);
		tb.setPrice(indexTourPrice);
		tb.setPhoto(String.valueOf(tb.getName())+".jpeg");//寫入資料庫
		tb.setBranch_name(indexTourBranch_name);
		
		
		tb.setDescription(indexTourDescription);
		tb.setArea(indexTourArea);
		
		return tdao.insert(tb);
				
	}
	
	public TourBean updateTour(TourBean tb,Integer indexTourId, String indexTourName,String indexTourAddress,
			Integer indexTourPrice,
			String indexTourBranch_name,
			String indexTourDescription,String indexTourArea) {

		
		System.out.print("(((updateTour)))");
		
		tb.setId(indexTourId);
		tb.setName(indexTourName);
		tb.setAddress(indexTourAddress);
		tb.setPrice(indexTourPrice);
		tb.setPhoto(String.valueOf(tb.getName())+".jpeg");//寫入資料庫
		tb.setBranch_name(indexTourBranch_name);
		
		tb.setDescription(indexTourDescription);
		tb.setArea(indexTourArea);
		
		return tdao.update(tb);
	}
	

	
	public TourBean selectById(Integer Id) {
		return tdao.selectById(Id);
	}
	
	
	public boolean delete(Integer Id) {
		return tdao.delete(Id);
	}
	
	
	public TourBean addTourPoto(TourBean tb) {
		
		return tdao.insertPoto(tb);
	}
	
	
	

}
