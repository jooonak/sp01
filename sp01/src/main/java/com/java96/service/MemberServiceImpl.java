package com.java96.service;

import org.springframework.stereotype.Service;

import com.java96.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Override
	public MemberDTO login(String uid) {
		MemberDTO dto = new MemberDTO();
		dto.setUid(uid);
		dto.setUpw(uid);
		dto.setUname("사용자"+uid);
		return dto;
	}

}
