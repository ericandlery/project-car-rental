package test;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table
public class Model {
	@Id
	private Integer model_id;
	private String name;
	@OneToMany(mappedBy="model")
	private List<Carcar> carcars=new ArrayList<>();
	
	public List<Carcar> getCarcars() {
		return carcars;
	}
	public void setCarcars(List<Carcar> carcars) {
		this.carcars = carcars;
	}
	public Integer getModel_id() {
		return model_id;
	}
	public void setModel_id(Integer model_id) {
		this.model_id = model_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

}
