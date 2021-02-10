package com.dogcutie.shop.mapper.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dogcutie.shop.vo.Ask_Tbl;

@Mapper
public interface AskMapper {
	public List<Ask_Tbl> ask(int p_no); // 상품문의 리스트
	public int askForm(Ask_Tbl ask);	// 상품문의 등록
	public int ask_reply(Ask_Tbl ask_no); //문의댓글에 대한 답글
}
