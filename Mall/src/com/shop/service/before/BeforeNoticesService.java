package com.shop.service.before;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.shop.dao.BeforeNoticesDao;
import com.shop.dao.BeforeUserDao;
import com.shop.entity.Notice;
@Service("beforeNoticesService")
@Transactional
public class BeforeNoticesService implements IBeforeNoticesService {
	@Autowired
	private BeforeNoticesDao beforeNoticesDao;
	@Override
	public String searchAllNotices(Model model) {
		// TODO Auto-generated method stub
		List<Notice> allNotices=beforeNoticesDao.searchAllNotices();
		model.addAttribute("allNotices",allNotices );
		return "redirect:before/";
	}
}
