package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;



@WebFilter(
		urlPatterns="/*",
		initParams= {
				@WebInitParam(name="sessionFactoryBeanName",value="sessionFactory"),
		}
		)
public class OpenSessionInViewFilter implements Filter {

	private SessionFactory sf;
//	private ServletContext ctx;

    public OpenSessionInViewFilter() {
    }
    
	public void init(FilterConfig fConfig) throws ServletException {
		String sessionFactoryBeanName=fConfig.getInitParameter("sessionFactoryBeanName");
		ServletContext application=fConfig.getServletContext();
		WebApplicationContext context=WebApplicationContextUtils.getWebApplicationContext(application);
		sf=(SessionFactory)context.getBean(sessionFactoryBeanName);
		
//		ctx=fConfig.getServletContext();
//		ctx.setAttribute("fine",123);
		
	}
	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		try {
			sf.getCurrentSession().beginTransaction();
			chain.doFilter(request,response);
			sf.getCurrentSession().getTransaction().commit();
		}catch(Exception e) {
			sf.getCurrentSession().getTransaction().rollback();
			e.printStackTrace();
			chain.doFilter(request,response);
		}
	}

	public void destroy() {
	}
}
