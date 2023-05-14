package com.project.root.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.project.root.member.dto.MemberDTO;
import com.project.root.suggestions.dto.SuggestionsDTO;

public interface MemberService {

	public int loginCheck(HttpServletRequest request);
	public String getMemKey(String id);
	public int writeRegister(MemberDTO memberDTO);
	
	//---------AdminController------------
	//sugTable페이지 값 뿌림
	public int sugWrite(SuggestionsDTO suggestionsDTO);
	
	//sugTable페이지 상세페이지
	public List<SuggestionsDTO> getSuggestionsList();
	
	//blank 페이지에서 건의사항 작성
	public SuggestionsDTO sugDetail(SuggestionsDTO suggestionsDTO);
	
	//sugTable페이지 상세페이지 볼때 읽음 표시
	public int ReadCk(SuggestionsDTO suggestionsDTO);
	//-------End------------------------
	
	//비밀번호 변경
	public int pwChange(MemberDTO memberDTO);
	
	//닉네임 정보
	public String getNick(MemberDTO memberDTO);
}
