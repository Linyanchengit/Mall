package com.shop.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.shop.entity.Notice;

@Repository("adminNoticesDao")
@Mapper
public interface AdminNoticesDao {
	public List<Notice> searchAllNotice();
	public boolean deleteNoticeById(Integer n_id);
	public boolean updateNoticeById(Notice notice);
	public boolean addNotice(Notice notice);
}
