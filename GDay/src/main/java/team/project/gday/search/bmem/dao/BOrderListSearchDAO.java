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
public class BOrderListSearchDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 판매 회원 기본 날짜 선택 후 검색 시 주문 목록 페이징 처리 객체 생성 DAO
	public int getOdsPageInfo(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getOdsPageInfo", map);
	}

	// 판매 회원 기본 날짜 선택 후 검색 DAO
	public List<OrderList> bOdsList(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bOdsList", map, rowBounds);
	}
	
	
	// 판매 회원 기본 날짜 선택 안하고 검색 시 주문 목록 페이징 처리 객체 생성 DAO
	public int getOdsPageInfo2(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getOdsPageInfo2", map);
	}
	
	// 판매 회원 기본 날짜 선택 안하고 검색 DAO
	public List<OrderList> bOdsList2(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bOdsList2", map, rowBounds);
	}
	
	
	// 판매 회원 직접 날짜 선택 후 검색 시 주문 목록 페이징 처리 객체 생성 DAO
	public int getOdsPageInfo3(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getOdsPageInfo3", map);
	}

	// 판매 회원 직접 날짜 선택 후 검색 DAO
	public List<OrderList> bOdsList3(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bOdsList3", map, rowBounds);
	}
	
	
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성 DAO
	public int getOdlListCount(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getOdlListCount", map);
	}

	// 판매 회원 날짜 선택 후 주문 목록 조회 DAO
	public List<OrderList> bOrdDaySearchList(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bOrdDaySearchList", map, rowBounds);
	}

	
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성2 DAO
	public int getOdlListCount2(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getOdlListCount2", map);
	}

	// 판매 회원 날짜 선택 후 주문 목록 조회2 DAO
	public List<OrderList> bOrdDaySearchList2(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bOrdDaySearchList2", map, rowBounds);
	}

}
