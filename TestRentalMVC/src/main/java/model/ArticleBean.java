package model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;
@Entity
@Table(name="article")
@Component
public class ArticleBean {
	@Id
	private String title;
	private int author;
	private String content;
	private Date article_datetime;
	private String photo;
	private int browse_count;
	public int getAuthor() {
		return author;
	}
	public void setAuthor(int author) {
		this.author = author;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getArticle_datetime() {
		return article_datetime;
	}
	public void setArticle_datetime(Date article_datetime) {
		this.article_datetime = article_datetime;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getBrowse_count() {
		return browse_count;
	}
	public void setBrowse_count(int browse_count) {
		this.browse_count = browse_count;
	}
	@Override
	public String toString() {
		return "ArticleBean [author=" + author + ", title=" + title + ", content=" + content + ", article_datetime="
				+ article_datetime + ", photo=" + photo + ", browse_count=" + browse_count + "]";
	}
	
}
