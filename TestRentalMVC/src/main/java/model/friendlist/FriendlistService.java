package model.friendlist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import model.member.MemberBean;
import model.member.MemberDAO;

@Service
@Scope(value="prototype")
@Lazy(value=true)
public class FriendlistService {
	@Autowired
	private MemberDAO mdao;
	@Autowired
	private MemberBean mb;
	@Autowired
	private FriendlistDAO fdao;
	@Autowired
	private FriendlistBean fb;
	
	public List showfriend(int mem_id_myself,String relationship) {
		return fdao.select(mem_id_myself,relationship);
	}
	public List selectcheck(int mem_id_myself,String relationship) {
		return fdao.selectcheck(mem_id_myself,relationship);
	}
	public List searchname(String name,int id) {
		return fdao.selectNameandrelationship(name,id);
	}
	public Boolean invite(FriendlistBean fb,FriendlistBean fb2) {
		return fdao.insert(fb, fb2);
	}
	public Boolean update(FriendlistBean fb,FriendlistBean fb2) {
		return fdao.update(fb, fb2);
	}
	public FriendlistBean select(int mem_id_myself,int mem_id_friend) {
		return fdao.select(mem_id_myself,mem_id_friend);
	}
	public List<FriendlistBean> selectbyid(int fid[]){
		return fdao.selectbyid(fid);
	}
}
