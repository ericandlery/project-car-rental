package model.model;

import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;


@Entity
@Table(name="MODEL")
@Component
public class ModelBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	private String name;
	private String brand;
	private Integer cc;
	private Double size_h;
	private Double size_w;
	private Double size_l;
	private Integer box_big;
	private Integer box_small;
	private Integer seat;
	private String description;
	private Integer category_id;
	private String photo;
	private String video;
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
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public Integer getCc() {
		return cc;
	}
	public void setCc(Integer cc) {
		this.cc = cc;
	}
	public Double getSize_h() {
		return size_h;
	}
	public void setSize_h(Double size_h) {
		this.size_h = size_h;
	}
	public Double getSize_w() {
		return size_w;
	}
	public void setSize_w(Double size_w) {
		this.size_w = size_w;
	}
	public Double getSize_l() {
		return size_l;
	}
	public void setSize_l(Double size_l) {
		this.size_l = size_l;
	}
	public Integer getBox_big() {
		return box_big;
	}
	public void setBox_big(Integer box_big) {
		this.box_big = box_big;
	}
	public Integer getBox_small() {
		return box_small;
	}
	public void setBox_small(Integer box_small) {
		this.box_small = box_small;
	}
	public Integer getSeat() {
		return seat;
	}
	public void setSeat(Integer seat) {
		this.seat = seat;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getCategory_id() {
		return category_id;
	}
	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getVideo() {
		return video;
	}
	public void setVideo(String video) {
		this.video = video;
	}
	@Override
	public String toString() {
		return "ModelBean [id=" + id + ", name=" + name + ", brand=" + brand + ", cc=" + cc + ", size_h=" + size_h
				+ ", size_w=" + size_w + ", size_l=" + size_l + ", box_big=" + box_big + ", box_small=" + box_small
				+ ", seat=" + seat + ", description=" + description + ", category_id=" + category_id + ", photo="
				+ photo + ", video=" + video + "]";
	}
	
	

}
