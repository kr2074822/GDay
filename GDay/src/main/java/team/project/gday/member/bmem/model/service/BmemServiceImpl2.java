package team.project.gday.member.bmem.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import team.project.gday.common.model.exception.UserDefineException;
import team.project.gday.member.bmem.model.dao.BmemDAO2;

@Service
public class BmemServiceImpl2 implements BmemService2 {

	@Autowired
	private BmemDAO2 dao;

	//클래스 등록 신청 Controller
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertClass(Map<String, Object> map, List<MultipartFile> images, String savePath) {
		int result = 0;
		//다음 상품번호 조회
		int prdtNo = dao.selectNextNo();
		
		if(prdtNo>0) {
			map.put("prdtNo", prdtNo);
						
			//제품 테이블에 삽입
			result = dao.insertProduct(map);
			
			if(result>0) {
				//클래스 테이블에 삽입
				result = dao.insertClass(map);
				
				if(result>0) {
					//해시태그 테이블에 삽입
					result = dao.insertTag(map);
				} else {
					throw new UserDefineException("해시태그 입력에 실패하여 페이지 이동합니다.");
				}
				
			} else {
				throw new UserDefineException("클래스 삽입에 실패하여 페이지 이동합니다.");
			} 
		} else {
			throw new UserDefineException("상품번호 조회에 실패하여 페이지 이동합니다.");
		}
		
		System.out.println(result);

		return result;
		
	}


}
