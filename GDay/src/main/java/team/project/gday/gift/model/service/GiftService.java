package team.project.gday.gift.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import team.project.gday.Product.model.vo.Attachment;

public interface GiftService {

	int insertGift(Map<String, Object> map, List<MultipartFile> images, String savePath);

	//썸머노트에 업로드된 이미지 저장 service
	Attachment insertImages(MultipartFile uploadFile, String savePath);

}
