package com.kh.lp.item.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

// 감정상품 배송관련 객체
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ItemDeli {
	private String itemCategory; // 카테고리 -> 감정신청배송 or 가품으로 인한 배송
	private int itemNo;
	private String itemAttachmentRename;
	private String itemBrandAndModel; // 사용자가 작성한 내용을 가져옴
	private String itemDeli; // 배송 상태
}
