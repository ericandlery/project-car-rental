package model.pickup_order;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
@Component
@Entity
@Table(name="pickup_order")
public class Pickup_orderBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private Integer mem_id;
	private String car_num;
	private Integer driver_id;
	private String start_location;
	private String end_location;
	private Timestamp start_date;
	private Timestamp start_time;
	private Integer price;
	private String order_state;
	private Timestamp order_s_datetime;
	private Timestamp oder_e_datetime;
	private String payment;
	
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public Timestamp getOrder_s_datetime() {
		return order_s_datetime;
	}
	public void setOrder_s_datetime(Timestamp order_s_datetime) {
		this.order_s_datetime = order_s_datetime;
	}
	public Timestamp getOder_e_datetime() {
		return oder_e_datetime;
	}
	public void setOder_e_datetime(Timestamp oder_e_datetime) {
		this.oder_e_datetime = oder_e_datetime;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getMem_id() {
		return mem_id;
	}
	public void setMem_id(Integer mem_id) {
		this.mem_id = mem_id;
	}
	public String getCar_num() {
		return car_num;
	}
	public void setCar_num(String car_num) {
		this.car_num = car_num;
	}
	public Integer getDriver_id() {
		return driver_id;
	}
	public void setDriver_id(Integer driver_id) {
		this.driver_id = driver_id;
	}
	public String getStart_location() {
		return start_location;
	}
	public void setStart_location(String start_location) {
		this.start_location = start_location;
	}
	public String getEnd_location() {
		return end_location;
	}
	public void setEnd_location(String end_location) {
		this.end_location = end_location;
	}
	public Timestamp getStart_date() {
		return start_date;
	}
	public void setStart_date(Timestamp start_date) {
		this.start_date = start_date;
	}
	public Timestamp getStart_time() {
		return start_time;
	}
	public void setStart_time(Timestamp start_time) {
		this.start_time = start_time;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	@Override
	public String toString() {
		return "Pickup_orderBean [id=" + id + ", mem_id=" + mem_id + ", car_num=" + car_num + ", driver_id=" + driver_id
				+ ", start_location=" + start_location + ", end_location=" + end_location + ", start_date=" + start_date
				+ ", start_time=" + start_time + ", price=" + price + ", order_state=" + order_state
				+ ", order_s_datetime=" + order_s_datetime + ", oder_e_datetime=" + oder_e_datetime + ", payment="
				+ payment + "]";
	}

}
