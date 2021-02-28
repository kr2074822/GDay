package team.project.gday.member.bmem.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import team.project.gday.member.bmem.model.vo.PageInfo9;
import team.project.gday.product.model.vo.Attachment;
import team.project.gday.product.model.vo.GClass;
import team.project.gday.product.model.vo.Gift;

@Repository // 저장소 (DB) 연결 객체임을 알려줌 + bean 등록
public class BmemDAO2 {

	// 마이바티스를 이용한 DB 연결 객체를 의존성 주입
	@Autowired
	private SqlSessionTemplate sqlSession;
	



}
