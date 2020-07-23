package model.DTO;

import java.sql.Timestamp;

public class PartnerOrderDTO {
	
	String partnerName;
	String partnerNum;
	String bookName;
	String bookNum;
	String bookCount;
	String pOrderNum;
	String pOrderQty;
	Timestamp pOrderDate;
	String pOrderReQty;
	Timestamp pOrderReDate;
	String pOrderOkQty;
	Timestamp pOrderOkDate;
	String pOrderChk;
	
	public String getPartnerName() {
		return partnerName;
	}
	public void setPartnerName(String partnerName) {
		this.partnerName = partnerName;
	}
	public String getPartnerNum() {
		return partnerNum;
	}
	public void setPartnerNum(String partnerNum) {
		this.partnerNum = partnerNum;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookNum() {
		return bookNum;
	}
	public void setBookNum(String bookNum) {
		this.bookNum = bookNum;
	}
	public String getBookCount() {
		return bookCount;
	}
	public void setBookCount(String bookCount) {
		this.bookCount = bookCount;
	}
	public String getpOrderNum() {
		return pOrderNum;
	}
	public void setpOrderNum(String pOrderNum) {
		this.pOrderNum = pOrderNum;
	}
	public String getpOrderQty() {
		return pOrderQty;
	}
	public void setpOrderQty(String pOrderQty) {
		this.pOrderQty = pOrderQty;
	}
	public Timestamp getpOrderDate() {
		return pOrderDate;
	}
	public void setpOrderDate(Timestamp pOrderDate) {
		this.pOrderDate = pOrderDate;
	}
	public String getpOrderReQty() {
		return pOrderReQty;
	}
	public void setpOrderReQty(String pOrderReQty) {
		this.pOrderReQty = pOrderReQty;
	}
	public Timestamp getpOrderReDate() {
		return pOrderReDate;
	}
	public void setpOrderReDate(Timestamp pOrderReDate) {
		this.pOrderReDate = pOrderReDate;
	}
	public String getpOrderOkQty() {
		return pOrderOkQty;
	}
	public void setpOrderOkQty(String pOrderOkQty) {
		this.pOrderOkQty = pOrderOkQty;
	}
	public Timestamp getpOrderOkDate() {
		return pOrderOkDate;
	}
	public void setpOrderOkDate(Timestamp pOrderOkDate) {
		this.pOrderOkDate = pOrderOkDate;
	}
	public String getpOrderChk() {
		return pOrderChk;
	}
	public void setpOrderChk(String pOrderChk) {
		this.pOrderChk = pOrderChk;
	}

	
}
