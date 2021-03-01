package team.project.gday.gift.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.gday.gift.model.dao.GiftDAO;

@Service 
public class GiftServiceImpl implements GiftService{

	@Autowired
	private GiftDAO dao;
}
