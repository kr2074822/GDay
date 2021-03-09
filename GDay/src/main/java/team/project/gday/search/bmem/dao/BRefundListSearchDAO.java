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
public class BRefundListSearchDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 판매 회원 기본 날짜 선택 후 검색 시 주문 목록 페이징 처리 객체 생성 DAO
	public int getRfsPageInfo(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getRfsPageInfo", map);
	}

	// 판매 회원 기본 날짜 선택 후 검색 DAO
	public List<OrderList> bRfsList(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bRfsList", map, rowBounds);
	}
	
	
	// 판매 회원 기본 날짜 선택 안하고 검색 시 주문 목록 페이징 처리 객체 생성 DAO
	public int getRfsPageInfo2(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getRfsPageInfo2", map);
	}
	
	// 판매 회원 기본 날짜 선택 안하고 검색 DAO
	public List<OrderList> bRfsList2(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bRfsList2", map, rowBounds);
	}
	
	
	// 판매 회원 직접 날짜 선택 후 검색 시 주문 목록 페이징 처리 객체 생성 DAO
	public int getRfsPageInfo3(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getRfsPageInfo3", map);
	}

	// 판매 회원 직접 날짜 선택 후 검색 DAO
	public List<OrderList> bRfsList3(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bRfsList3", map, rowBounds);
	}
	
	
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성 DAO
	public int getRflPageInfo(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getRflPageInfo", map);
	}

	// 판매 회원 날짜 선택 후 주문 목록 조회 DAO
	public List<OrderList> bRfDaySearchList(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bRfDaySearchList", map, rowBounds);
	}

	
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성2 DAO
	public int getRflPageInfo2(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getRflPageInfo2", map);
	}

	// 판매 회원 날짜 선택 후 주문 목록 조회2 DAO
	public List<OrderList> bRfDaySearchList2(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bRfDaySearchList2", map, rowBounds);
	}

}
