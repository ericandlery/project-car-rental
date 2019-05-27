package listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class MyServletContextListener implements ServletContextListener {

	private ServletContext ctx;
	
	@Override
	public void contextInitialized(ServletContextEvent event) {
		ctx=event.getServletContext();

//		System.out.println("THE PATH:"+ctx.getRealPath("/"));
		
		/////////以下路徑請改成自己電腦的預設絕對路徑
		///////取得絕對路徑
		String member_license_folder=ctx.getRealPath("/resources/member_license_photo/");
		String Carfolder=ctx.getRealPath("/resources/car_model/");
		String CarVideofolder=ctx.getRealPath("/resources/car_model_video/");
		String Branchfolder=ctx.getRealPath("/resources/Branch_photo/");
		String Tourfolder=ctx.getRealPath("/resources/tour/");
		
		///////////會員駕照圖檔的路徑
		ctx.setAttribute("member_license_folder",member_license_folder);
        ///////////車子圖的路徑
		ctx.setAttribute("Carfolder",Carfolder);
		 ///////////車子影片的路徑
		ctx.setAttribute("CarVideofolder",CarVideofolder);
        ///////////據點圖的路徑
		ctx.setAttribute("Branchfolder",Branchfolder);
		///////////景點圖路徑
		ctx.setAttribute("tourFolder",Tourfolder);

	}
	
	@Override
	public void contextDestroyed(ServletContextEvent event) {

	}

}
