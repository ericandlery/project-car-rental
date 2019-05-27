package model.message;

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
public class MessageService {
	@Autowired
	private MessageDAO mesdao;
	@Autowired
	private MessageBean mesb;
	
	public Boolean insertmessage(MessageBean mesb) {
		return mesdao.insert(mesb);
	}
	public List showthisarticlemessage(String title){
		return mesdao.selectBytitle(title);
	}
	public List showreportmessahe() {
		return mesdao.selectreportmessage();
	}
	public Boolean locktoupdate(MessageBean mesb) {
		return mesdao.update(mesb);
	}
	public Boolean reporttoupdate(MessageBean mesb) {
		return mesdao.updatereport(mesb);
	}
	public MessageBean select(int id) {
		return mesdao.selectbyid(id);
	}
	public Boolean delete(String title) {
		return mesdao.delete(title);
	}
}
