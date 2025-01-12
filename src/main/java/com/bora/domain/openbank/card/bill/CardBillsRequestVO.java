package com.bora.domain.openbank.card.bill;

import java.util.Random;

import lombok.Data;

@Data
public class CardBillsRequestVO {
	private String access_token;
	private String bank_tran_id; // 거래고유번호(참가기관)
	private String user_seq_no; // 사용자일련번호
	private String bank_code_std; // 카드사 대표코드(금융기관 공동코드)
	private String member_bank_code; // 회원 금융회사 코드(금융기관 공동코드)
    private String from_month; // 조회 시작월(YYYYMM)
    private String to_month; // 조회 종료월(YYYYMM)
    private String befor_inquiry_trace_info; // 직전조회추적정보
    
    public CardBillsRequestVO() {}
    
    public String getBank_tran_id() {
    	Random random = new Random();
    	random.setSeed(System.currentTimeMillis());
    	long val = random.nextInt(1000000000)+1;
    	return "M202202178U"+String.valueOf(val);
	}

    
	public CardBillsRequestVO(String access_token, String bank_tran_id, String user_seq_no, String bank_code_std,
			String member_bank_code, String from_month, String to_month, String befor_inquiry_trace_info) {
		super();
		this.access_token = access_token;
		this.bank_tran_id = getBank_tran_id();
		this.user_seq_no = user_seq_no;
		this.bank_code_std = bank_code_std;
		this.member_bank_code = member_bank_code;
		this.from_month = from_month;
		this.to_month = to_month;
		this.befor_inquiry_trace_info = befor_inquiry_trace_info;
	}

	@Override
	public String toString() {
		return "CardBillsRequestVO [access_token=" + access_token + ", bank_tran_id=" + bank_tran_id + ", user_seq_no="
				+ user_seq_no + ", bank_code_std=" + bank_code_std + ", member_bank_code=" + member_bank_code
				+ ", from_month=" + from_month + ", to_month=" + to_month + ", befor_inquiry_trace_info="
				+ befor_inquiry_trace_info + "]";
	}
    
	

}
