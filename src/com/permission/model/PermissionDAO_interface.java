package com.permission.model;

import java.util.List;

public interface PermissionDAO_interface {
	public void insert(PermissionVO permissionVO);
	public void delete(String empno,String feano);
	public PermissionVO findByPrimaryKey(String empno);
	public List<PermissionVO> getAll();
	
	//同時新增permission 與 employee
	public void insert2(PermissionVO PermissionVO, java.sql.Connection con);
}
