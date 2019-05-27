package model.rental_order;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="rental_order")
public class Rental_orderBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private Integer memid;
	private String car_num;
	private String start_branch_name;
	private String end_branch_name;
	private Date start_date;
	private Date end_date;
	private String remark;
	private Integer price;
	private Date order_date;
	private String order_state;
	private String code;
	private Integer trip_id;
	private String payment;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getMemid() {
		return memid;
	}
	public void setMemid(Integer memid) {
		this.memid = memid;
	}
	
	public String getCar_num() {
		return car_num;
	}
	public void setCar_num(String car_num) {
		this.car_num = car_num;
	}
	
	public String getStart_branch_name() {
		return start_branch_name;
	}
	public void setStart_branch_name(String start_branch_name) {
		this.start_branch_name = start_branch_name;
	}
	public String getEnd_branch_name() {
		return end_branch_name;
	}
	public void setEnd_branch_name(String end_branch_name) {
		this.end_branch_name = end_branch_name;
	}
	public Date getStart_date() {
		return start_date;
	}
	public void setStart_date(Date start_date) {
		this.start_date = start_date;
	}
	public Date getEnd_date() {
		return end_date;
	}
	public void setEnd_date(Date end_date) {
		this.end_date = end_date;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public Integer getTrip_id() {
		return trip_id;
	}
	public void setTrip_id(Integer trip_id) {
		this.trip_id = trip_id;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	@Override
	public String toString() {
		return "Rental_orderBean [id=" + id + ", memid=" + memid + ", car_num=" + car_num + ", start_branch_name="
				+ start_branch_name + ", end_branch_name=" + end_branch_name + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", remark=" + remark + ", price=" + price + ", order_date=" + order_date
				+ ", order_state=" + order_state + ", code=" + code + ", trip_id=" + trip_id + ", payment=" + payment
				+ "]";
	}
	
	
}
