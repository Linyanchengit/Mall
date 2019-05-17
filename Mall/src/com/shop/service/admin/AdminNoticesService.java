package com.shop.service.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.shop.dao.AdminNoticesDao;
import com.shop.entity.Notice;



@Service("adminNoticesService")
@Transactional
public class AdminNoticesService implements IAdminNoticesService{
	@Autowired
	private AdminNoticesDao adminNoticesDao;

	@Override
	public String searchAllNotice(Model model) {
		// TODO Auto-generated method stub
		List<Notice> allNotices=adminNoticesDao.searchAllNotice();
		model.addAttribute("allNotices",allNotices);
		model.addAttribute("noticeSize",allNotices.size());
		return "admin/notice-list";
	}

	@Override
	public String deleteNoticeById(Integer n_id) {
		// TODO Auto-generated method stub
		adminNoticesDao.deleteNoticeById(n_id);
		return "admin/notice-list";
	}

	@Override
	public String updateNoticeById(Notice notice) {
		// TODO Auto-generated method stub
		adminNoticesDao.updateNoticeById(notice);
		return "admin/notice-list";
	}
	
	@Override
	public String addNotice(String title,String details) {
		// TODO Auto-generated method stub
		Notice notice=new Notice();
		notice.setTitle(title);
		notice.setDetails(details);
		adminNoticesDao.addNotice(notice);
		return "forward:/admin/notice-list";
	}
}
