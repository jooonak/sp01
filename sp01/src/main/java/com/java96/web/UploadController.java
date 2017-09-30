package com.java96.web;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.apache.commons.io.FileUtils;
import org.imgscalr.Scalr;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java96.dto.FileDTO;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/upload/*")
@Log
public class UploadController {

	@GetMapping("/input")
	public void input() {

	}

	@PostMapping(value="/")
	public @ResponseBody Map<String, String> output(MultipartFile file) throws Exception {

		UUID uuid = UUID.randomUUID();

		String uploadName = uuid.toString() + "_" + file.getOriginalFilename();
		
		OutputStream out = new FileOutputStream("C:\\zupload\\" + uploadName);

		FileCopyUtils.copy(file.getInputStream(), out);

		BufferedImage origin = ImageIO.read(file.getInputStream());

		BufferedImage destImg = Scalr.resize(origin, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);

		String thumbName = "s_" + uploadName;

		ImageIO.write(destImg, "jpg", new FileOutputStream("C:\\zupload\\" + thumbName));

		Map<String, String> map = new HashMap<String, String>();
		
		map.put("original", file.getOriginalFilename());
		map.put("uploadName", uploadName);
		map.put("thumbName", thumbName);
		
		return map;
	}
	
	@GetMapping("/thumb/{thumbName:.+}")
	public @ResponseBody byte[] display(@PathVariable("thumbName") String thumbName) throws Exception {
		
		File file = new File("C:\\zupload\\" + thumbName);
		
		return FileUtils.readFileToByteArray(file);
	}
	
	@DeleteMapping("/del")
	public void delete(@RequestBody FileDTO dto) {
		
		log.info(""+dto);
		
		File file = new File("C:\\zupload\\"+dto.getOrigin());
		file.delete();
		
		File tfile = new File("C:\\zupload\\"+dto.getThumb());
		tfile.delete();
	}

}
