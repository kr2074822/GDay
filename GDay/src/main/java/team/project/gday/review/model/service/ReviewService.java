package team.project.gday.review.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import team.project.gday.Product.model.vo.GClass;
import team.project.gday.Product.model.vo.GOption;
import team.project.gday.Product.model.vo.Order;
import team.project.gday.member.bmem.model.vo.PageInfo10;
import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.review.model.vo.Review;

public interface ReviewService {

	/** 후기 등록
	 * @param review
	 * @param rvImg
	 * @param savePath
	 * @return result
	 */
	int insertReview(Review review, List<MultipartFile> rvImg, String savePath);

	/** 후기 pInfo 구하기
	 * @param map
	 * @return
	 */
	PageInfo9 getPageInfo(Map<String, Object> map);

	/**마이페이지 후기 조회하기
	 * @param map 
	 * @param pInfo 
	 * @return
	 */
	List<Review> selectReviewList(PageInfo9 pInfo, Map<String, Object> map);

	/**마이페이지 후기에 맞는 주문 내역 조회하기
	 * @param rList
	 * @return
	 */
	List<Order> selectOList(List<Review> rList);

	/**마이페이지 후기에 맞는 oList 가져오기
	 * @param oList
	 * @return
	 */
	List<GOption> selectOptList(List<Review> rList);

	/**마이페이지 후기에 맞는 클래스 리스트 조회
	 * @param rList
	 * @return
	 */
	List<GClass> selectCList(List<Review> rList);

	/**후기 삭제
	 * @param rvNo
	 * @return
	 */
	int deleteReview(int rvNo);

	/**상세 페이지 후기 조회용 pInfo
	 * @param map
	 * @return
	 */
	PageInfo10 getPageInfo5(Map<String, Object> map);

	/** 상세 페이지 후기 조회
	 * @param pInfo
	 * @param map
	 * @return
	 */
	List<Review> selectReviewView(PageInfo10 pInfo, Map<String, Object> map);

	/** 제품별 평균 가져오기
	 * @param prdtNo
	 * @return
	 */
	int getStarAvg(int prdtNo);

}
