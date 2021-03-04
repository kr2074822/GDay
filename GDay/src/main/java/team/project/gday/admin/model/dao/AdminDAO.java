package team.project.gday.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.admin.model.vo.adminPageInfo;
import team.project.gday.member.model.vo.Member;

@Repository
public class AdminDAO {

	@Autowired
	private SqlSession sqlSession;
	
	/** 회원 전체조회 페이징
	 * @return listCount
	 */
	public int getListCount() {
		return sqlSession.selectOne("adminMapper.getListCount");
	}

	/** 회원 전체조회하기
	 * @param pInfo
	 * @return mList
	 */
	public List<Member> adminMember(adminPageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("adminMapper.adminMember", pInfo, rowBounds);
	}

}
