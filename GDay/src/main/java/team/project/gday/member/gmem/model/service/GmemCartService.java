package team.project.gday.member.gmem.model.service;

import java.util.Map;

public interface GmemCartService {

	/** 클래스 장바구니에 추가 Service
	 * @param map
	 * @return
	 */
	int insertClassCart(Map<String, Object> map);

}
