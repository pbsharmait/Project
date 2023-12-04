<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.bean.Product"%>
<%@page import="com.dao.ProductDao"%>

        <%@ include file="seller-header.jsp" %>
    
<!DOCTYPE html>
<html lang="en">
   <head>
     
   </head>
   <!-- body -->
   <body>
     
      <!-- end loader -->
      <!-- header -->
      
      <!-- end header -->
      <!--  contact -->
      <div class="contact">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="titlepage">
                     <h2>Edit Product</h2>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-10 offset-md-1">
               <p style="color : white;">
               <%
               Product p=ProductDao.getProduct(Integer.parseInt(request.getParameter("pid")));
               if(request.getAttribute("msg")!=null)
               {
            	   out.println(request.getAttribute("msg"));
               }
            	   
               %>
               </p>
                  <form id="request" class="main_form" method="post" action="ProductController" enctype="multipart/-form-data">
                  
                     <div class="row">
                     
                     <input type="hidden" name="pid" value="<%=p.getPid()%>">
                        <div class="col-md-12 ">
                           <input class="contactus" value="<%=p.getProduct_name() %>" type="text" name="product_name"> 
                        </div>
                        <div class="col-md-12 ">
                           <input class="contactus" value="<%=p.getProduct_price() %>" type="text" name="product_price"> 
                        </div>
                        <div class="col-md-12">
                           <input class="contactus" value="<%=p.getProduct_stock() %>" type="text" name="product_stock"> 
                        </div>
                        <div class="col-md-12">
                           <textarea class="textarea" name="product_desc<%=p.getProduct_desc() %>" name="product_desc"></textarea>
                        </div>
                        <div class="col-md-12">
                        <img src="product_image/<%=p.getProduct_image()%> width=200px" height="200px"/>
                        </div>
                        <div class="col-md-12">
                           <button class="send_btn" type="submit" name="action" value="Update Product">Update Product</button>
                        </div>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
      <!-- end contact -->
      <!--  footer -->
      <footer>
         <div class="footer">
            <div class="container">
               <div class="row">
                  <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                     <img class="logo1" src="images/logo1.png" alt="#"/>
                     <ul class="social_icon">
                        <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-linkedin-square" aria-hidden="true"></i></a></li>
                        <li><a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                     </ul>
                  </div>
                  <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                     <h3>About Us</h3>
                     <ul class="about_us">
                        <li>dolor sit amet, consectetur<br> magna aliqua. Ut enim ad <br>minim veniam, <br> quisdotempor incididunt r</li>
                     </ul>
                  </div>
                  <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                     <h3>Contact Us</h3>
                     <ul class="conta">
                        <li>dolor sit amet,<br> consectetur <br>magna aliqua.<br> quisdotempor <br>incididunt ut e </li>
                     </ul>
                  </div>
                  <div class="col-xl-3 col-lg-3 col-md-6 col-sm-6">
                     <form class="bottom_form">
                        <h3>Newsletter</h3>
                        <input class="enter" placeholder="Enter your email" type="text" name="Enter your email">
                        <button class="sub_btn">subscribe</button>
                     </form>
                  </div>
               </div>
            </div>
            <div class="copyright">
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <p>© 2019 All Rights Reserved. Design by<a href="https://html.design/"> Free Html Templates</a></p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </footer>
      <!-- end footer -->
      <!-- Javascript files-->
      <script src="js/jquery.min.js"></script>
      <script src="js/popper.min.js"></script>
      <script src="js/bootstrap.bundle.min.js"></script>
      <script src="js/jquery-3.0.0.min.js"></script>
      <!-- sidebar -->
      <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="js/custom.js"></script>
   </body>
</html>

    