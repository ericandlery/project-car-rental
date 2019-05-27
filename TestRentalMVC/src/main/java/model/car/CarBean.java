package model.car;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
@Entity
@Table(name="car")
@Component
public class CarBean {
	@Id
	private String car_num;
	private Integer model_id;
	private Date production_date;
	private Integer mileage;
	private String color;
	private Integer price_day;
	private String car_photo;
	private String branch_name;
	private String car_state;
	private Integer rate;
	private Integer rate_count;
	
	public String getCar_num() {
		return car_num;
	}
	public void setCar_num(String car_num) {
		this.car_num = car_num;
	}
	public Integer getModel_id() {
		return model_id;
	}
	public void setModel_id(Integer model_id) {
		this.model_id = model_id;
	}
	public Date getProduction_date() {
		return production_date;
	}
	public void setProduction_date(Date production_date) {
		this.production_date = production_date;
	}
	public Integer getMileage() {
		return mileage;
	}
	public void setMileage(Integer mileage) {
		this.mileage = mileage;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Integer getPrice_day() {
		return price_day;
	}
	public void setPrice_day(Integer price_day) {
		this.price_day = price_day;
	}
	public String getCar_photo() {
		return car_photo;
	}
	public void setCar_photo(String car_photo) {
		this.car_photo = car_photo;
	}	
	public String getBranch_name() {
		return branch_name;
	}
	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}
	public String getCar_state() {
		return car_state;
	}
	public void setCar_state(String car_state) {
		this.car_state = car_state;
	}
	public Integer getRate() {
		return rate;
	}
	public void setRate(Integer rate) {
		this.rate = rate;
	}
	public Integer getRate_count() {
		return rate_count;
	}
	public void setRate_count(Integer rate_count) {
		this.rate_count = rate_count;
	}
	@Override
	public String toString() {
		return "CarBean [car_num=" + car_num + ", model_id=" + model_id + ", production_date=" + production_date
				+ ", mileage=" + mileage + ", color=" + color + ", price_day=" + price_day + ", car_photo=" + car_photo
				+ ", branch_name=" + branch_name + ", car_state=" + car_state + ", rate=" + rate + ", rate_count="
				+ rate_count + "]";
	}

}
