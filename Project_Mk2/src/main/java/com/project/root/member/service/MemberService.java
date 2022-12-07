package com.project.root.member.service;

import javax.servlet.http.HttpServletRequest;

public interface MemberService {

	int loginCheck(HttpServletRequest request);

	String getMemKey(String id);

}
