package model.friendlist;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Component
@Entity
@Table(name="friendlist")
public class FriendlistBean{
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
    private int mem_id_myself;
	private int mem_id_friend;
	private String relationship;
	private String lookcheck;
	
	
	
	
	public String getLookcheck() {
		return lookcheck;
	}
	public void setLookcheck(String lookcheck) {
		this.lookcheck = lookcheck;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMem_id_myself() {
		return mem_id_myself;
	}
	public void setMem_id_myself(int mem_id_myself) {
		this.mem_id_myself = mem_id_myself;
	}
	public int getMem_id_friend() {
		return mem_id_friend;
	}
	public void setMem_id_friend(int mem_id_friend) {
		this.mem_id_friend = mem_id_friend;
	}
	public String getRelationship() {
		return relationship;
	}
	public void setRelationship(String relationship) {
		this.relationship = relationship;
	}
	@Override
	public String toString() {
		return "FriendlistBean [id=" + id + ", mem_id_myself=" + mem_id_myself + ", mem_id_friend=" + mem_id_friend
				+ ", relationship=" + relationship + ", lookcheck=" + lookcheck + "]";
	}


}
