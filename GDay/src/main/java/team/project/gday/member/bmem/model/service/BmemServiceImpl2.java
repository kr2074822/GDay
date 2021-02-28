package team.project.gday.member.bmem.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.gday.member.bmem.model.dao.BmemDAO2;

@Service
public class BmemServiceImpl2 implements BmemService2 {

	@Autowired
	private BmemDAO2 dao;


}
