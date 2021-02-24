package team.project.gday.magazine.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.gday.magazine.model.dao.MagazineDAO;

@Service 
public class MagazineServiceImpl implements MagazineService{
	
	@Autowired
	private MagazineDAO dao;
	
}
