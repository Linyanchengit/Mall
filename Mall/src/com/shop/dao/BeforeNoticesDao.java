package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.shop.entity.Notice;

@Repository("beforeNoticesDao")
@Mapper
public interface BeforeNoticesDao {
	public List<Notice> searchAllNotices();
}
