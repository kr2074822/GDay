package team.project.gday.gClass.model.service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.gday.gClass.model.dao.GClassDAO;

@Service
public class GClassServiceImpl {

	@Autowired
	private GClassDAO dao;
}
