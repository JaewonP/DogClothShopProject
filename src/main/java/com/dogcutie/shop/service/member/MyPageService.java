package com.dogcutie.shop.service.member;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.dogcutie.shop.vo.All_User_Tbl;

public interface MyPageService {
	public All_User_Tbl isRole(String id); //역할 찾기 

}
