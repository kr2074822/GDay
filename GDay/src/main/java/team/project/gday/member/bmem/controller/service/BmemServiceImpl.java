package team.project.gday.member.bmem.controller.service;

import java.util.List;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.Gift;
import team.project.gday.member.bmem.controller.dao.BmemDAO;
import team.project.gday.member.bmem.controller.model.PageInfo;

public class BmemServiceImpl implements BmemService {

	private BmemDAO dao;
	
	// 페이징 처리 객체 생성 Service 구현
	@Override
	public PageInfo getPageInfo(int cp) {
		
		int giftListCount = dao.getGiftListCount();
		
		return null;
	}

	
	// 내 판매글 목록 조회 Service 구현
	@Override
	public List<Gift> bSellList(PageInfo pInfo) {
		return null;
	}

	
	// 내 판매글 썸네일 목록 조회 Service 구현
	@Override
	public List<Attachment> bSellThumbnailList(List<Gift> gList) {
		return null;
	}

}
