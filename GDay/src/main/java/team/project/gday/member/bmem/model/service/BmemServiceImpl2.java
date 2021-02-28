package team.project.gday.member.bmem.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.project.gday.member.bmem.model.dao.BmemDAO;
import team.project.gday.member.bmem.model.dao.BmemDAO2;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.product.model.vo.Attachment;
import team.project.gday.product.model.vo.GClass;
import team.project.gday.product.model.vo.Gift;

@Service
public class BmemServiceImpl2 implements BmemService2 {

	@Autowired
	private BmemDAO2 dao;


}
