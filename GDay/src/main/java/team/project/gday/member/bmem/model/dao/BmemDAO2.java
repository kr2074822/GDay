package team.project.gday.member.bmem.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.Product.model.vo.Attachment;

@Repository // 저장소 (DB) 연결 객체임을 알려줌 + bean 등록
public class BmemDAO2 {

	// 마이바티스를 이용한 DB 연결 객체를 의존성 주입
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**다음 상품번호 조회 DAO
	 * @return prdtNo
	 */
	public int selectNextNo() {
		return sqlSession.selectOne("classMapper.selectNextNo");
	}
	
	/** 상품 테이블에 삽입 DAO
	 * @param map
	 * @return result
	 */
	public int insertProduct(Map<String, Object> map) {
		System.out.println(map.get("prdtNo"));
		return sqlSession.insert("classMapper.insertProduct", map);
	}
	
	/** 클래스 테이블에 삽입 DAO
	 * @param map
	 * @return result
	 */
	public int insertClass(Map<String, Object> map) {
		return sqlSession.insert("classMapper.insertClass", map);
	}

	/**상품-태그 테이블에 삽입
	 * @param map
	 * @return
	 */
	public int insertTag(Map<String, Object> map) {
		return sqlSession.insert("classMapper.insertTag", map);
	}
	
	
	/**파일 정보 삽입 DAO
	 * @param uploadImages
	 * @return result(성공한 행의 개수)
	 */
	public int insertAttachmentList(List<Attachment> uploadImages) {
		return sqlSession.insert("classMapper.insertAttachmentList", uploadImages);
	}

	
}
