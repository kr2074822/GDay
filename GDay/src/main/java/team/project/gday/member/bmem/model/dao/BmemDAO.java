package team.project.gday.member.bmem.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.Gift;
import team.project.gday.member.bmem.model.vo.OrderList;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.member.model.vo.Member;

@Repository // 저장소 (DB) 연결 객체임을 알려줌 + bean 등록
public class BmemDAO {

	// 마이바티스를 이용한 DB 연결 객체를 의존성 주입
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 내 판매글 목록 개수 조회 DAO
	public int getGiftListCount(Member loginMember) {
		return sqlSession.selectOne("bMemMapper.getGiftListCount", loginMember);
	}

	// 내 판매글 페이징 처리 객체 생성 DAO
	public List<Gift> bSellList(PageInfo9 pInfo, Member loginMember) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());

		return sqlSession.selectList("bMemMapper.bSellList", loginMember, rowBounds);
	}

	// 내 판매글 썸네일 목록 조회 DAO
	public List<Attachment> bSellThumbnailList(List<Gift> gList) {
		return sqlSession.selectList("bMemMapper.bSellThumbnailList", gList);
	}

	
	
	// 내 클래스 목록  개수 조회 DAO
	public int getClassPageInfo(Member loginMember) {
		return sqlSession.selectOne("bMemMapper.getClassListCount", loginMember);
	}

	// 내 클래스 목록 페이징 처리 객체 생성 DAO
	public List<GClass> bClassList(PageInfo9 pInfo, Member loginMember) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());

		return sqlSession.selectList("bMemMapper.bClassList", loginMember, rowBounds);
	}

	// 판매 회원 클래스 썸네일 목록 조회 DAO
	public List<Attachment> bClassThumbnailList(List<GClass> cList) {
		return sqlSession.selectList("bMemMapper.bClassThumbnailList", cList);
	}

	
	
	// 판매 회원 선물 주문 목록 개수 조회 DAO
	public int getOrdListCount(Member loginMember) {
		return sqlSession.selectOne("bMemMapper.getOrdListCount", loginMember);
	}

	// 판매 회원 선물 주문 목록 페이징 처리 객체 생성  DAO
	public List<OrderList> bOrderList(PageInfo9 pInfo, Member loginMember) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, 10);

		return sqlSession.selectList("bMemMapper.bOrderList", loginMember, rowBounds);
	}

	
	

}