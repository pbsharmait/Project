package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.awt.Desktop.Action;
import java.io.IOException;

import com.bean.Contact;
import com.dao.ContactDao;

public class ContactController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		String action=request.getParameter("action");
			
		if(action.equalsIgnoreCase("send"))		 {
				Contact c=new Contact();
				c.setName(request.getParameter("name"));
				c.setEmail(request.getParameter("email"));
				c.setMobile(request.getParameter("mobile"));
				c.setMessage(request.getParameter("message"));
				ContactDao.addContact(c);
				request.setAttribute("msg", "Contact Sent Successfully");
				request.getRequestDispatcher("contact.jsp").forward(request, response);
		}
	}

}
