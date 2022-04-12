package com.spring_pj.LJH.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring_pj.LJH.dto.MemberDTO;
import com.spring_pj.LJH.dto.UserVO;

public class UserAuthenticationService implements UserDetailsService {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	public UserAuthenticationService(SqlSessionTemplate sqlSession) {
		//dataSource bean id = slqSession값을 주입받아 매개변수에 선언
		this.sqlSession = sqlSession;
	}

	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		System.out.println("UserAuthenticationService - loadUserByUsername 진입 ");
		
		MemberDTO dto = sqlSession.selectOne("com.spring_pj.LJH.dao.MemberDAO.selectCustomer", id);
		System.out.println("로그인 체크 => " + dto);
		//인증실패시 인위적으로 예외 생성
		if(dto == null) throw new UsernameNotFoundException(id);
		//default로 지정한 role_user값을 가지고 온다.
		List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
		
		authority.add(new SimpleGrantedAuthority(dto.getAuthority()));
		//UserVO 클래스 먼저 생성 후 return
		//security 로그인에서 확인해야할 부분 : id, password, authority(ROLE_USER / ROLE_ADMIN),enable(이메일 인증시 1로 업데이트, 반드시 이메일 인증 후 security적용) 체크 될 사항
		return new UserVO(dto.getId(), dto.getPassword(), dto.getEnabled().equals("1"), true, true, true, authority);

	}

}





/* @author LJH_Note
 * 로그인 인증을 처리하는 loadUserByUsername 메서드를 호출
 * 1) 매개변수 username을 id로 수정
 * 2) 매개변수로 전달된 아이디와 일치하는 레코드를 읽어온다.
 * 3) 테이블의 암호화된 비밀번호와 사용자가 입력하는 비밀번호를 내부적으로 비교 처리
 * 4) 정보가 없으면 예외처리를 발생시키고, 있으면 해당 정보를 dto로 리턴한다.
 * 
 */