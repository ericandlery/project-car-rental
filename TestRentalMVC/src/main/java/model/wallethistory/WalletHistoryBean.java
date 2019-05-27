package model.wallethistory;

import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
@Table(name="wallethistory")
@Component
public class WalletHistoryBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer num;
	private Integer id;
	private String id_card;
	private Integer credit;
	private String thedate;
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getId_card() {
		return id_card;
	}
	public void setId_card(String id_card) {
		this.id_card = id_card;
	}
	public Integer getCredit() {
		return credit;
	}
	public void setCredit(Integer credit) {
		this.credit = credit;
	}
	public String getThedate() {
		return thedate;
	}
	public void setThedate(String thedate) {
		this.thedate = thedate;
	}
	@Override
	public String toString() {
		return "WalletHistoryBean [id=" + id + ", id_card=" + id_card + ", credit=" + credit + ", thedate=" + thedate
				+ "]";
	}
	
	
	
	
}
