package team.project.gday.magazine.model.service;

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
import team.project.gday.magazine.model.dao.MagazineDAO;
import team.project.gday.magazine.model.vo.Magazine;
import team.project.gday.magazine.model.vo.MagazineImg;
import team.project.gday.magazine.model.vo.MagazinePageInfo;

@Service 
public class MagazineServiceImpl implements MagazineService{
	
	@Autowired
	private MagazineDAO dao;

	// 매거진 게시글 수 조회 
	@Override
	public MagazinePageInfo getPageInfo(int cp) {
		int listCount = dao.getListCount();
		
		return new MagazinePageInfo(cp, listCount);
	}

	// 매거진 목록 조회 구현
	@Override
	public List<Magazine> selectList(MagazinePageInfo pInfo) {
		return dao.selectList(pInfo);
	}

	// 매거진 썸네일 조회
	@Override
	public List<Magazine> selectThumbnailList(List<Magazine> mList) {
		return dao.selectThumbnailList(mList);
	}

	// 매거진 등록
	@Override
	public int insertMagazine(Map<String, Object> map, List<MultipartFile> images, String savePath) {
		int result = 0;
		//1) 다음 상품번호 조회
		int mgzNo = dao.selectNextNo();
		
		if(mgzNo>0) {
			map.put("mgzNo", mgzNo);
						
			//2) 매거진 테이블 삽입
			result = dao.insertMagazine(map);
			/*
			if(result>0) {
				// 3) 클래스 테이블에 삽입
				result = dao.insertClass(map);
				
				if(result>0) {
					// 4) 해시태그 테이블에 삽입
					result = dao.insertTag(map);
					*/
					if(result>0) {
						//5) 썸네일 이미지 정보 삽입 (경로차이O)
						List<MagazineImg> uploadImages = new ArrayList<>();
						
						String filePath = "/resources/images/magazineImg";
						
						for(int i=0; i<images.size(); i++) {
							if(!images.get(i).getOriginalFilename().contentEquals("")) {
								String fileName = rename(images.get(i).getOriginalFilename());
								MagazineImg at = new MagazineImg(filePath, fileName, i, mgzNo);
								uploadImages.add(at);
							}
						}
						//6. 썸머노트 내 첨부 이미지 삽입
						Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식
						Matcher matcher = pattern.matcher((String)map.get("mgzContent"));
						
						String fileName = null;
						String src = null;
						
						while(matcher.find()) {
							src = matcher.group(1);
							filePath = src.substring(src.indexOf("/", 2), src.lastIndexOf("/"));
							System.out.println(filePath);
							fileName = src.substring(src.lastIndexOf("/") + 1);
							MagazineImg at = new MagazineImg(filePath, fileName, 1, mgzNo);
							uploadImages.add(at);
						}
						
						//7.파일 정보 삽입
						if(!uploadImages.isEmpty()) {
							result = dao.insertAttachmentList(uploadImages);
						
							if(result == uploadImages.size()) {
								result = mgzNo;
								
								int size = 0;
								if(!images.get(0).getOriginalFilename().equals("")) {
									size = images.size();
								} 
								
								for(int i=0; i<size; i++) {
									try {
										images.get(uploadImages.get(i).getImgLevel())
										.transferTo(new File(savePath + "/" + uploadImages.get(i).getImgName())); //savePath(실제 경로) "/"안에 앞뒤 띄어쓰기 절대 금지
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
			/*
			 * } else { throw new UserDefineException("상품번호 조회에 실패하여 페이지 이동합니다."); } }
			 */
		return result;
		
	}

	
	// 이미지 등록
	@Override
	public Attachment insertImages(MultipartFile uploadFile, String savePath) {
		
		//파일명 변경하기
		String fileName = rename(uploadFile.getOriginalFilename());
		//웹상 접근 주소 적기
		String filePath = "/resources/images/magazineImg";
		
		Attachment at = new Attachment();
		at.setFilePath(filePath);
		at.setFileName(fileName);
		
		//transferTo == 서버에 파일 저장
		try {
			uploadFile.transferTo(new File(savePath + "/" + fileName ));
			System.out.println(uploadFile);
		} catch(Exception e) {
			e.printStackTrace();
			throw new UserDefineException("summernote 파일 업로드에 실패했습니다.");
		}
		return at;
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

	// 매거진 상세 조회
	@Override
	public Magazine selectMagazine(int no) {
		Magazine temp = new Magazine();
		temp.setMgzNo(no);
		Magazine magazine = dao.selectMagazine(temp);
		
		if (magazine != null) {
			int result = dao.increaseReadCount(no);
			if (result > 0) {
				magazine.setMgzReadCnt(magazine.getMgzReadCnt());
			}
			
		}
		
		return magazine;
	}

	// 매거진 상세 이미지 조회
	@Override
	public List<MagazineImg> selectMimgList(int no) {
		return dao.selectMimgList(no);
	}

	@Override
	public MagazineImg selectThumbnail(int no) {
		return dao.selectThumbnail(no);
	}

	// 매거진 수정
	@Transactional(rollbackFor=Exception.class)
	@Override
	public int updateMagazine(Map<String, Object> map, List<MultipartFile> images, String savePath) {

		// 매거진 수정
		int result = dao.updateMagazine(map);
	
			 if(result>0) {
				//5) 이미지 수정
				//비교 위해 수정 전 업로드 파일 정보를 얻어 옴
				List<MagazineImg> oldFiles = dao.selectMimgList(Integer.parseInt(map.get("mgzNo").toString()));
				System.out.println("사진 얻어오기odl" + oldFiles);
				//새로 업로드된 파일 정보를 담을 리스트
				List<MagazineImg> uploadImages = new ArrayList<MagazineImg>();
				
				//삭제되어야 할 파일 정보를 담을 리스트
				List<MagazineImg> removeFileList = new ArrayList<MagazineImg>();
				
				//DB에 저장할 웹상 이미지 접근 경로
				String filePath = "/resources/images/magazineImg";
				
				//새롭게 업로드된 파일 정보를 가지고 있는 images에 반복 접근
				for(int i=0; i<images.size(); i++) {
					//업로드된 파일 이미지가 있을 경우
					if(!images.get(i).getOriginalFilename().equals("")) {
						//파일명 변경
						String fileName = rename(images.get(i).getOriginalFilename());
						//Attachment 객체 생성
						MagazineImg at = new MagazineImg(filePath, fileName, i, Integer.parseInt(map.get("mgzNo").toString()));
						uploadImages.add(at);
						
						for(MagazineImg old: oldFiles) {
							if(old.getImgLevel() == i) {
								//DB에서 파일 번호가 일치하는 행의 내용을 수정하기 위해 파일 번호를 얻어옴
								//-> 수행 뒤 server에는 아직 남아있음
								at.setImgNo(old.getImgNo());
								removeFileList.add(old);
							}
						}
						result = dao.updateMagazineImg(at);
						
						if(result<=0) {
							throw new UserDefineException("썸네일 정보 수정 실패");
						} 
					}
				}
				
				
				
				
				//images 반복 접근 for문 종료
				//uploadImages == 업로드된 파일 정보 --> 서버에 파일 저장
				//removeFileList == 제거해야 할 파일 정보 --> 서버에서 파일 삭제
				// 수정되거나 새롭게 삽입된 이미지를 서버에 저장하기 위해 transferTo() 수행
				
				if(result>0) {
					for(int i=0; i<uploadImages.size(); i++) {
						try {
							images.get(uploadImages.get(i).getImgLevel())
							.transferTo(new File(savePath + "/" + uploadImages.get(i).getImgName()) );                                             
						}catch (Exception e) {
							e.printStackTrace();
							throw new UserDefineException("파일 정보 수정 실패");
						}
					}
				}
				
				// ------------------------------------------
				// 이전 파일 서버에서 삭제하는 코드 
				for(MagazineImg removeFile : removeFileList) {
					File tmp = new File(savePath + "/" + removeFile.getImgName());
					tmp.delete();
				}
				// ------------------------------------------
				
				//summernote로 작성된 게시글에 있는 이미지 정보 수정
				//게시글에 작성된 <img> 태그의 src속성을 이용해서 파일명을 얻어오기
				
				Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); //img 태그 src 추출 정규표현식

				//게시글에 작성된 <img>태그의 src속성을 이용하여 파일명을 얻어오기
				Matcher matcher = pattern.matcher((String)map.get("mgzContent"));
				
				//정규식을 통해 게시글에 작성된 이미지 파일명만 얻어와 모아둘 List 선언
				List<String> fileNameList = new ArrayList<String>();
				
				String src= null; //matcher에 저장된 src를 꺼내서 임시 저장할 변수
				String filename = null; //src에서 파일 명을 수정해서 임시 저장할 변수
				
				while(matcher.find()) {
					src = matcher.group(1);
				}
				
				//DB에 새로 추가할 이미지파일 정보를 모아둘 List 생성
				List<MagazineImg> newAttachmentList = new ArrayList<MagazineImg>();
				
				//DB에서 삭제할 이미지 파일 번호를 모아둔 List 생성
				List<Integer> deleteFileNoList = new ArrayList<>();
				
				//수정된 게시글 파일명 목록(fileNameList)과
				//수정 전 파일 정보 목록(oldFiles)를 비교해서
				//수정된 게시글 파일명 하나를 기준으로 하여 수정 전 파일명과 순서적 비교를 진행
				// --> 수정된 게시글 파일명과 일치하는 수정 전 파일명이 없다면 
				//== 새로 삽입된 이미지임을 의미함
				
				for(String fName : fileNameList) {
					
					boolean flag = true;
					
					for(MagazineImg oldAt : oldFiles) {
						if(oldAt.getImgLevel() == 0) continue;
						
						if(fName.equals(oldAt.getImgName())) { //수정 후 / 수정 전 같은 파일이 있다 == 수정되지 않았다
							flag = false;
							break;
						}
					}
					
					//flag == true == 수정 후 게시글 파일명과 수정 전 파일명이 일치하는 게 없을 경우
					// ==새로운 이미지 -> newAttachmentList 추가
					if(flag) {
						MagazineImg at = new MagazineImg(filePath, fName, 1, Integer.parseInt(map.get("mgzNo").toString()));
						newAttachmentList.add(at);
					}
				}
				
				//수정 전 파일 정보 목록(oldFiles)과
				//수정된 게시글 파일명 목록(fileNameList)을 비교
				//수정전 파일명 하나를 기준으로 하여 수정 후 파일명과 순서적 비교를 진행
				// --> 수정 전 게시글 파일명과 일치하는 수정 후 파일명이 없다면 
				//== 기존 수정 전 이미지가 삭제됨을 의미
				
				for(MagazineImg oldAt : oldFiles) {
					if(oldAt.getImgLevel() == 0) continue;
					boolean flag = true;

					for(String fName : fileNameList) {
						if(oldAt.getImgName().equals(fName)) {
							flag = false;
							break;
						}
					}
					
					//flag == true == 수정 전 파일명과 수정 후 파일명이 일치하는 게 없을 경우
					// == 삭제된 이미지 --> deleteFileNoList 추가
					if(flag) {
						deleteFileNoList.add(oldAt.getImgNo());
					}
				}
				
				//newAttachmentList / deleteFileNoList 완성됨
				if(!newAttachmentList.isEmpty()) { //새로 삽입된 이미지가 있다면
					result = dao.insertAttachmentList(newAttachmentList);
					
					if(result != newAttachmentList.size()) {//삽입된 결과행의 수와 수정된 리스트의 수가 맞지 않을 경우 == 실패
						throw new UserDefineException("파일 수정 실패(파일 정보 삽입 중 오류 발생)");
					}
				}
				
				if(!deleteFileNoList.isEmpty()) { //삭제될 이미지가 있다면
					result = dao.deleteMagazineImg(deleteFileNoList);
					
					if(result != deleteFileNoList.size()) {
						throw new UserDefineException("파일 수정 실패(파일 정보 삭제 중 오류 발생)");
					}
				}
		
			 }
		return result;
	}

	// 메인 매거진
	@Override
	public List<Magazine> selectMagazine3() {
		return dao.selectMagazine3();
	}

	@Override
	public List<MagazineImg> selectThumbnail2(List<Magazine> mList) {
		return dao.selectThumbnail2(mList);
	}

}
