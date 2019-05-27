package controller.upload;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
@RequestMapping
public class UploadController {
	@Autowired
	private ServletContext ctx;
	
	@RequestMapping(path="/test/UploadPic.controller",method=RequestMethod.POST)
	public String UploadPic(Model model,@RequestParam("pic") CommonsMultipartFile pic) throws IOException, InterruptedException {
		
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
//		String date=sdf.format(new Date());
		
		String folder=(String)ctx.getAttribute("testFolder");
		
		File file=new File(folder+pic.getOriginalFilename());
		if(!file.exists()) {
			pic.transferTo(file);
			model.addAttribute("pic",pic.getOriginalFilename());
		}
		TimeUnit.SECONDS.sleep(5);
		return "test_upload";
	}

}
