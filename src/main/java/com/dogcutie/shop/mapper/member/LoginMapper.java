package com.dogcutie.shop.mapper.member;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

import com.dogcutie.shop.vo.All_User_Tbl;

public interface LoginMapper {
	//유저 정보
	ArrayList<All_User_Tbl> findByUserId(@Param("id") String id);
}
