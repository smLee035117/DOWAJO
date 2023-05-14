package com.project.root.member.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.root.member.dto.MemberDTO;
import com.project.root.mybatis.member.MemberMapper;
import com.project.root.suggestions.dto.SuggestionsDTO;
@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public int loginCheck(HttpServletRequest request) {
		MemberDTO dto = mapper.user_check(request.getParameter("id"));
		if(dto != null) {
			if(request.getParameter("pw").equals(dto.getMemPass())) {
				return 1;
			}
		}
		return 0;
	}

	@Override
	public String getMemKey(String id) {
		String MemKey = mapper.getMemKey(id);
		return MemKey;
	}
	
	@Override
	public int writeRegister(MemberDTO memberDTO) {		
		int result = mapper.userCk(memberDTO);
		System.out.println("serResult = "+result);
		if(result>=1) {		
			result=2;
		}else {
			result = mapper.writeRegister(memberDTO);		
		}
		return result;
	}
	
	//---------AdminController------------
	//sugTable페이지 값 뿌림
	@Override
	public int sugWrite(SuggestionsDTO suggestionsDTO) {		
		return mapper.sugWrite(suggestionsDTO);
	}

	//sugTable페이지 상세페이지
	@Override
	public List<SuggestionsDTO> getSuggestionsList() {
		return mapper.getSuggestionsList();
	}

	//blank 페이지에서 건의사항 작성
	@Override
	public SuggestionsDTO sugDetail(SuggestionsDTO suggestionsDTO) {		
		return mapper.sugDetail(suggestionsDTO);
	}
	
	//sugTable페이지 상세페이지 볼때 읽음 표시
	@Override
	public int ReadCk(SuggestionsDTO suggestionsDTO) {
		return mapper.ReadCk(suggestionsDTO);
	}
	//-------End------------------------	

	public int pwChange(MemberDTO memberDTO) {
		return mapper.pwChange(memberDTO);
	}

	@Override
	public String getNick(MemberDTO memberDTO) {
		return mapper.getNick(memberDTO);
	}

	
	
}
