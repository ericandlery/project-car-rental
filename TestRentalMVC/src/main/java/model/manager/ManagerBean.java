package model.manager;

import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="manager")
public class ManagerBean {
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	@Id
	private String name;
	private byte[] password;
	private String branch_name;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public byte[] getPassword() {
		return password;
	}
	public void setPassword(byte[] password) {
		this.password = password;
	}
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	@Override
	public String toString() {
		return "ManagerBean [id=" + id + ", name=" + name + ", password=" + Arrays.toString(password) + ", branch_name="
				+ branch_name + "]";
	}
	

}
