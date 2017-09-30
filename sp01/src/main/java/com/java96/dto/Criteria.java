package com.java96.dto;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class Criteria {

	private int page;
	private int total;
	
	public Criteria() {
		this(1);
	}

	public Criteria(int page) {
		if (page < 1) {
			page = 1;
		}
		
		this.page = page;
	}

	public void setPage(int page) {
		if (page < 1) {
			page = 1;
		}
		
		this.page = page;
	}
	
	public int getPage() {
		return page;
	}

	public int getSkip() {
		return (this.page - 1) * 10;
	}
	
	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getURI() {
		UriComponents uriCom = 
				UriComponentsBuilder.newInstance()
				.queryParam("page", "page").build();
		
		return uriCom.toString();
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", total=" + total + "]";
	}
	
}
