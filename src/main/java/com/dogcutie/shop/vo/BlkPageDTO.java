package com.dogcutie.shop.vo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.ToString;

//@Getter
//@ToString
@Data
@AllArgsConstructor
@Getter
public class BlkPageDTO {
//	private int startPage, endPage;
//	private boolean prev, next;
	
//	private int total;
	//private Criteria crit;
	
	private int blkCnt;
	private List<Black_Tbl> blklist;
	
	
//	public BlkPageDTO (Criteria crit, int total) {
//		this.crit = crit;
//		this.total = total;
//		
//		this.endPage = (int)(Math.ceil(crit.getPageNum()/10.0))*10;
//		this.startPage = this.endPage-9;
//		
//		int realEnd = (int)(Math.ceil((total*1.0)/crit.getAmount()));
//		if(realEnd <this.endPage) {
//			this.endPage = realEnd;
//		}
//		
//		this.prev = this.startPage >1;
//		this.next = this.endPage<realEnd;
//	}
}
