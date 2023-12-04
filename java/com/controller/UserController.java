package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Random;

import com.bean.Cart;
import com.bean.User;
import com.bean.Wishlist;
import com.dao.CartDao;
import com.dao.UserDao;
import com.dao.WishlistDao;
import com.Services.*;


public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("action");
		
		if(action.equalsIgnoreCase("sign up"))
		{
			boolean flag=UserDao.checkLogin(request.getParameter("email"));
			if(flag==false)
			{
				if(request.getParameter("password").equals(request.getParameter("cpassword")))
				{
					User u=new User();
					u.setFname(request.getParameter("fname"));
					u.setLname(request.getParameter("lname"));
					u.setEmail(request.getParameter("email"));
					u.setMobile(request.getParameter("mobile"));
					u.setAddress(request.getParameter("address"));
					u.setPassword(request.getParameter("password"));
					u.setUsertype(request.getParameter("usertype"));
					UserDao.signupUser(u);
					request.setAttribute("msg", "User Sign Up Successfully");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
				else
				{
					request.setAttribute("msg", "Password & Confirm Password Does Not Matched");
					request.getRequestDispatcher("signup.jsp").forward(request, response);
				}
			}
			else
			{
				request.setAttribute("msg", "Email Already Registered");
				request.getRequestDispatcher("signup.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("login"))
		{
			User u=UserDao.loginUser(request.getParameter("email"));
			
			if(u!=null)
			{
				if(u.getPassword().equals(request.getParameter("password")))
				{
					HttpSession session=request.getSession();
					List<Wishlist> list=WishlistDao.getWishlistByUser(u.getId());
					session.setAttribute("wishlist_count", list.size());
					List<Cart> list1=CartDao.getCartByUser(u.getId());
					session.setAttribute("cart_count", list1.size());
					session.setAttribute("u", u);
					if(u.getUsertype().equals("buyer"))
					{
						request.getRequestDispatcher("index.jsp").forward(request, response);
					}
					else
					{
						request.getRequestDispatcher("seller-index.jsp").forward(request, response);
					}
				}
				else
				{
					request.setAttribute("msg", "Incorrect Password");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
			}
			else
			{
				request.setAttribute("msg", "Email Not Registered");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("change password"))
		{
			HttpSession session=request.getSession();
			User u=(User) session.getAttribute("u");
			if(u.getPassword().equals(request.getParameter("old_password")))
			{
				if(request.getParameter("new_password").equals(request.getParameter("cnew_password")))
				{
					if(!request.getParameter("new_password").equals(u.getPassword()))
					{
						UserDao.change_password(u.getEmail(), request.getParameter("new_password"));
						response.sendRedirect("logout.jsp");
					}
					else
					{
						request.setAttribute("msg", "New Password Can't Be Your Old Password");
						if(u.getUsertype().equals("buyer"))
						{
							request.getRequestDispatcher("change-password.jsp").forward(request, response);
						}
						else
						{
							request.getRequestDispatcher("seller-change-password.jsp").forward(request, response);
						}
					}
				}
				else
				{
					request.setAttribute("msg", "New Password & Confirm New Password Does Not Matched");
					if(u.getUsertype().equals("buyer"))
					{
						request.getRequestDispatcher("change-password.jsp").forward(request, response);
					}
					else
					{
						request.getRequestDispatcher("seller-change-password.jsp").forward(request, response);
					}
				}
			}
			else
			{
				request.setAttribute("msg", "Old Password Does Not Matched");
				if(u.getUsertype().equals("buyer"))
				{
					request.getRequestDispatcher("change-password.jsp").forward(request, response);
				}
				else
				{
					request.getRequestDispatcher("seller-change-password.jsp").forward(request, response);
				}
			}
			
		}
		else if(action.equalsIgnoreCase("update profile"))
		{
			HttpSession session=request.getSession();
			User u=(User) session.getAttribute("u");
			u.setFname(request.getParameter("fname"));
			u.setLname(request.getParameter("lname"));
			u.setMobile(request.getParameter("mobile"));
			u.setAddress(request.getParameter("address"));
			UserDao.updateProfile(u);
			request.setAttribute("msg", "Profile Update Successfully");
			if(u.getUsertype().equals("buyer"))
			{
				request.getRequestDispatcher("profile.jsp").forward(request, response);
			}
			else
			{
				request.getRequestDispatcher("seller-profile.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("send otp"))
		{
			boolean flag=UserDao.checkLogin(request.getParameter("email"));
			
			if(flag==true)
			{
				Random t = new Random();
		    	int minRange = 1000, maxRange= 9999;
	        	int otp = t.nextInt(maxRange - minRange) + minRange;
	        	Services.sendMail(request.getParameter("email"), otp);
	        	request.setAttribute("email", request.getParameter("email"));
	        	request.setAttribute("otp", otp);
	        	request.getRequestDispatcher("otp.jsp").forward(request, response);
			}
			else
			{
				request.setAttribute("msg", "Email Not Registered");
				request.getRequestDispatcher("forgot-password.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("verify otp"))
		{
			String email=request.getParameter("email");
			int otp=Integer.parseInt(request.getParameter("otp"));
			int uotp=Integer.parseInt(request.getParameter("uotp"));
			
			if(otp==uotp)
			{
				request.setAttribute("email", email);
				request.getRequestDispatcher("new-password.jsp").forward(request, response);
			}
			else
			{	
				request.setAttribute("msg", "Invalid OTP");
				request.setAttribute("email", email);
	        	request.setAttribute("otp", otp);
	        	request.getRequestDispatcher("otp.jsp").forward(request, response);
			}
		}
		else if(action.equalsIgnoreCase("update password"))
		{
			String email=request.getParameter("email");
			String np=request.getParameter("new_password");
			String cnp=request.getParameter("cnew_password");
			if(np.equals(cnp)) {
				UserDao.change_password(email, np);
				response.sendRedirect("login.jsp");
			}
			else {
				request.setAttribute("msg", "New Password & Confirm New Password Does Not Matched");
				request.setAttribute("email", email);
				request.getRequestDispatcher("new-password.jsp").forward(request, response);
			}
		}
	}

}