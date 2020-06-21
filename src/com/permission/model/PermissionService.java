package com.permission.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PermissionService {
	private PermissionDAO_interface dao;
	
	public PermissionService() {
		dao = new PermissionDAO();
	}
	
	public void addPermission(String empno,String feano) {
		PermissionVO perVO = new PermissionVO();
		perVO.setEmpno(empno);
		perVO.setFeano(feano);
		dao.insert(perVO);
		
//		return perVO;
	}
	
	public List<PermissionVO> getAll(){
		return dao.getAll();
	}
	
	public PermissionVO getOnePermission(String empno) {
		return dao.findByPrimaryKey(empno);
	}

	public void deletePermission(String empno,String feano) {
		dao.delete(empno, feano);
	}
	
}
