package model.member;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Service
@Scope(value="prototype")
@Lazy(value=true)
public class MemberService {
//	@Autowired
//	private ServletContext ctx;
	@Autowired
	private MemberDAO mdao;
	@Autowired
	private MemberBean mb;
	
	public void clearSession() {
		mdao.clearSession();
	}
	public List selectAll() {
		return mdao.selectAll();
	}
	public MemberBean selectById(int id) {
		return mdao.selectById(id);
	}
	public MemberBean selectByEmail(String email) {
		return mdao.selectByEmail(email);
	}
///////////加會員和照片
	public MemberBean addMember(MemberBean mb) {
		mb.setWallet(0);
		mb.setBonuspoint(0);
		mb.setSubscription(true);
		mb.setMem_state("待審核");	//待審核
		mb.setRegistration_date(new Date());
	
		return mdao.insert(mb);
	}
	public int addCredit(MemberBean mb,int credit) {
		MemberBean temp=mdao.selectById(mb.getId());
		temp.setWallet(temp.getWallet()+credit);
		mdao.update(temp);
		
		return credit;
	}
	public Boolean updateMember(MemberBean mb) {
		return mdao.updateBoolean(mb);
	}
	public List<MemberBean> selectAllMemberOrderBy(String order,String sort){
		return mdao.selectAllMemberOrderBy(order,sort);
	}
	
	//以下為自己新增修改
	public MemberBean updateBonusponit(MemberBean mbb,int price) {
		System.out.println("t22222222");
		mbb.setBonuspoint(mbb.getBonuspoint()+price);
		MemberBean mb = mdao.update(mbb);
		System.out.println("t55555555");
		return mb;
	}
	
////////查出待審核的會員給管理員
	public List<MemberBean> getUnReviewedMembers(){
		return mdao.selectByState("待審核");
	}
///	
	
}
