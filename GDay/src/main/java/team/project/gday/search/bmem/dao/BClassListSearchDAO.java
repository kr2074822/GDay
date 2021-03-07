package team.project.gday.search.bmem.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.Gift;
import team.project.gday.member.bmem.model.vo.PageInfo9;

@Repository
public class BClassListSearchDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 판매 회원 날짜 선택 후 판매 상품 목록 페이징 처리 객체 생성 DAO
	public int getClassListCount(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getClassListCount", map);
	}

	// 판매 회원 날짜 선택 후 판매 상품 목록 조회 DAO
	public List<GClass> bClassDaySearchList(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 9);

		return sqlSession.selectList("bMemSearchMapper.bClassDaySearchList", map, rowBounds);
	}

	// 판매 회원 날짜 선택 후 판매 상품 썸네일 목록 조회 DAO
	public List<Attachment> bClassSearchThumbnailList(List<GClass> cList) {
		return sqlSession.selectList("bMemSearchMapper.bClassSearchThumbnailList", cList);
	}
	
	
	
	
	// 판매 회원 날짜 선택 후 판매 상품 목록 페이징 처리 객체 생성2 DAO
	public int getClassListCount2(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getClassListCount2", map);
	}

	// 판매 회원 날짜 선택 후 판매 상품 목록 조회2 DAO
	public List<GClass> bClassDaySearchList2(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 9);

		return sqlSession.selectList("bMemSearchMapper.bClassDaySearchList2", map, rowBounds);
	}



}
