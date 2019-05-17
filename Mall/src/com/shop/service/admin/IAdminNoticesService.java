package com.shop.service.admin;

import java.util.List;

import org.springframework.ui.Model;

import com.shop.entity.Notice;

public interface IAdminNoticesService {
	public String searchAllNotice(Model model);
	public String deleteNoticeById(Integer n_id);
	public String updateNoticeById(Notice notice);
	public String addNotice(String title,String details);
}
