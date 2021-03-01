package team.project.gday.member.bmem.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public interface BmemService2 {

	//클래스 등록 신청 Service
	int insertClass(Map<String, Object> map, List<MultipartFile> images, String savePath);




}
