package upload;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletResponse;

@Controller
public class DownloadController {

	@GetMapping("/filedownloadlist")
	ModelAndView downloadList() {
		ModelAndView mv = new ModelAndView();
		
		File f = new File("C:/CODE/upload/");
		String[] filearray = f.list();
		
		mv.addObject("filearray", filearray);
		mv.setViewName("upload/download");
		
		return mv;
	}
	
	@GetMapping("/filedownloadresult")
	void downloadResult(String filename, HttpServletResponse response) {
		
		response.setContentType("application/download");
		response.setHeader("Content-Disposition", "attachment;filename=\"" + filename + "\"");
		File f = new File("C:/CODE/upload/" + filename);
		response.setContentLength((int) f.length());
		
		OutputStream out = null;
		FileInputStream fi = null;
		try {
			out = response.getOutputStream();
			fi = new FileInputStream(f);
			
			FileCopyUtils.copy(fi, out);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(fi != null) fi.close();
				if(out != null) out.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
