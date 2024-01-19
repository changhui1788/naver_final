package upload;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UploadController {

	@GetMapping("/fileupload")
	String uploadform() {
		return "upload/uploadform";
	}

	@PostMapping("/fileupload")
	ModelAndView uploadresult(UploadDTO dto) {
		ModelAndView mv = new ModelAndView();

		String savePath = "c:/CODE/upload/";

		MultipartFile file1 = dto.getFile1();
		MultipartFile file2 = dto.getFile2();
		String filename1 = null;
		String newfilename1 = null;
		String filename2 = null;
		String newfilename2 = null;

		if (!file1.isEmpty()) {
			filename1 = file1.getOriginalFilename();
			String beforeext1 = filename1.substring(0, filename1.indexOf("."));
			String ext1 = filename1.substring(filename1.indexOf("."));
			newfilename1 = beforeext1 + "(" + UUID.randomUUID().toString() + ")" + ext1;
			filename1 = UUID.randomUUID().toString();
			try {
				File savefile1 = new File(savePath + newfilename1);
				file1.transferTo(savefile1);
				mv.addObject("saveresult1", beforeext1 + "파일을 " + newfilename1 + " 으로 저장 하였습니다.");
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (!file2.isEmpty()) {
			filename2 = file2.getOriginalFilename();
			String beforeext2 = filename2.substring(0, filename2.indexOf("."));
			String ext2 = filename2.substring(filename2.indexOf("."));
			newfilename2 = beforeext2 + "(" + UUID.randomUUID().toString() + ")" + ext2;
			filename2 = UUID.randomUUID().toString();
			try {
				File savefile2 = new File(savePath + newfilename2);
				file2.transferTo(savefile2);
				mv.addObject("saveresult2", beforeext2 + "파일을 " + newfilename2 + " 으로 저장 하였습니다.");
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		mv.setViewName("upload/uploadresult");

		return mv;
	}
}
