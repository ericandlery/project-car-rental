package model.customer_service;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@Service
@Scope(value="prototype")
@Lazy(value=true)
public class Customer_serviceService {
	@Autowired
	private Customer_serviceDAO csdao;
	
	public List<Customer_serviceBean> selectAll(){
		return csdao.selectAll();
	}
	
	public Customer_serviceBean selectById(Integer id) {
		return csdao.selectById(id);
	}
//////////以名字查詢留言
	public List<Customer_serviceBean> selectByName(String name){
		return csdao.selectByName(name);
	}
	
///////////客戶新增意見，自動填寫新增日期，自動過濾不雅字詞
	public void addNewOpinion(Customer_serviceBean csb) {
		csb.setDatetime(new Timestamp(new Date().getTime()));
		/////過濾
		String text=csb.getText();
		String newTxt=text.replace("幹","**");
		csb.setText(newTxt);
		
		csb.setTitle(csb.getTitle().replace("幹","**"));
		csdao.insert(csb);
	}
	
	public void updateOpinion(Customer_serviceBean csb) {
		csdao.update(csb);
	}
	
	public void deleteOpinion(Customer_serviceBean csb) {
		csdao.delete(csb);
	}

}
