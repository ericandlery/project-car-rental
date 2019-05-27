package model.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ModelService {
	@Autowired
	private ModelDAO modelDAO;

	public ModelBean selectById(int id) {
		return modelDAO.selectById(id);
	}
	
	public boolean deleteById(int deletemodelid) {
		return modelDAO.delete(deletemodelid);
	}
	
	public ModelBean addNewCar(ModelBean bean) {
		
		return modelDAO.insert(bean);
	}
	
	
	public List<ModelBean> showAllModel(){
		List<ModelBean> list =modelDAO.selectAll();
		if(list!=null)return list;
		return null;
	}
	
/////////////////////查座位數(依車種分類)，分類時可用(接送服務)
	public List<Integer> showAllSeat(String category){
		return modelDAO.selectAllSeat(category);
	}
	
/////////////////////根據座位數選擇車型，分類時可用(接送服務)
	public List<ModelBean> showAllModelBySeat(int seatCount,String category){
		/////////找出座位數
		List<Integer> temp=modelDAO.selectModelBySeatAndCategory(seatCount, category);
		/////////再分別找出各座位數有的車
		List<ModelBean> list=new ArrayList<>();
		for(int i=0;i<temp.size();i++) {
			ModelBean mb=this.selectById(temp.get(i));
			list.add(mb);
		}
		////////加到List中
		if(list.size()!=0) {
			return list;
		}else {
			return null;
		}
	}
	
////////////////////同上，但多做以Model分類(接送服務)(Model-Car)
	public List<List> showAllModelCarsOrderByCategory(int seatCount,String category){
		/////取出滿足條件的廠牌
		List<String> brands=modelDAO.selectDistinctBrandBySeatAndCategory(seatCount, category);
		
		List<List> finalList=new ArrayList<>();
		
		for(String brand:brands) {
			List<Integer> carIdOfABrand=modelDAO.selectModelsByBrandsAndCategory(seatCount, category, brand);
			List<ModelBean> brandList=new ArrayList<>();
			for(int id:carIdOfABrand) {
				ModelBean modelsOfABrand=modelDAO.selectById(id);
				brandList.add(modelsOfABrand);
			}
			finalList.add(brandList);
		}
		
		if(finalList.size()!=0) {
			return finalList;
		}else{
			return finalList;
		}
	}

	public boolean updateById(ModelBean bean) {
		// TODO Auto-generated method stub
		boolean gg = modelDAO.update(bean);
		System.out.println("gg="+gg);
		if(gg){
		return true;
		}else{
			return false;
		}
	}
//////////////依車種查詢車型
	public List<ModelBean> selectByCategoryId(Integer id){
		return modelDAO.selectByCategoryId(id);
	}

	public List<ModelBean> selectAll() {
		// TODO Auto-generated method stub
		return modelDAO.selectAll();
	}
}
