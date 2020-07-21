package model.DTO;

import java.sql.Timestamp;

public class AdminDTO {
	String adminId;
	String adminPw;
	String adminName;
	String adminPh1;
	String adminPh2;
	Timestamp adminRegist;
	String adminEmail;
	String adminAuthority;
	
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminPw() {
		return adminPw;
	}
	public void setAdminPw(String adminPw) {
		this.adminPw = adminPw;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getAdminPh1() {
		return adminPh1;
	}
	public void setAdminPh1(String adminPh1) {
		this.adminPh1 = adminPh1;
	}
	public String getAdminPh2() {
		return adminPh2;
	}
	public void setAdminPh2(String adminPh2) {
		this.adminPh2 = adminPh2;
	}
	public Timestamp getAdminRegist() {
		return adminRegist;
	}
	public void setAdminRegist(Timestamp adminRegist) {
		this.adminRegist = adminRegist;
	}
	public String getAdminEmail() {
		return adminEmail;
	}
	public void setAdminEmail(String adminEmail) {
		this.adminEmail = adminEmail;
	}
	public String getAdminAuthority() {
		return adminAuthority;
	}
	public void setAdminAuthority(String adminAuthority) {
		this.adminAuthority = adminAuthority;
	}
	
}
