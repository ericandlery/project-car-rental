package model.customer_service;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="customer_service")
public class Customer_serviceBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String name;
	private String email;
	private String title;
	private String text;
	private String type;
	private Timestamp datetime;
	private String reply;
	private Timestamp re_time;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Timestamp getDatetime() {
		return datetime;
	}
	public void setDatetime(Timestamp datetime) {
		this.datetime = datetime;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public Timestamp getRe_time() {
		return re_time;
	}
	public void setRe_time(Timestamp re_time) {
		this.re_time = re_time;
	}
	@Override
	public String toString() {
		return "Customer_serviceBean [id=" + id + ", name=" + name + ", email=" + email + ", title=" + title + ", text="
				+ text + ", type=" + type + ", datetime=" + datetime + ", reply=" + reply + ", re_time=" + re_time
				+ "]";
	}
	
}
