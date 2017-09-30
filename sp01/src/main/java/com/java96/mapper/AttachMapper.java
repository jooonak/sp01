package com.java96.mapper;

import org.apache.ibatis.annotations.Insert;

public interface AttachMapper {

	@Insert("insert into tbl_attach (fname, tno) values(#{fname}, last_insert_id())")
	public void insert(String fname);
}
