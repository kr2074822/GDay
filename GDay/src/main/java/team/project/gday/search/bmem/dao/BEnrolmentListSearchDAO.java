package team.project.gday.search.bmem.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.member.bmem.model.vo.OrderList;
import team.project.gday.member.bmem.model.vo.PageInfo9;

@Repository
public class BEnrolmentListSearchDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 판매 회원 기본 날짜 선택 후 검색 시 주문 목록 페이징 처리 객체 생성 DAO
	public int getEmsPageInfo(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getEmsPageInfo", map);
	}

	// 판매 회원 기본 날짜 선택 후 검색 DAO
	public List<OrderList> bEmsList(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bEmsList", map, rowBounds);
	}
	
	
	// 판매 회원 기본 날짜 선택 안하고 검색 시 주문 목록 페이징 처리 객체 생성 DAO
	public int getEmsPageInfo2(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getEmsPageInfo2", map);
	}
	
	// 판매 회원 기본 날짜 선택 안하고 검색 DAO
	public List<OrderList> bEmsList2(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bEmsList2", map, rowBounds);
	}
	
	
	// 판매 회원 직접 날짜 선택 후 검색 시 주문 목록 페이징 처리 객체 생성 DAO
	public int getEmsPageInfo3(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getEmsPageInfo3", map);
	}

	// 판매 회원 직접 날짜 선택 후 검색 DAO
	public List<OrderList> bEmsList3(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bEmsList3", map, rowBounds);
	}
	
	
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성 DAO
	public int getEmlPageInfo(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getEmlPageInfo", map);
	}

	// 판매 회원 날짜 선택 후 주문 목록 조회 DAO
	public List<OrderList> bEmDaySearchList(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bEmDaySearchList", map, rowBounds);
	}

	
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성2 DAO
	public int getEmlPageInfo2(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getEmlPageInfo2", map);
	}

	// 판매 회원 날짜 선택 후 주문 목록 조회2 DAO
	public List<OrderList> bEmDaySearchList2(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bEmDaySearchList2", map, rowBounds);
	}

}
