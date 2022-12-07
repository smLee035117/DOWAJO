package com.project.root.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.project.root.suggestions.dto.SuggestionsDTO;

public interface MemberService {

	int loginCheck(HttpServletRequest request);
	String getMemKey(String id);
	
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
}
