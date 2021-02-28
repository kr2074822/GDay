package team.project.gday.magazine.model.service;

import java.util.List;

import team.project.gday.magazine.model.vo.Magazine;
import team.project.gday.magazine.model.vo.MagazinePageInfo;

public interface MagazineService {

	MagazinePageInfo getPageInfo(int cp);

	List<Magazine> selectList(MagazinePageInfo pInfo);

	List<Magazine> selectThumbnailList(List<Magazine> mList);
	
}
