package model.coupon;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="coupon")
public class CouponBean {
	
	private String name;
	private double discount;
	@Id
	private String code;
	private String decript;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getDiscount() {
		return discount;
	}

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDecript() {
		return decript;
	}

	public void setDecript(String decript) {
		this.decript = decript;
	}

	@Override
	public String toString() {
		return "CouponBean [name=" + name + ", discount=" + discount + ", code=" + code + ", decript=" + decript + "]";
	}
	
}
