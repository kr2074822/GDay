package team.project.gday.member.bmem.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


import team.project.gday.Product.model.vo.Attachment;
import team.project.gday.common.model.exception.UserDefineException;
import team.project.gday.member.bmem.model.dao.BmemDAO2;

@Service
public class BmemServiceImpl2 implements BmemService2 {

	@Autowired
	private BmemDAO2 dao;

	//클래스 등록 신청 serviceImpl
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertClass(Map<String, Object> map, List<MultipartFile> images, String savePath) {
		int result = 0;
		//1) 다음 상품번호 조회
		int prdtNo = dao.selectNextNo();
		
		if(prdtNo>0) {
			map.put("prdtNo", prdtNo);
						
			//2) 제품 테이블에 삽입
			result = dao.insertProduct(map);
			
			if(result>0) {
				// 3) 클래스 테이블에 삽입
				result = dao.insertClass(map);
				
				if(result>0) {
					// 4) 해시태그 테이블에 삽입
					result = dao.insertTag(map);
					
					if(result>0) {
						//5) 썸네일 이미지 정보 삽입 (경로차이O)
						List<Attachment> uploadImages = new ArrayList<>();
						
						String filePath = "/resources/images/thumbnailImg";
						
						for(int i=0; i<images.size(); i++) {
							if(!images.get(i).getOriginalFilename().contentEquals("")) {
								String fileName = rename(images.get(i).getOriginalFilename());
								Attachment at = new Attachment(filePath, fileName, i, prdtNo);
								uploadImages.add(at);
							}
						}
						//6. 썸머노트 내 첨부 이미지 삽입
						Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
						Matcher matcher = pattern.matcher((String)map.get("prdtContent"));
						
						String fileName = null;
						String src = null;
						
						while(matcher.find()) {
							src = matcher.group(1);
							filePath = src.substring(src.indexOf("/", 2), src.lastIndexOf("/"));
							System.out.println(filePath);
							fileName = src.substring(src.lastIndexOf("/") + 1);
							Attachment at = new Attachment(filePath, fileName, 1, prdtNo);
							uploadImages.add(at);
						}
						
						//7.파일 정보 삽입
						if(!uploadImages.isEmpty()) {
							result = dao.insertAttachmentList(uploadImages);
						
							if(result == uploadImages.size()) {
								result = prdtNo;
								
								int size = 0;
								if(!images.get(0).getOriginalFilename().equals("")) {
									size = images.size();
								} 
								
								for(int i=0; i<size; i++) {
									try {
										images.get(uploadImages.get(i).getFileLevel())
										.transferTo(new File(savePath + "/" + uploadImages.get(i).getFileName())); //savePath(실제 경로) "/"안에 앞뒤 띄어쓰기 절대 금지
									} catch(Exception e) {
										e.printStackTrace();
										throw new UserDefineException("파일을 서버에 저장 실패하였습니다.");

									}
								}
								
							} else {
								throw new UserDefineException("파일 정보 DB 삽입에 실패하여 페이지 이동합니다.");
							}
						
						}
					
				} else {
					throw new UserDefineException("해시태그 입력에 실패하여 페이지 이동합니다.");
				}
			} else {
				throw new UserDefineException("클래스 삽입에 실패하여 페이지 이동합니다.");
			} 
		} else {
			throw new UserDefineException("상품번호 조회에 실패하여 페이지 이동합니다.");
		}		
	}
		return result;
}

	// 파일명 변경 메소드
		public String rename(String originFileName) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
			String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

			int ranNum = (int)(Math.random()*100000); // 5자리 랜덤 숫자 생성

			String str = "_" + String.format("%05d", ranNum);
			//String.format : 문자열을 지정된 패턴의 형식으로 변경하는 메소드
			// %05d : 오른쪽 정렬된 십진 정수(d) 5자리(5)형태로 변경. 빈자리는 0으로 채움(0)

			String ext = originFileName.substring(originFileName.lastIndexOf("."));

			return date + str + ext;
		}

		//summernote에 업로드된 이미지 저장 serviceImpl
		@Override
		public Attachment insertImages(MultipartFile uploadFile, String savePath) {
			
			//파일명 변경하기
			String fileName = rename(uploadFile.getOriginalFilename());
			//웹상 접근 주소 적기
			String filePath = "/resources/images/productInfoImg";
			
			Attachment at = new Attachment();
			at.setFilePath(filePath);
			at.setFileName(fileName);
			
			//transferTo == 서버에 파일 저장
			try {
				uploadFile.transferTo(new File(savePath + "/" + fileName ));
			} catch(Exception e) {
				e.printStackTrace();
				throw new UserDefineException("summernote 파일 업로드에 실패했습니다.");
			}
			return at;
		}
	
}
