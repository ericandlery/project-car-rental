package model.branch;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
@Entity
@Table(name="branch")
@Component
public class BranchBean {
	@Id
	private String name;
	private String address;
	private String tele;
	private String photo;
	private Integer map;
	private String location;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTele() {
		return tele;
	}
	public void setTele(String tele) {
		this.tele = tele;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public Integer getMap() {
		return map;
	}
	public void setMap(Integer map) {
		this.map = map;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	@Override
	public String toString() {
		return "BranchBean [name=" + name + ", address=" + address + ", tele=" + tele + ", photo=" + photo + ", map="
				+ map + ", location=" + location + "]";
	}
	
	
	




	

}
