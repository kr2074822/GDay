package team.project.gday.member.bmem.controller.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.Product.model.vo.Gift;
import team.project.gday.member.bmem.controller.model.PageInfo;

@Repository // 저장소 (DB) 연결 객체임을 알려줌 + bean 등록
public class BmemDAO {

	// 마이바티스를 이용한 DB 연결 객체를 의존성 주입
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 내 판매글 목록 조회 DAO
	public int getGiftListCount() {
		return sqlSession.selectOne("bMemMapper.getGiftListCount");
	}

	// 페이징 처리 객체 생성 DAO
	public List<Gift> bSellList(PageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("bMemMapper.bSellList", rowBounds);
	}

}
