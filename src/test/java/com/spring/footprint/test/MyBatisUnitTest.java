package com.spring.footprint.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;

import com.spring.footprint.domain.Member;
import com.spring.footprint.domain.MemberBoard;
import com.spring.footprint.domain.MapInformation;

public class MyBatisUnitTest {

/*	@Test
	public void unit1() throws Exception {		//search
		SqlSession session = null;
		SqlSessionFactory factory = TestUtil.getSqlSessionFactory();
		session = factory.openSession();
		
		session.insert("SearchMapper.insertWord", "모스크바");
		session.commit();
		
		session.update("SearchMapper.updateCount", "모스크바");
		session.commit();
		
		System.out.println(session.selectList("SearchMapper.getBestWord"));
		
		System.out.println(session.selectList("SearchMapper.searchMemberTipBoard"));
		System.out.println(session.selectList("SearchMapper.searchAdminTipBoard"));
		System.out.println(session.selectList("SearchMapper.searchAdminBoard"));
		System.out.println(session.selectList("SearchMapper.searchMemberBoard"));
	}// unit1
*/

/*	@Test
	public void unit2() throws Exception {		//member
		SqlSession session = null;
		SqlSessionFactory factory = TestUtil.getSqlSessionFactory();
		session = factory.openSession();
		Member member = new Member("id", "password", "name", "birth", "addressApi", "addressInput", "email", 0);
		
		session.insert("MemberMapper.registerMember", member);
		session.commit();

		System.out.println(session.selectOne("MemberMapper.idcheck","id"));
		System.out.println(session.selectOne("MemberMapper.login",member));
		member.setAddressApi("조선");
		member.setName("홍길동");
		
		System.out.println(session.update("MemberMapper.updateMember",member));
		session.commit();
	}//unit2
*/
/*	@Test
	public void unit3() throws Exception {		//admin_board
		SqlSession session = null;
		SqlSessionFactory factory = TestUtil.getSqlSessionFactory();
		session = factory.openSession();

		Member member = new Member("id", "password", "name", "birth", "address", "email", 0);
		AdminBoard adminBoard = new AdminBoard(3, "title", "content", 0, null, "img", "orgfilename", "newfilename", member, null); 
		session.insert("AdminBoardMapper.writeAdminBoard", adminBoard);
		session.commit();
		
		System.out.println(session.selectOne("AdminBoardMapper.showAdminContent",3));
		session.update("AdminBoardMapper.updateAdminCount",3);
		session.commit();
		System.out.println(session.selectOne("AdminBoardMapper.showAdminContent",3));
		
		session.delete("AdminBoardMapper.deleteAdminBoard",4);
		session.commit();
		adminBoard.setContent("이것이 내용일세요");
		session.update("AdminBoardMapper.updateAdminBoard",adminBoard);
		session.commit();
		
		//System.out.println(session.selectOne("AdminBoardMapper.totalAdminCount"));
		
		System.out.println(session.selectList("AdminBoardMapper.getAdminBoardList",1));
	}//unit3
*/
	
/*	@Test
	public void unit4() throws Exception {		//member_board
		SqlSession session = null;
		SqlSessionFactory factory = TestUtil.getSqlSessionFactory();
		session = factory.openSession();
		
		Member member = new Member("id", "password", "홍길동", "birth", "조선", "addressInput", "email", 0);
		MapInformation mapInformation = new MapInformation("아시아", "중국", "광저우", 23.129134, 113.264379);
		System.out.println(mapInformation);
		MemberBoard memberBoard = new MemberBoard("location", "content", "img", null, member, mapInformation);
		System.out.println(memberBoard);
		session.insert("MemberBoardMapper.writeMemberBoard", memberBoard);
		session.commit();

		System.out.println(session.selectList("MemberBoardMapper.showMemberBoard",memberBoard));
	}//unit4
*/
	@Test
	public void unit5() throws Exception {		//nation
		SqlSession session = null;
		SqlSessionFactory factory = TestUtil.getSqlSessionFactory();
		session = factory.openSession();
		
		MapInformation nation = new MapInformation();

		//System.out.println(session.selectList("MapInformationMapper.getAllMapInformation"));
		TestUtil.printList((List)session.selectList("MapInformationMapper.getAllMapInformation"));
		
		TestUtil.printList((List)session.selectList("MapInformationMapper.getWorldMapInformation"));
	}//unit5

}
