package com.dogcutie.shop.mapper.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.dogcutie.shop.vo.Reply_Tbl;

@Mapper
public interface ReplyMapper {
	
	public List<Reply_Tbl> replyList(int p_no);
	public void replyForm(Reply_Tbl reply);
}
