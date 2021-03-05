package team.project.gday.gClass.model.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.gClass.model.dao.GClassDAO;
import team.project.gday.member.bmem.model.vo.PageInfo10;
import team.project.gday.member.model.vo.Member;

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

	//클래스 상세 조회 Service 구현
	@Transactional(rollbackFor=Exception.class)
	@Override
	public GClass selectGClass(int prdtNo) {
		//1) 클래스 상세 조회
		GClass temp = new GClass();
		temp.setPrdtNo(prdtNo);
		GClass gClass = dao.selectGClass(temp);
		
		//3) 상세 조회 성공시 조회수 증가
		if(gClass != null) {
			int result = dao.increaseReadCount(prdtNo);
			
			if(result>0) {
				gClass.setReadCount(gClass.getReadCount() +1);;
			}
		}
		return gClass;
	}
	
	//클래스 상세 페이지에 포함된 이미지 목록 조회 Service 구현
	@Override
	public List<Attachment> selectAttachmentList(int prdtNo) {
		return dao.selectAttachmentList(prdtNo);
	}
	
	//클래스 상세 페이지의 판매자 정보 가져오기 Service 구현
	@Override
	public Member selectMember(int memNo) {
		return dao.selectMember(memNo);
	}

	//클래스 상세 페이지에 포함된 썸네일 조회 Service 구현
	@Override
	public Attachment selectThumbnail(int prdtNo) {
		return dao.selectThumbnail(prdtNo);
	}
}
