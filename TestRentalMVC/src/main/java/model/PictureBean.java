package model;

import java.io.FileInputStream;
import java.sql.Blob;
import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="picture")
@Component
public class PictureBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String picture_name;
	private byte[] picture;
	private String lookcheck;
	public String getLookcheck() {
		return lookcheck;
	}
	public void setLookcheck(String lookcheck) {
		this.lookcheck = lookcheck;
	}
	public byte[] getPicture() {
		return picture;
	}
	public void setPicture(byte[] picture) {
		this.picture = picture;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPicture_name() {
		return picture_name;
	}
	public void setPicture_name(String picture_name) {
		this.picture_name = picture_name;
	}
	@Override
	public String toString() {
		return "PictureBean [id=" + id + ", picture_name=" + picture_name + ", picture=" + picture + "]";
	}



	
}
