package controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.sql.Blob;
import java.util.Base64;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.infinispan.commons.util.Base64.OutputStream;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import model.ArticleBean;
import model.ArticleService;
import model.PicDAO;
import model.PictureBean;
import model.member.MemberBean;
import model.member.MemberService;
import model.message.MessageBean;
import model.message.MessageService;
import net.sf.ehcache.hibernate.HibernateUtil;



@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 500 * 1024 * 1024, maxRequestSize = 5 * 500 * 1024 * 1024)
@Controller
@RequestMapping
@SessionAttributes(names= {"login_ok","pw"})
public class pictureController {
	@Autowired
	private PicDAO picdao;
	@Autowired
	private PictureBean pb;
	@Autowired
	private MemberBean mb;
	@Autowired
	private MemberService ms;
	@Autowired
	private ServletContext servletContext;
	private SessionFactory sf;
	////////存圖片在資料庫
//	@MultipartConfig(fileSizeThreshold=1024*1024, maxFileSize=5*1024*1024, maxRequestSize=5*5*1024*1024)
	@RequestMapping(path="/forum/addpicture.controller",method=RequestMethod.POST)
	public String addpicture(@RequestParam(value = "file", required = false) MultipartFile file,HttpServletRequest request,HttpServletResponse response,Model model) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		String picture_name = request.getParameter("picture_name");
		System.out.println("=="+picture_name);
//		Part part= request.getPart("picture");
		System.out.println(file);
		
		InputStream fin= file.getInputStream();
//		InputStream fin= part.getInputStream();
		byte[] pic=null;
		pic= new byte[(int)fin.available()];//to byte[]
		fin.read(pic);
		pb.setPicture_name(picture_name);
		pb.setPicture(pic);
		System.out.println("test="+pic);
		System.out.println("====");
		picdao.insert(pb);
		fin.close();
		
		
		model.addAttribute("picture_name", picture_name);
//		ServletOutputStream outs = response.getOutputStream(); 
//		outs.write(pb.getPicture());
//		outs.flush();
//		outs.close();
		
		
		
//////////////////////////////////////////////		
		
//		InputStream inputstream = null;
//		if(!file.isEmpty()) {
//			inputstream = file.getInputStream();
//		}
//		Session session=(Session) request.getSession();
//		Blob picture = Hibernate.getLobCreator(session).createBlob(inputstream, file.getSize());
//		Blob picture = sf.getCurrentSession().getLobHelper().createBlob(inputstream, file.getSize());

//		pb.setPicture_name(picture_name);
//		pb.setPicture(picture);
//		picdao.insert(pb);
//		inputstream.close();
		
		
		return "newarticle";
	}
	
	////////取在資料庫的圖片  picture test
	@RequestMapping(path="/controller/readpicture.controller",method=RequestMethod.GET)
	public void readpicture(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException, ServletException {
		String picture_name = request.getParameter("picture_name");
		if(picture_name!=""  && picture_name.length()>1) {
			System.out.println("有傳送圖片");
		System.out.println(""+picture_name);
//		String picture_name = "mem.png";
		pb = picdao.selectBypicture_name(picture_name);	
		System.out.println(pb.toString());
		model.addAttribute("pb",pb);
//		response.setContentType("Image/jpg");
//		response.getOutputStream().write(pb.getPicture());
//		response.getOutputStream().flush();
//		response.getOutputStream().close();
		response.setContentType("image/gif");
		ServletOutputStream out = response.getOutputStream();
		out.write(pb.getPicture());
		out.flush();
		out.close();
		
		
		}
		System.out.println("沒有傳送圖片");
		
		
		request.getRequestDispatcher("/TestRentalMVC/forum/newarticle.jsp").forward(request,response);
		
//		return "newarticle";
	}
	////////取在資料庫的圖片  member_update
//	@RequestMapping(path="/controller/readpicturemember_update.controller",method=RequestMethod.GET)
//	public String readpicturemember_update(HttpServletRequest request,HttpServletResponse response,Model model) throws IOException, ServletException {
//
//		response.setContentType("Image/jpg");
//		response.getOutputStream().write(mb.getMem_photo());
//		response.getOutputStream().flush();
//		response.getOutputStream().close();
//		return "member_update";
//	}
	
	/////////可以將圖片上傳至  images 資料夾內
	@RequestMapping(path="/forum/uploadavata.controller",method=RequestMethod.POST)
	public String upload(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, ModelMap model) {
		System.out.println("rrrr");
		if(file!=null) {
			String fileurl="";
			System.out.println("文件長度: " + file.getSize());
			System.out.println("文件類型: " + file.getContentType());
			System.out.println("文件名稱: " + file.getName());
			System.out.println("文件原名: " + file.getOriginalFilename());
			System.out.println("========================================");
			String realPath = request.getSession().getServletContext().getRealPath("/testtest");  
			System.out.println("realpath="+realPath);
			File targetFile = new File(realPath);
			if(!targetFile.exists()){
				targetFile.mkdirs();
				System.out.println("創建資料夾");
			}
			System.out.println("realpath = "+realPath);
			//改檔名
			int i = file.getOriginalFilename().lastIndexOf(".");// 返回最後一個點的位置
			String extension = file.getOriginalFilename().substring(i + 1);// 取出擴展名
			String filename =UUID.randomUUID().toString()+"."+extension;
			System.out.println("上傳檔案改名為 = "+ filename);
			
			model.addAttribute("filename", filename);
			fileurl=filename;
			try {
				file.transferTo( new File(realPath, filename));////!!!!寫入檔案
			}catch(IllegalStateException e){
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			System.out.println("上傳的file = null");
		}
		return "newarticle";
	}
	/////////可以將圖片上傳至  images 資料夾內AJAX
	@ResponseBody
	@RequestMapping(path= {"/forum/uploadavataAJAX.controller","/manager_zone/forum_manager/uploadavataAJAX.controller"},method=RequestMethod.POST)
	public void uploadAJAX(@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request, ModelMap model,HttpServletResponse response) throws IOException {
		if(file!=null) {
			String fileurl="";
			System.out.println("文件長度: " + file.getSize());
			System.out.println("文件類型: " + file.getContentType());
			System.out.println("文件名稱: " + file.getName());
			System.out.println("文件原名: " + file.getOriginalFilename());
			System.out.println("========================================");
			String realPath = request.getSession().getServletContext().getRealPath("/testtest");  
			System.out.println("realpath="+realPath);
			File targetFile = new File(realPath);
			if(!targetFile.exists()){
				targetFile.mkdirs();
				System.out.println("創建資料夾");
			}
			System.out.println("realpath = "+realPath);
			//改檔名
			int i = file.getOriginalFilename().lastIndexOf(".");// 返回最後一個點的位置
			String extension = file.getOriginalFilename().substring(i + 1);// 取出擴展名
			String filename =UUID.randomUUID().toString()+"."+extension;
			System.out.println("上傳檔案改名為 = "+ filename);
			
			try {
				file.transferTo( new File(realPath, filename));////!!!!寫入檔案
			}catch(IllegalStateException e){
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			response.getWriter().print(filename);
			response.getWriter().close();
		}else {
			System.out.println("上傳的file = null");
		}
		return ;
	}

}
