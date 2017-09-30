package com.java96.web;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.java96.dto.Criteria;
import com.java96.dto.ReplyDTO;
import com.java96.service.ReplyService;

import lombok.extern.java.Log;

@RestController
@RequestMapping("/reply2/*")
@Log
public class Reply2Controller {

	@Inject
	ReplyService service;
	
	@PostMapping("/new")
	public ResponseEntity<String> create(@RequestBody ReplyDTO dto) {
		log.info(""+dto);
		service.create(dto);
		return new ResponseEntity<String>("Success",HttpStatus.OK);
	}
	
	@GetMapping("/list/{page}")
	public List<ReplyDTO> list(@PathVariable("page") int page) {
		
		return service.list(new Criteria(page));
	}
	
	@GetMapping("/{rno}")
	public ReplyDTO read(@PathVariable("rno") Integer rno) {
		return service.get(rno);
	}
	
	@DeleteMapping("/{rno}")
	public ResponseEntity<String> remove(@PathVariable("rno") Integer rno) {
		service.remove(rno);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	@PutMapping("/{rno}")
	public ResponseEntity<String> update(@PathVariable("rno") Integer rno, @RequestBody ReplyDTO dto){
		dto.setRno(rno);
		log.info(""+dto);
		service.update(dto);
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
}
