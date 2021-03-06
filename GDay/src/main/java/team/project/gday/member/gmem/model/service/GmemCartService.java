package team.project.gday.member.gmem.model.service;

import java.util.List;
import java.util.Map;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.member.model.vo.Baguni;

public interface GmemCartService {

	
	/** 장바구니 조회 Service
	 * @param memberNo
	 * @return baguniList
	 */
	List<Baguni> selectBaguni(int memberNo);
	
	/** 장바구니 썸네일 조회 Service
	 * @param baguniList
	 * @return
	 */
	List<Attachment> cartThumbnailList(List<Baguni> baguniList);	
	
	
	
	/** 클래스 장바구니에 추가 Service
	 * @param map
	 * @return result
	 */
	int insertClassCart(Map<String, Object> map);

	
	
	/** 장바구니에서 상품 삭제 Service
	 * @param map
	 * @return
	 */
	int deleteCart(Map<String, Object> map);
	







}
