package com.employee.controller;

import java.io.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import javax.sql.DataSource;

import com.employee.model.*;
import com.features.model.FeaturesService;
import com.features.model.FeaturesVO;
import com.permission.model.PermissionService;
import com.permission.model.PermissionVO;

import mail.server.MailService;


@MultipartConfig
public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		//已開filter，測試
		//		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) {

			List<String> errorMsgs = new LinkedList<>();

			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********1.接收請求請求參數，輸入格式的錯誤處理********/
				String empno = req.getParameter("empno");
				String empnoReg = "^E\\d{7}";
				if (empno == null || (empno.trim()).length() == 0) {
					errorMsgs.add("請輸入員工編號");
				}else if(!empno.trim().matches(empnoReg)) {
					errorMsgs.add("員工帳號格式不正確，EX：E0000001");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/employee/select_page_employee.jsp");
					failureView.forward(req, res);
					return;
				}

				/*********2.開始資料查詢*********/
				EmployeeService empSvc = new EmployeeService();
				EmployeeVO empVO = empSvc.getOneEmployee(empno);
				if(empVO == null) {
					errorMsgs.add("查無資料");
				}
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/employee/select_page_employee.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/*********3.查詢完成，準備轉交*************/
				req.setAttribute("employeeVO", empVO);
				String url = "/back-end/employee/listOneEmployee.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				/*********可能的錯誤處理**********/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failDispatcher = req.getRequestDispatcher("/back-end/employee/select_page_employee.jsp");
				failDispatcher.forward(req, res);
			}
		}

		// 來自listAllEmployee.jsp的請求
		// 來自listOneEmployee.jsp的請求
		if("getOne_For_Update".equals(action)) {
			List<String> errorMsgs = new LinkedList<>();

			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/********1.receive parameter*******/
				String empno = req.getParameter("empno");
				////////非必要
				String empnoReg = "[E](0-9){7}";
				if(empno ==null || empno.trim().length() ==0) {
					errorMsgs.add("員工帳號：請勿空白");
				}else if(!empno.trim().matches(empnoReg)) {
					errorMsgs.add("員工帳號：格式不正確，EX：E0000001");
				}
				
				/********2.Inquire data************/
				EmployeeService empSvc = new EmployeeService();
				EmployeeVO empVO = empSvc.getOneEmployee(empno);
				
				/********3.Inquire finished send data************/
				req.setAttribute("employeeVO", empVO);
				String url = "/back-end/employee/update_employee_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/********Other failure process(其他錯誤處理)*******/
			}catch(Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/employee/update_employee_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		// 來自update_employee_input.jsp的請求
		if("update".equals(action)) { 
			List<String> errorMsgs = new LinkedList<>();
			// Store this set in the request scope, in case we need to send the ErrorPage view.
			
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*********1.receive request parameter ,input type failure process****/
				String empno = req.getParameter("empno");
				
				String eAccount = req.getParameter("eAccount");
				
				//password verify
				String ePw = req.getParameter("ePw");
				String ePwReg = "^[(a-zA-Z0-9)]{1,10}$";
				if(ePw == null || ePw.trim().length() == 0) {
					errorMsgs.add("員工密碼: 請勿空白");
				}else if(!ePw.trim().matches(ePwReg)) {
					errorMsgs.add("員工密碼: 只能是英文大小寫或數字，長度1~10位");
				}
				
				//employee name verify
				String eName = req.getParameter("eName");
				String eNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if(eName == null || eName.trim().length() == 0) {
					errorMsgs.add("員工姓名: 請勿空白");
				}else if(!eName.trim().matches(eNameReg)) {
					errorMsgs.add("員工姓名: 只能是中英文字母、數字和_，長度2~10位");
				}
				
				//ePhone verify
				String ePhone = req.getParameter("ePhone");
				String ePhoneReg = "^[(0-9)]{9,10}$";
				if(ePhone == null || ePhone.trim().length() == 0) {
					errorMsgs.add("員工電話: 請勿空白");
				}else if(!ePhone.trim().matches(ePhoneReg)) {
					errorMsgs.add("員工電話: 只能是數字0~9，長度9~10位");
				}
				
				//email verify
				String eEmail = req.getParameter("eEmail");
				String eEmailReg = "^[\\w_-]+@(.[\\w_-]+)+$";
				if(eEmail == null || eEmail.trim().length() == 0) {
					errorMsgs.add("員工EMAIL: 請勿空白");
				}else if(!eEmail.trim().matches(eEmailReg)) {
					errorMsgs.add("員工EMAIL: 請依格式輸入 ex:AAA@company.com");
				}
				
				//ePic verify
				byte[] ePic;
				Part ePicPart = req.getPart("ePic");
				InputStream in = ePicPart.getInputStream();
				//use default ePic
				if(in.available() == 0) {
					EmployeeService empSvc = new EmployeeService();
					ePic = empSvc.getOneEmployee(empno).getePic();
//					System.out.println("員工圖片未更新");
				}else {
					//use new ePic
					ePic = new byte[in.available()];
					in.read(ePic);
				}
				in.close();
				
				//eTitle verify，已做下拉式選單
				String eTitle = req.getParameter("eTitle").trim();
				if(eTitle == null || eTitle.trim().length() == 0) {
					errorMsgs.add("員工職位: 請勿空白");
				}
				
				//eStatus verify，已做下拉式選單
				Integer eStatus = null;
				try {
					eStatus = new Integer(req.getParameter("eStatus").trim());
				}catch(Exception e) {
					eStatus = 0;
					errorMsgs.add("員工狀態: 請選擇");
				}
				

//未完成////////////////////////////////////////////////////////////////////////
				//權限增加
				//未勾選的權限直接刪除(先清空再刪除?)
				String[] feanoArr = req.getParameterValues("feano");
				
				List<PermissionVO> perVOlist = new ArrayList<>();
				try {
					if(feanoArr != null) {
						System.out.println("feanoArr: " + Arrays.toString(feanoArr));
						
						//權限加入set
						for(String perArr:feanoArr) {
							PermissionVO perVO = new PermissionVO();
							perVO.setEmpno(empno);
							perVO.setFeano(perArr);
							
							perVOlist.add(perVO);
						}
					}
//					else if(feanoArr == null ) {
//						System.out.println("feanoArr: " + Arrays.toString(feanoArr));
////未完成
////						for(String perArr: feanoArr) {
////							
////						}
//					}
				}catch (NullPointerException npe){
					System.out.println("權限未新增" + npe.getMessage());
//					errorMsgs.add(npe.getMessage());
				}
				System.out.println("perVOset size: " + perVOlist.size());
//以上未完成/////////////////////////////////////////////////////////////////////
				
				EmployeeVO empVO = new EmployeeVO();
				empVO.setEmpno(empno);
				empVO.seteAccount(eAccount);
				empVO.setePw(ePw);
				empVO.seteName(eName);
				empVO.setePhone(ePhone);
				empVO.seteEmail(eEmail);
				empVO.setePic(ePic);
				empVO.seteTitle(eTitle);
				
				//send the use back to the form, if there were errors
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("employeeVO", empVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/employee/update_employee_input.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***********2.開始修改資料***********/
//以下未完成，先刪除權限再新增//////////////////////////////////////////////////
//2.1權限修改
				//比對所有功能
				FeaturesService feaSvc = new FeaturesService();
				List<FeaturesVO> feaVOlist = feaSvc.getAll();
				int i = 0;
				
				PermissionService perSvc = new PermissionService();
//				
				for(PermissionVO perVO: perVOlist) {
					
					try {
//					功能物件的feano比對權限物件的feano
//					perSvc.deletePermission(empno, feaVOlist.get(i).getFeano());
					perSvc.addPermission(empno, perVO.getFeano());
//					String feanolist = feaVOlist.get(i).getFeano();
//					System.out.println("feanolist: " + feanolist);
//					String feano = perVO.getFeano();
//					System.out.println("feano: " + feano);
//					if(feanolist == feano) {
//						perSvc.addPermission(empno, feano);
//					}
//					else {
//						//刪除權限
//						perSvc.deletePermission(empno, feanolist);
//					}
					i++;
					}catch(Exception e) {
						System.out.println(e.getMessage());
					}
					
				}
//以上未完成//////////////////////////////////////////////////
				
				//2.2員工資料修改
				EmployeeService empSvc = new EmployeeService();
				empSvc.updateEmployee(eAccount, ePw, eName, ePhone, eEmail, ePic, eTitle, eStatus,empno);
				System.out.println("一筆員工基本資料修改成功");
				/***********3.修改完成*************/
				req.setAttribute("employeeVO", empVO);
				req.setAttribute("perVOlist", perVOlist);
				String url = "/back-end/employee/listOneEmployee.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				System.out.println("轉交成功");
				
				/***********其他可能的錯誤處理***************/
			}catch(Exception e) {
				errorMsgs.add("修改資料失敗: " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/employee/update_employee_input.jsp");
				failureView.forward(req, res);
			}
		}
		
		// 來自addEmployee.jsp的請求
		if("insert".equals(action)) {   
			List<String> errorMsgs = new LinkedList<>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*********1.receive request parameter ,input type failure process****/
				
				//account verify
				String eAccount = req.getParameter("eAccount");
				String eAccountReg = "^[\\w]{1,10}$";
				if(eAccount == null || eAccount.trim().length() == 0) {
					errorMsgs.add("員工帳號: 請勿空白");
				}else if(!eAccount.trim().matches(eAccountReg)) {
					errorMsgs.add("員工帳號: 只能是英文大小寫或數字，長度1~10位");
				}
				
				//password verify
				//back-end員工新增，密碼自動生成
//				String ePw = req.getParameter("ePw");
				String ePw = UUID.randomUUID().toString().substring(0, 8);
//				String ePwReg = "[\\w]{1,10}";
//				if(ePw == null || ePw.trim().length() == 0) {
//					errorMsgs.add("員工密碼: 請勿空白");
//				}else if(!ePw.trim().matches(ePwReg)) {
//					errorMsgs.add("員工密碼: 只能是英文大小寫或數字，長度1~10位");
//				}
				
				//employee name verify
				String eName = req.getParameter("eName");
				String eNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if(eName == null || eName.trim().length() == 0) {
					errorMsgs.add("員工姓名: 請勿空白");
				}else if(!eName.trim().matches(eNameReg)) {
					errorMsgs.add("員工姓名: 只能是中英文字母、數字和_，長度2~10位");
				}
				System.out.println("eName: " + eName);
				
				//phone verify
				String ePhone = req.getParameter("ePhone");
				String ePhoneReg = "^[0-9]{9,10}$";
				if(ePhone == null || ePhone.trim().length() == 0) {
					errorMsgs.add("員工電話: 請勿空白");
				}else if(!ePhone.trim().matches(ePhoneReg)) {
					errorMsgs.add("員工電話: 只能是數字0~9，長度9~10位");
				}
				
				//email verify
				String eEmail = req.getParameter("eEmail");
				String eEmailReg = "^[\\w_-]+@(.[\\w_-]+)+$";
				if(eEmail == null || eEmail.trim().length() == 0) {
					errorMsgs.add("員工EMAIL: 請勿空白");
				}else if(!eEmail.trim().matches(eEmailReg)) {
					errorMsgs.add("員工EMAIL: 請依格式輸入 ex:AAA@company.com");
				}
				
				//picture verify
				byte[] ePicArr;
				Part ePicPart = req.getPart("ePic");
				InputStream in = ePicPart.getInputStream();
				ePicArr = new byte[in.available()];
				if(in.available() == 0){
					//沒有給他預設圖片
					in = getServletContext().getResourceAsStream("/images/user-circle.png");
					ePicArr = new byte[in.available()];
					System.out.println("上傳預設圖片");
//					errorMsgs.add("請上傳圖片");
				}
				in.read(ePicArr);
				in.close();
				
				//employee title verify
				String eTitle = req.getParameter("eTitle");
				if(eTitle == null || eTitle.trim().length() == 0) {
					errorMsgs.add("員工職位: 請勿空白");
				}
				
				//employee status verify(??問題)
				Integer eStatus = null;
				try {
					eStatus = new Integer(req.getParameter("eStatus").trim());
				}catch(Exception e) {
					eStatus = 0;
					errorMsgs.add("員工狀態: 請選擇");
				}
				
//權限增加
//未完成
				String[] features = req.getParameterValues("features");
				System.out.println(Arrays.toString(features));
				
				PermissionVO perVO = new PermissionVO();
				
				
				//權限
//				for(String feaArr:features) {
////					perVO.setEmpno(empno);
////					perVO.setFeano(feano);
//					PermissionService perSvc = new PermissionService();
////					perVO = perSvc.addPermission(empno, feano);
//				}
//				System.out.println("權限新增成功");

				
				EmployeeVO empVO = new EmployeeVO();
				empVO.seteAccount(eAccount);
				empVO.setePw(ePw);
				empVO.seteName(eName);
				empVO.setePhone(ePhone);
				empVO.seteEmail(eEmail);
				empVO.setePic(ePicArr);
				empVO.seteTitle(eTitle);
				empVO.seteStatus(eStatus);
				
				//send the use back to the form, if there were errors
				if(!errorMsgs.isEmpty()) {
					req.setAttribute("employeeVO", empVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/employee/addEmployee.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/**********2.開始新增資料***************/
				EmployeeService empSvc = new EmployeeService();
empVO = empSvc.addEmployee(eAccount, ePw, eName, ePhone, eEmail, ePicArr, eTitle, eStatus);
				System.out.println("一筆資料新增成功");
				
				/**********2.1寄送密碼給新使用者*********/
				//寄送郵件給新使用者
//				String passRandom = UUID.randomUUID().toString().substring(0, 8);
				String messageText = "Hello! " + eName + " 請謹記此密碼: " + ePw + "\n" +" (已經啟用)"; 
				MailService mailService = new MailService();
				mailService.sendMail(eEmail, "密碼通知", messageText);
				
				/**********3.新增完成，準備轉交**********/
				String url = "/back-end/employee/listAllEmployee.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/**********其他可能的錯誤處理************/
			}catch(Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/employee/addEmployee.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		//不會用到
		if("delete".equals(action)) { //來自listAllEmployee.jsp
			
			List<String> errorMsgs = new LinkedList<>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/*************1.receive Parameter***************/
				
				String empno = req.getParameter("empno").toUpperCase();
				String empnoReg = "^E\\d{7}";
				if(empno ==null || empno.trim().length() ==0) {
					
				}else if(!empno.trim().matches(empnoReg)) {
					errorMsgs.add("員工帳號格式不正確，EX：E0000001");
				}
				
				/*************2.delete data*********************/
				EmployeeService empSvc = new EmployeeService();

empSvc.deleteEmployee(empno);
				
				/*************3.delete finish, send success view***/
String url = "/back-end/employee/listAllEmployee.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
				/*************其他可能的錯誤處理*****************/
				
			}catch(Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
RequestDispatcher failureView = req.getRequestDispatcher("/back-end/employee/listAllEmployee.jsp");
				failureView.forward(req, res);
			}
			
			
		}
		
	}

}
