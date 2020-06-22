package com.permission.model;

import java.io.Serializable;

public class PermissionVO implements Serializable{
	private static final long serialVersionUID = 1L;
	private String empno;
	private String feano;
	
	public PermissionVO() {
		super();
	}
	public PermissionVO(String empno, String feano) {
		super();
		this.empno = empno;
		this.feano = feano;
	}
	public String getEmpno() {
		return empno;
	}
	public void setEmpno(String empno) {
		this.empno = empno;
	}
	public String getFeano() {
		return feano;
	}
	public void setFeano(String feano) {
		this.feano = feano;
	}
	@Override
	public String toString() {
		return "permissionVO [empno=" + empno + ", feano=" + feano + "]";
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((empno == null) ? 0 : empno.hashCode());
		result = prime * result + ((feano == null) ? 0 : feano.hashCode());
		return result;
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		PermissionVO other = (PermissionVO) obj;
		if (empno == null) {
			if (other.empno != null)
				return false;
		} else if (!empno.equals(other.empno))
			return false;
		if (feano == null) {
			if (other.feano != null)
				return false;
		} else if (!feano.equals(other.feano))
			return false;
		return true;
	}
	
	
}
