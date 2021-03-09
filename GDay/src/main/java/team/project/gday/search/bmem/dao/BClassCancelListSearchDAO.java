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
public class BClassCancelListSearchDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 판매 회원 기본 날짜 선택 후 검색 시 주문 목록 페이징 처리 객체 생성 DAO
	public int getCcsPageInfo(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getCcsPageInfo", map);
	}

	// 판매 회원 기본 날짜 선택 후 검색 DAO
	public List<OrderList> bCcsList(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bCcsList", map, rowBounds);
	}
	
	
	// 판매 회원 기본 날짜 선택 안하고 검색 시 주문 목록 페이징 처리 객체 생성 DAO
	public int getCcsPageInfo2(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getCcsPageInfo2", map);
	}
	
	// 판매 회원 기본 날짜 선택 안하고 검색 DAO
	public List<OrderList> bCcsList2(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bCcsList2", map, rowBounds);
	}
	
	
	// 판매 회원 직접 날짜 선택 후 검색 시 주문 목록 페이징 처리 객체 생성 DAO
	public int getCcsPageInfo3(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getCcsPageInfo3", map);
	}

	// 판매 회원 직접 날짜 선택 후 검색 DAO
	public List<OrderList> bCcsList3(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bCcsList3", map, rowBounds);
	}
	
	
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성 DAO
	public int getCclPageInfo(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getCclPageInfo", map);
	}

	// 판매 회원 날짜 선택 후 주문 목록 조회 DAO
	public List<OrderList> bCcDaySearchList(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bCcDaySearchList", map, rowBounds);
	}

	
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성2 DAO
	public int getCclPageInfo2(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getCclPageInfo2", map);
	}

	// 판매 회원 날짜 선택 후 주문 목록 조회2 DAO
	public List<OrderList> bCcDaySearchList2(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bCcDaySearchList", map, rowBounds);
	}

}
