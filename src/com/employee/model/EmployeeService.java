package com.employee.model;

import java.sql.Connection;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.permission.model.PermissionVO;

public class EmployeeService {
	private EmployeeDAO_interface dao;
	
	//同時新增員工與權限使用
//	private static DataSource ds = null;
//	static {
//		try {
//			Context ctx = new InitialContext();
//			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB3");
//		} catch (NamingException e) {
//			e.printStackTrace();
//		}
//	}
	//////////////////

	public EmployeeService() {
		dao = new EmployeeDAO();
	}
	
	public EmployeeVO addEmployee(String eAccount,String ePw,String eName,
			String ePhone,String eEmail,byte[] ePic, String eTitle,Integer eStatus) {
		
		EmployeeVO empVO = new EmployeeVO();
		
		empVO.seteAccount(eAccount);
		empVO.setePw(ePw);
		empVO.seteName(eName);
		empVO.setePhone(ePhone);
		empVO.seteEmail(eEmail);
		empVO.setePic(ePic);
		empVO.seteTitle(eTitle);
		empVO.seteStatus(eStatus);
		dao.insert(empVO);
		
		return empVO;
	}
	
	public void updateEmployee(String eAccount,String ePw,
			String eName,String ePhone,String eEmail,byte[] ePic,String eTitle,Integer eStatus,String empno) {
		
		EmployeeVO empVO = new EmployeeVO();
		
			empVO.seteAccount(eAccount);
			empVO.setePw(ePw);
			empVO.seteName(eName);
			empVO.setePhone(ePhone);
			empVO.seteEmail(eEmail);
			empVO.setePic(ePic);
			empVO.seteTitle(eTitle);
			empVO.seteStatus(eStatus);
			empVO.setEmpno(empno);
			dao.update(empVO);
			
//		return empVO;
	}
	
	public void deleteEmployee(String empno) {
		dao.delete(empno);
	}
	
	public EmployeeVO getOneEmployee(String empno) {
		return dao.findByPrimaryKey(empno);
	}
	
	public List<EmployeeVO> getAll(){
		return dao.getAll();
	}

	public EmployeeVO getOneBy_eAccount_ePw(String eAccount, String ePw) {
		return dao.findBy_eAccount_ePw(eAccount, ePw);
	}
	
	public EmployeeVO addEmployeeWithPermission(String eAccount,String ePw,String eName,
			String ePhone,String eEmail,byte[] ePic, String eTitle,Integer eStatus,List<PermissionVO> list) {
//		Connection con = null;
		
		EmployeeVO empVO = new EmployeeVO();
		
		empVO.seteAccount(eAccount);
		empVO.setePw(ePw);
		empVO.seteName(eName);
		empVO.setePhone(ePhone);
		empVO.seteEmail(eEmail);
		empVO.setePic(ePic);
		empVO.seteTitle(eTitle);
		empVO.seteStatus(eStatus);
		
		dao.insertWithPermission(empVO, list);
		
//		dao.insert2(empVO,list);
		
		
		return empVO;
	}
	
}
