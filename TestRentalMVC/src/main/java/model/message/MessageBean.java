package model.message;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
@Component
@Entity
@Table(name="message")
public class MessageBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String title;
	private int mem_id;
	private String message;
	private Date message_datetime;
	private String report;
	
	
	
	
	public String getReport() {
		return report;
	}
	public void setReport(String report) {
		this.report = report;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getMem_id() {
		return mem_id;
	}
	public void setMem_id(int mem_id) {
		this.mem_id = mem_id;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Date getMessage_datetime() {
		return message_datetime;
	}
	public void setMessage_datetime(Date message_datetime) {
		this.message_datetime = message_datetime;
	}
	@Override
	public String toString() {
		return "MessageBean [id=" + id + ", title=" + title + ", mem_id=" + mem_id + ", message=" + message
				+ ", message_datetime=" + message_datetime + "]";
	}
}
