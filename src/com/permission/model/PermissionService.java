package com.permission.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PermissionService {
	private PermissionDAO_interface dao;
	
	//同步新增使用
	private static DataSource ds = null;
	
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/TestDB3");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	//end

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
	
	//未完成
	public PermissionVO addPermission2(String empno, String feano,Connection con) {
		PermissionVO perVO = new PermissionVO();
		try {
			con = ds.getConnection();
			
		
			perVO.setEmpno(empno);
			perVO.setFeano(feano);
			dao.insert2(perVO, con);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return perVO;
	}
}
