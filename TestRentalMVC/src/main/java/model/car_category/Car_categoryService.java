package model.car_category;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
@Service
@Scope(value="prototype")
@Lazy(value=true)
public class Car_categoryService {
	@Autowired
	private Car_categoryDAO car_CategoryDAO;
	@Autowired
	private Car_categoryBean ccb;

	public Car_categoryBean selectById(int id) {
		return car_CategoryDAO.selectById(id);
	}
	

	public List<Car_categoryBean> showCarCategory() {

		List<Car_categoryBean> result = car_CategoryDAO.selectAll();
		if (result != null) {
			return result;
		}

		return null;
	}
	
/////////////照出所有提供的駕照級別
	public List<String> getAllLicense(){
		return car_CategoryDAO.selectAllLicenseName();
	}
///////////比較會員駕照等級夠不夠使用高級車種(會員的駕照名稱,車的駕照ID)
	public boolean compareLevel(String memLevel,Integer cateId) {
		int memLevelId=car_CategoryDAO.selectByName(memLevel).getId();////會員的駕照等級
		int carLevelId=car_CategoryDAO.selectById(cateId).getId();////車的駕照等級
		
		if(memLevelId<carLevelId) {
			//////////等級不夠
			return false;
		}else {
			//////////等級夠，可以租
			return true;
		}
		
	}
}
