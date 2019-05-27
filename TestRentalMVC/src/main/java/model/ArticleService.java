package model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

@Service
@Scope(value="prototype")
@Lazy(value=true)
public class ArticleService {
	@Autowired
	private ArticleDAO adao;
	
	public Boolean insertArticle(ArticleBean ab) {
		return adao.insert(ab);
	}
	public List<ArticleBean> showhotarticle() {
		return adao.selectBybrowse_count();
	}
	public ArticleBean showthisarticle(String title) {
		return adao.selectBytitle(title);
	}
	public List<ArticleBean> showmyarticle(int author) {
		return adao.selectByauthor(author);
	}
	public Boolean updatebrowse_count(ArticleBean ab) {
		return adao.update(ab);
	}
	public Boolean delete(String title) {
		return adao.delete(title);
	}
}
