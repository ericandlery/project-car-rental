package model.wallethistory;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@Service
@Scope(value="prototype")
@Lazy(value=true)
public class WalletHistoryService {
	@Autowired
	private WalletHistoryDAO wdao;
	@Autowired
	private WalletHistoryBean wb;
	private List<WalletHistoryBean> list;
	public List<WalletHistoryBean> selectAll() {
		return wdao.selectAll();
	}
	public List<WalletHistoryBean> selectById(Integer id) {
		return wdao.selectById(id);
	}
	public WalletHistoryBean addWalletHistory(int id,String id_card,int omg, String dateStringParse) {
		wb.setCredit(omg);
		wb.setId_card(id_card);
		wb.setId(id);
		wb.setThedate(dateStringParse);
	//	wb.setThedate(str);
		return wdao.insert(wb);
	}
	public String check(String creditcard01,String creditcard02,String creditcard03,String creditcard04,String creditcard05,String credit){
			       
//		System.out.println(creditcard01.matches("^[0-9]*$"));
					
		if(creditcard01.length()!=4||creditcard02.length()!=4||creditcard03.length()!=4||creditcard04.length()!=4){
			return "checkerror01";
		}else if((creditcard01.matches("^[0-9]*$"))==false || (creditcard02.matches("^[0-9]*$"))==false || (creditcard03.matches("^[0-9]*$"))==false || (creditcard04.matches("^[0-9]*$"))==false) {
			return "checkerror04";
		}else if(creditcard05.length()!=3) {
			return "checkerror02";
		}else if((creditcard05.matches("^[0-9]*$"))==false) {
			return "checkerror05";
		}else if(credit.length()==0 || (credit.matches("^(0|[1-9][0-9]*)$"))==false){
			return "checkerror03";
		}
		return "checkok";
	}
//	public WalletHistoryBean insert(int id) {
//		return wdao.selectById(id);
//	}


}
