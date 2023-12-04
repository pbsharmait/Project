<%@page import="com.dao.ProductDao"%>
<%
	int pid=Integer.parseInt(request.getParameter("pid"));
	ProductDao.deleteProduct(pid);
	request.setAttribute("msg", "Product Deleted Successfully");
	request.getRequestDispatcher("seller-view-product.jsp").forward(request, response);
%>