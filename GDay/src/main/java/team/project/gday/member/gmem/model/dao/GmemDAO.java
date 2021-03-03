package team.project.gday.member.gmem.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sun.xml.internal.ws.api.message.Attachment;

import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.GOption;
import team.project.gday.Product.model.vo.Order;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.review.model.vo.Review;

/**
 * @author Younghyun
 *
 */
@Repository
public class GmemDAO {
	// 마이바티스를 이용한 DB 연결 객체를 의존성 주입
	@Autowired
	private SqlSessionTemplate sqlSession;

	/** 주문용 listCount dao
	 * @param map
	 * @return
	 */
	public int orderListCount(Map<String, Object> map) {
		return sqlSession.selectOne("gMemMapper.orderListCount", map);
	}

	/** 주문 목록 조회 dao
	 * @param pInfo
	 * @param map
	 * @return
	 */
	public List<Order> selectOrderList(PageInfo9 pInfo, Map<String, Object> map) {
		
		int offset = (pInfo.getCurrentPage()-1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("gMemMapper.selectOrderList", map, rowBounds);
	}

	/** 주문 목록 썸네일 조회 dao
	 * @param oList
	 * @return
	 */
	public List<Attachment> selectThumbnails(List<Order> oList) {
		return sqlSession.selectList("gMemMapper.selectThumbnails", oList);
	}

	/** 선물 주문 목록 옵션 조회 dao
	 * @param oList
	 * @return optList
	 */
	public List<GOption> selectOptList(List<Order> oList) {
		return sqlSession.selectList("gMemMapper.selectOptList", oList);
	}

	/** 클래스 주문 목록 상세 정보 dao
	 * @param oList
	 * @return cList
	 */
	public List<GClass> selectCList(List<Order> oList) {
		return sqlSession.selectList("gMemMapper.selectCList", oList);
	}
	

	/** 주문내역 확인용 후기 체크
	 * @param oList
	 * @return
	 */
	public List<Review> selectRCheck(List<Order> oList) {
		return sqlSession.selectList("gMemMapper.selectRCheck", oList);
	}


	//---------------------------------주문 목록 끝 --------------------------------------------
	
	/**주문 상세 조회(주문 번호에 들어간 모든 주문 상품 번호 가져오기)
	 * @param orderNo
	 * @param type
	 * @return
	 */
	public List<Order> selectOrders(Map<String, Object> map) {
		return sqlSession.selectList("gMemMapper.selectOrders", map);
	}

	
	/** 주문 구매 확정 처리(선물)
	 * @param opNo
	 * @return
	 */
	public int confirmOrder(int opNo) {
		return sqlSession.update("gMemMapper.confirmOrder", opNo);
	}


}



















