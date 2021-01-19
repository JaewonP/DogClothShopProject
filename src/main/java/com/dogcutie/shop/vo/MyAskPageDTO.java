package com.dogcutie.shop.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class MyAskPageDTO {  //성연이 만듬 
	private int askCnt;
	private List<AskPrintVO> askList;	
}
