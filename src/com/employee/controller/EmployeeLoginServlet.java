package com.employee.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.employee.model.EmployeeService;
import com.employee.model.EmployeeVO;

public class EmployeeLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmployeeLoginServlet() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		
		String action = req.getParameter("action");

		//btn==login
		if ("login".equals(action)) {
			List<String> errorMsgs = new LinkedList<>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				//錯誤驗證
				//eAccount verify
				String eAccount = req.getParameter("eAccount");
				String eAccountReg = "^[\\w]{1,10}$";
				if (eAccount == null || eAccount.trim().length() == 0) {
					errorMsgs.add("帳號請勿空白");
				}else if(!eAccount.trim().matches(eAccountReg)) {
					errorMsgs.add("帳號只能是只能是英文大小寫或數字，長度1~10位");
				}

				//ePw verify
				String ePw = req.getParameter("ePw");
				String ePwReg = "[\\w]{1,10}";
				if(ePw == null || ePw.trim().length() == 0) {
					errorMsgs.add("密碼請勿空白");
				}else if(!ePw.trim().matches(ePwReg)) {
					errorMsgs.add("密碼只能是英文大小寫或數字，長度1~10位");
				}
				
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backlogin.jsp");
					failureView.forward(req, res);
					return;
				}
				
				//查詢資料
				EmployeeService empSvc = new EmployeeService();
				EmployeeVO empVO = empSvc.getOneBy_eAccount_ePw(eAccount, ePw);
				
				if(empVO == null) {
					errorMsgs.add("帳號密碼錯誤");
				}
				//有錯誤forward回後台登入頁
				if(!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/backlogin.jsp");
					failureView.forward(req, res);
					return;
				}
				
				//login success
				if (empVO.geteAccount().equals(eAccount) && empVO.getePw().equals(ePw)) {
					
					HttpSession session = req.getSession();
					//1.session內做已登入過的標籤
					session.setAttribute("employeeVO", empVO);
					
					try {
						String location = (String) session.getAttribute("location");
						
						//看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
						if(location != null) {
							session.removeAttribute("location");
							res.sendRedirect(location);
							return;
						//sourcePage unknown -->至 back-end-index.jsp
						}else {
							String url = req.getContextPath() + "/back-end/back-end-index.jsp";
							res.sendRedirect(url);
						}
	
	//					successView.forward(req, res);
						System.out.println("轉交成功");
					}catch(Exception e){
						System.out.println(e.getMessage());
					}
					
				//login fail
				} else if(!(empVO.geteAccount().equals(eAccount) && empVO.getePw().equals(ePw))){
					
					// 未完成
					String url = "/backlogin.jsp";
					RequestDispatcher failView = req.getRequestDispatcher(url);
					failView.forward(req, res);
					System.out.println("帳號密碼錯誤");
				}
			} catch (Exception e) {
				e.getMessage();
			}
		}
		
		
	}

}
