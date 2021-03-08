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
public class BCancelListSearchDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	// 판매 회원 기본 날짜 선택 후 검색 시 주문 목록 페이징 처리 객체 생성 DAO
	public int getOcsPageInfo(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getOcsPageInfo", map);
	}

	// 판매 회원 기본 날짜 선택 후 검색 DAO
	public List<OrderList> bOcsList(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bOcsList", map, rowBounds);
	}
	
	
	// 판매 회원 기본 날짜 선택 안하고 검색 시 주문 목록 페이징 처리 객체 생성 DAO
	public int getOcsPageInfo2(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getOcsPageInfo2", map);
	}
	
	// 판매 회원 기본 날짜 선택 안하고 검색 DAO
	public List<OrderList> bOcsList2(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bOcsList2", map, rowBounds);
	}
	
	
	// 판매 회원 직접 날짜 선택 후 검색 시 주문 목록 페이징 처리 객체 생성 DAO
	public int getOcsPageInfo3(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getOcsPageInfo3", map);
	}

	// 판매 회원 직접 날짜 선택 후 검색 DAO
	public List<OrderList> bOcsList3(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bOcsList3", map, rowBounds);
	}
	
	
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성 DAO
	public int getOclPageInfo(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getOclPageInfo", map);
	}

	// 판매 회원 날짜 선택 후 주문 목록 조회 DAO
	public List<OrderList> bOcDaySearchList(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bOcDaySearchList", map, rowBounds);
	}

	
	
	// 판매 회원 날짜 선택 후 주문 목록 페이징 처리 객체 생성2 DAO
	public int getOclPageInfo2(Map<String, Object> map) {
		return sqlSession.selectOne("bMemSearchMapper.getOclPageInfo2", map);
	}

	// 판매 회원 날짜 선택 후 주문 목록 조회2 DAO
	public List<OrderList> bOcDaySearchList2(PageInfo9 pInfo, Map<String, Object> map) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemSearchMapper.bOcDaySearchList2", map, rowBounds);
	}

}
