package com.java96.web;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.java96.dto.Criteria;
import com.java96.dto.TodoDTO;
import com.java96.mapper.TodoMapper;

import lombok.extern.java.Log;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(
		locations= {"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
@Log
public class TodoTests {

	@Inject
	private TodoMapper mapper;
	
	@Test
	public void test() {
		
		log.info(""+mapper.findById(10L));
		
	}
	
	@Test
	public void test2() {
		
		TodoDTO dto = new TodoDTO();
		dto.setTitle("Hey"+System.currentTimeMillis());
		dto.setWriter("Hi");
		
		mapper.insert(dto);
		
	}
	
	@Test
	public void test3() {
		
//		log.info(""+new ArrayList<TodoDTO>(mapper.listPage(1)));

		List<TodoDTO> list = mapper.listPage(new Criteria(2));
		
		list.forEach(dto -> log.info(""+dto));
	}
	
}
