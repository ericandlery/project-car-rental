package model.car_category;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
@Table(name = "car_category")
@Component
public class Car_categoryBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String name;
	private String license_leval;
	private String description;
	private String photo;
	
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
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
	public String getLicense_leval() {
		return license_leval;
	}
	public void setLicense_leval(String license_leval) {
		this.license_leval = license_leval;
	}
	@Override
	public String toString() {
		return "Car_categoryBean [id=" + id + ", name=" + name + ", license_leval=" + license_leval + ", description="
				+ description + ", photo=" + photo + "]";
	}
	

}
