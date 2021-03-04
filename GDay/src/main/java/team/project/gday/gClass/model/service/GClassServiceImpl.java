package team.project.gday.gClass.model.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.gClass.model.dao.GClassDAO;
import team.project.gday.member.bmem.model.vo.PageInfo10;

@Service
public class GClassServiceImpl implements GClassService {

	@Autowired
	private GClassDAO dao;
	
	//페이징 처리 객체 Service 구현
	@Override
	public PageInfo10 getPageInfo(int cp) {
		//전체 클래스 수 조회
		int classCount = dao.getClassCount();
		return new PageInfo10(cp, classCount);
	}

	//클래스 목록 조회 Service 구현
	@Override
	public List<GClass> selectList(PageInfo10 pInfo) {
		return dao.selectList(pInfo);
	}

	//썸네일 목록 조회 Service 구현
	@Override
	public List<Attachment> selectThumbnailList(List<GClass> gCList) {
		return dao.selectThumbnailList(gCList);
	}

	@Override
	public GClass selectGClass(int prdtNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Attachment> selectAttachmentList(int prdtNo) {
		// TODO Auto-generated method stub
		return null;
	}
}
