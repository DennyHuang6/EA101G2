package com.employee.model;

import java.util.List;

import com.permission.model.PermissionVO;

public class EmployeeService {
	private EmployeeDAO_interface dao;

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
		
		EmployeeVO empVO = new EmployeeVO();
		empVO.seteAccount(eAccount);
		empVO.setePw(ePw);
		empVO.seteName(eName);
		empVO.setePhone(ePhone);
		empVO.seteEmail(eEmail);
		empVO.setePic(ePic);
		empVO.seteTitle(eTitle);
		empVO.seteStatus(eStatus);
		
//		dao.insert2(empVO,list);
		
		
		return empVO;
	}
	
}
