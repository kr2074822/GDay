package team.project.gday.member.gmem.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.project.gday.member.gmem.model.dao.GmemCartDAO;
import team.project.gday.member.model.vo.Baguni;

@Service
public class GmemCartServiceImpl implements GmemCartService{

	@Autowired
	private GmemCartDAO dao;
	
	// 장바구니 조회 Service 구현
	@Override
	public List<Baguni> selectBaguni(int memberNo) {
		return dao.selectBaguni(memberNo);
	}
	
	
	// 클래스 장바구니에 추가 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertClassCart(Map<String, Object> map) {			
		return dao.insertClassCart(map);
	}

}
