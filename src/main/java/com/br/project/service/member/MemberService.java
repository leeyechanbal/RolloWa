package com.br.project.service.member;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.br.project.dao.member.MemberDao;
import com.br.project.dto.common.AttachmentDto;
import com.br.project.dto.member.MemberDto;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberService {
	private final MemberDao memberDao;
	
	// 회원 로그인
	public MemberDto memberLogin(MemberDto member) {
		return memberDao.memberLogin(member);
	}
	
	// 회원 정보 조회
	public MemberDto selectMember(MemberDto member) {
		return memberDao.selectMember(member);
	}

	// 회원 아이디 찾기
	public String selectUserId(String userNo) {
		return memberDao.selectUserId(userNo);
	}
	
	// 회원 프로필 이미지 변경
	public int updateProfile(MemberDto member, AttachmentDto att) {
		int result1 = memberDao.updateProfile(member);
		int result2 = memberDao.insertAttachment(att);
		
		return result1 * result2;
	}
	
	// 회원정보 수정
	public int updateMember(Map<String, String> memberInfo) {
		return memberDao.updateMember(memberInfo);
	}

	public int updateUserPwd(MemberDto member) {
		return memberDao.updateUserPwd(member);
	}
}
