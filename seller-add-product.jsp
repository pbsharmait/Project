<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                     <h2>Add Product</h2>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-10 offset-md-1">
               <p style="color: white;">
               <%if(request.getAttribute("msg")!=null)
               {
            	   out.println(request.getAttribute("msg"));
               }
            	   
               %>
               </p>
                  <form id="request" class="main_form" method="post" action="ProductController" enctype="multipart/form-data">
                  
                     <div class="row">
                     <input type="hidden" name="uid" value="<%=u.getId()%>">
                        <div class="col-md-12 ">
                           <input class="contactus" placeholder="Product Name" type="text" name="product_name"> 
                        </div>
                        <div class="col-md-12 ">
                           <input class="contactus" placeholder="Product Price" type="text" name="product_price"> 
                        </div>
                        <div class="col-md-12">
                           <input class="contactus" placeholder="Product Stock" type="text" name="product_stock"> 
                        </div>
                        <div class="col-md-12">
                           <textarea class="textarea" placeholder="Product Description" name="product_desc"></textarea>
                        </div>
                        <div class="col-md-12">
                           <input class="contactus" type="file" name="product_image"> 
                        </div>
                        <div class="col-md-12">
                           <button class="send_btn" type="submit" name="action" value="Add Product">Add Product</button>
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

    