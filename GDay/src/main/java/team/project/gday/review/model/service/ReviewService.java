package team.project.gday.review.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import team.project.gday.review.model.vo.Review;

public interface ReviewService {

	/** 후기 등록
	 * @param review
	 * @param rvImg
	 * @param savePath
	 * @return result
	 */
	int insertReview(Review review, List<MultipartFile> rvImg, String savePath);

}
