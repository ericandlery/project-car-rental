package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.member.MemberBean;

@SessionAttributes(names= {"login_ok","pw"})
@WebFilter({"/forum/showhotArticle.controller","/forum/showmyArticle.controller",
	"/forum/newarticle.jsp","/forum/showfriend.controller",
	"/forum/addnewfriend.jsp","/forum/searchinvite.controller"
	,"/forum/showthisArticle.controller"})
public class logincheckin implements Filter {
	@Autowired
	private MemberBean mb;
	
	
    public logincheckin() {
        // TODO Auto-generated constructor stub
    }
	public void destroy() {
		// TODO Auto-generated method stub
	}
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req=(HttpServletRequest)request;
		System.out.println("=======================================");
		HttpServletResponse resp=(HttpServletResponse)response;
		HttpSession session=req.getSession();
		mb=(MemberBean)session.getAttribute("login_ok");
		if(mb!=null) {
		}else {
			resp.sendRedirect("/TestRentalMVC/member_function/login.jsp");
		}
		chain.doFilter(request, response);
	}
	public void init(FilterConfig fConfig) throws ServletException {
	}
}
