package com.employee.model;

import java.io.Serializable;
import java.util.Arrays;

public class EmployeeVO implements Serializable{
	private static final long serialVersionUID = 1L;
	private String empno;
	private String eAccount;
	private String ePw;
	private String eName;
	private String ePhone;
	private String eEmail;
	private byte[] ePic;
	private String eTitle;
	private Integer eStatus;
	
	public EmployeeVO() {
		super();
	}

	public EmployeeVO(String empno, String eAccount, String ePw, String eName, String ePhone, String eEmail,
			byte[] ePic, String eTitle, Integer eStatus) {
		super();
		this.empno = empno;
		this.eAccount = eAccount;
		this.ePw = ePw;
		this.eName = eName;
		this.ePhone = ePhone;
		this.eEmail = eEmail;
		this.ePic = ePic;
		this.eTitle = eTitle;
		this.eStatus = eStatus;
	}

	@Override
	public String toString() {
		return "employeeVO [empno=" + empno + ", eAccount=" + eAccount + ", ePw=" + ePw + ", eName=" + eName
				+ ", ePhone=" + ePhone + ", eEmail=" + eEmail + ", ePic=" + Arrays.toString(ePic) + ", eTitle=" + eTitle
				+ ", eStatus=" + eStatus + "]";
	}

	public String getEmpno() {
		return empno;
	}

	public void setEmpno(String empno) {
		this.empno = empno;
	}

	public String geteAccount() {
		return eAccount;
	}

	public void seteAccount(String eAccount) {
		this.eAccount = eAccount;
	}

	public String getePw() {
		return ePw;
	}

	public void setePw(String ePw) {
		this.ePw = ePw;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public String getePhone() {
		return ePhone;
	}

	public void setePhone(String ePhone) {
		this.ePhone = ePhone;
	}

	public String geteEmail() {
		return eEmail;
	}

	public void seteEmail(String eEmail) {
		this.eEmail = eEmail;
	}

	public byte[] getePic() {
		return ePic;
	}

	public void setePic(byte[] ePic) {
		this.ePic = ePic;
	}

	public String geteTitle() {
		return eTitle;
	}

	public void seteTitle(String eTitle) {
		this.eTitle = eTitle;
	}

	public Integer geteStatus() {
		return eStatus;
	}

	public void seteStatus(Integer eStatus) {
		this.eStatus = eStatus;
	}
	
	
}
