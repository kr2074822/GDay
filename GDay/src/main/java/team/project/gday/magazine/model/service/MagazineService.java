package team.project.gday.magazine.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.Product.model.vo.GClass;
import team.project.gday.magazine.model.vo.Magazine;
import team.project.gday.magazine.model.vo.MagazineImg;
import team.project.gday.magazine.model.vo.MagazinePageInfo;

public interface MagazineService {

	MagazinePageInfo getPageInfo(int cp);

	List<Magazine> selectList(MagazinePageInfo pInfo);

	List<Magazine> selectThumbnailList(List<Magazine> mList);

	/** 매거진 등록
	 * @param map
	 * @param images
	 * @param savePath
	 * @return
	 */
	int insertMagazine(Map<String, Object> map, List<MultipartFile> images, String savePath);

	Attachment insertImages(MultipartFile uploadFile, String savePath);

	/** 매거진 상세 조회
	 * @param no
	 * @return
	 */
	Magazine selectMagazine(int no);

	/** 매거진 이미지 조회
	 * @param no
	 * @return
	 */
	List<MagazineImg> selectMimgList(int no);

	/** 썸네일 가져오기
	 * @param no
	 * @return
	 */
	MagazineImg selectThumbnail(int no);

	int updateMagazine(Map<String, Object> map, List<MultipartFile> images, String savePath);

	
}
