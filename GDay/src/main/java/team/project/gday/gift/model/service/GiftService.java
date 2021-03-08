package team.project.gday.gift.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GOption;
import team.project.gday.Product.model.vo.Gift;
import team.project.gday.Product.model.vo.ProductCTag;
import team.project.gday.member.model.vo.Member;

public interface GiftService {

	/** 선물 삽입
	 * @param map
	 * @param images
	 * @param savePath
	 * @return
	 */
	int insertGift(Map<String, Object> map, List<MultipartFile> images, String savePath);

	//썸머노트에 업로드된 이미지 저장 service
	Attachment insertImages(MultipartFile uploadFile, String savePath);

	/** 선물 상세 조회 
	 * @param prdtNo
	 * @return
	 */
	Gift selectGift(int prdtNo);

	/** 이미지 조회
	 * @param prdtNo
	 * @return
	 */
	List<Attachment> selectAttachmentList(int prdtNo);

	/** 판매자 정보 가져오기
	 * @param memNo
	 * @return
	 */
	Member selectMember(int memNo);

	/** 썸네일 가져오기
	 * @param prdtNo
	 * @return
	 */
	Attachment selectThumbnail(int prdtNo);

	/** 옵션번호 가져오기
	 * @param prdtNo
	 * @return
	 */
	List<GOption> selectGoption(int prdtNo);

	/** 해시태그 가져오기
	 * @param prdtNo
	 * @return
	 */
	List<ProductCTag> selectPrdtTagList(int prdtNo);

	/** 선물 수정
	 * @param map
	 * @param images
	 * @param savePath
	 * @return
	 */
	int updateGift(Map<String, Object> map, List<MultipartFile> images, String savePath);

}
