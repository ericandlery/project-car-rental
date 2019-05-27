package model.equip;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="equip")
public class EquipBean {
	@Id
	private int id;
	private String name;
	private double price;
	private String decript;
    private int stock;
    private int total;
    private int broken;
    private int rate;
	private int count;
	
	@Override
	public String toString() {
		return "EquipBean [id=" + id + ", name=" + name + ", price=" + price + ", decript=" + decript + ", stock="
				+ stock + ", total=" + total + ", broken=" + broken + ", rate=" + rate + ", count=" + count + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDecript() {
		return decript;
	}
	public void setDecript(String decript) {
		this.decript = decript;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getBroken() {
		return broken;
	}
	public void setBroken(int broken) {
		this.broken = broken;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
}
