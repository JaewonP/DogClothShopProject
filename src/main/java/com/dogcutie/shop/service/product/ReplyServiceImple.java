package com.dogcutie.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogcutie.shop.mapper.product.ReplyMapper;
import com.dogcutie.shop.vo.Reply_Tbl;

import lombok.Setter;

@Service
public class ReplyServiceImple implements ReplyService{
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

	@Override
	public List<Reply_Tbl> replyList(int p_no) {
		
		return mapper.replyList(p_no);
	}

	@Override
	public void replyForm(Reply_Tbl reply) {
		mapper.replyForm(reply);
		
	}
}
