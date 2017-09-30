package com.java96.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.java96.dto.Criteria;
import com.java96.dto.ReplyDTO;
import com.java96.mapper.ReplyMapper;
import com.java96.mapper.TodoMapper;

@Transactional
@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	ReplyMapper mapper;
	
	@Inject
	TodoMapper tMapper;
	
	@Override
	public void create(ReplyDTO dto) {
		mapper.create(dto);
		tMapper.updateReplyCnt(dto.getTno());
	}

	@Override
	public ReplyDTO get(Integer rno) {
		return mapper.read(rno);
	}

	@Override
	public void remove(Integer rno) {
		mapper.delete(rno);
	}

	@Override
	public void update(ReplyDTO dto) {
		mapper.update(dto);
	}

	@Override
	public List<ReplyDTO> list(Criteria cri) {
		return mapper.list(cri);
	}

}
