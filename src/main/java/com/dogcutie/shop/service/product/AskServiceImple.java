package com.dogcutie.shop.service.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dogcutie.shop.mapper.product.AskMapper;
import com.dogcutie.shop.vo.Ask_Tbl;

import lombok.Setter;

@Service
public class AskServiceImple implements AskService {
	@Setter(onMethod_ = @Autowired)
	private AskMapper mapper;

	@Override
	public List<Ask_Tbl> ask(int p_no) {
		return mapper.ask(p_no);
	}

	@Override
	public int askForm(Ask_Tbl ask) {
		// TODO Auto-generated method stub
		return mapper.askForm(ask);
	}

	@Override
	public int ask_reply(Ask_Tbl ask_no) {
		
		return mapper.ask_reply(ask_no);
	}


}
