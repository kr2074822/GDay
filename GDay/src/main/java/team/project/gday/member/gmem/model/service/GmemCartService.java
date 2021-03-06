package team.project.gday.member.gmem.model.service;

import java.util.List;
import java.util.Map;

import team.project.gday.member.model.vo.Baguni;

public interface GmemCartService {

	
	/** 장바구니 조회 Service
	 * @param memberNo
	 * @return baguniList
	 */
	List<Baguni> selectBaguni(int memberNo);
	
	
	/** 클래스 장바구니에 추가 Service
	 * @param map
	 * @return result
	 */
	int insertClassCart(Map<String, Object> map);



}
