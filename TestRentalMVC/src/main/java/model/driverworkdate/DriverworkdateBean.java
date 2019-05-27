//package model.driverworkdate;
//
//import java.sql.Timestamp;
//
//import javax.persistence.Entity;
//import javax.persistence.GeneratedValue;
//import javax.persistence.GenerationType;
//import javax.persistence.Id;
//import javax.persistence.Table;
//
//import org.springframework.stereotype.Component;
//
//@Component
//@Entity
//@Table(name="driverworkdate")
//public class DriverworkdateBean {
//	@Id
//	@GeneratedValue(strategy=GenerationType.IDENTITY)
//	private Integer id;
//	private Integer driver_id;
//	private Timestamp work_day;
//	private Timestamp work_time;
//	
//	public Integer getId() {
//		return id;
//	}
//	public void setId(Integer id) {
//		this.id = id;
//	}
//	public Integer getDriver_id() {
//		return driver_id;
//	}
//	public void setDriver_id(Integer driver_id) {
//		this.driver_id = driver_id;
//	}
//	public Timestamp getWork_day() {
//		return work_day;
//	}
//	public void setWork_day(Timestamp work_day) {
//		this.work_day = work_day;
//	}
//	public Timestamp getWork_time() {
//		return work_time;
//	}
//	public void setWork_time(Timestamp work_time) {
//		this.work_time = work_time;
//	}
//	@Override
//	public String toString() {
//		return "DriverworkdateBean [id=" + id + ", driver_id=" + driver_id + ", work_day=" + work_day + ", work_time="
//				+ work_time + "]";
//	}
//
//}
