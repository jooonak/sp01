package com.java96.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ReplyDTO {

	private Integer rno;
	private String reply, replyer;
	private Date replydate;
	private Long tno;
}
