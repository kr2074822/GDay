package team.project.gday.admin.model.service;

import java.util.List;

import team.project.gday.admin.model.vo.adminPageInfo;
import team.project.gday.member.model.vo.Member;

public interface AdminService {

	
	/** 페이징 처리를 위한 Service
	 * @param cp
	 * @return pInfo
	 */
	public abstract adminPageInfo getPageInfo(int cp);

	/** 회원 전체 조회 Service
	 * @param pInfo
	 * @return mList
	 */
	public abstract List<Member> adminMember(adminPageInfo pInfo);

}
