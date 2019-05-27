package model.member;

import java.io.Serializable;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
@Table(name="member")
@Component
public class MemberBean{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String email;
	private byte[] password;
	private String name;
	private String id_card;
	private String address;
	private java.util.Date birth;
	private String phone;
	private String tel;
	private Integer wallet;
	private Integer bonuspoint;
	private String mem_photo;
	private Boolean subscription;
	private String mem_state;
	private java.util.Date registration_date;
	private String license_num;
	private String license_leval;
	private String license_photo;
	
	
	
	@Override
	public String toString() {
		return "MemberBean [id=" + id + ", email=" + email + ", password=" + Arrays.toString(password) + ", name="
				+ name + ", id_card=" + id_card + ", address=" + address + ", birth=" + birth + ", phone=" + phone
				+ ", tel=" + tel + ", wallet=" + wallet + ", bonuspoint=" + bonuspoint + ", mem_photo=" + mem_photo
				+ ", subscription=" + subscription + ", mem_state=" + mem_state + ", registration_date="
				+ registration_date + ", license_num=" + license_num + ", license_leval=" + license_leval
				+ ", license_photo=" + license_photo + "]";
	}
	
	public String getLicense_photo() {
		return license_photo;
	}

	public void setLicense_photo(String license_photo) {
		this.license_photo = license_photo;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public byte[] getPassword() {
		return password;
	}
	public void setPassword(byte[] password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId_card() {
		return id_card;
	}
	public void setId_card(String id_card) {
		this.id_card = id_card;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public java.util.Date getBirth() {
		return birth;
	}
	public void setBirth(java.util.Date birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Integer getWallet() {
		return wallet;
	}
	public void setWallet(Integer wallet) {
		this.wallet = wallet;
	}
	public Integer getBonuspoint() {
		return bonuspoint;
	}
	public void setBonuspoint(Integer bonuspoint) {
		this.bonuspoint = bonuspoint;
	}
	public String getMem_photo() {
		return mem_photo;
	}
	public void setMem_photo(String mem_photo) {
		this.mem_photo = mem_photo;
	}
	public Boolean getSubscription() {
		return subscription;
	}
	public void setSubscription(Boolean subscription) {
		this.subscription = subscription;
	}
	public String getMem_state() {
		return mem_state;
	}
	public void setMem_state(String mem_state) {
		this.mem_state = mem_state;
	}
	public java.util.Date getRegistration_date() {
		return registration_date;
	}
	public void setRegistration_date(java.util.Date registration_date) {
		this.registration_date = registration_date;
	}
	public String getLicense_num() {
		return license_num;
	}
	public void setLicense_num(String license_num) {
		this.license_num = license_num;
	}
	public String getLicense_leval() {
		return license_leval;
	}
	public void setLicense_leval(String license_leval) {
		this.license_leval = license_leval;
	}
}
