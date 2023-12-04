<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dao.CartDao"%>
<%@page import="com.bean.Cart"%>
<%@page import="com.dao.WishlistDao"%>
<%@page import="com.bean.Wishlist"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="com.bean.Product"%>
<%@page import="java.util.List"%>


<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <style type="text/css">
	.bttnStyle
	{
		background-color: lightblue;
		border-radius: 0.50rem;
		border:1px solid transperent;
	}
</style>
   </head>
   <!-- body -->
   <body>
     
      <!-- products -->
      <div  class="products">
         <div class="container">
            <div class="row">
               <div class="col-md-12">
                  <div class="titlepage">
                  	<%
                  		List<Cart> list=CartDao.getCartByUser(u.getId());
                  		if(list.size()>0)
                  		{
                  	%>
                     <h2>My Cart Products</h2>
                    <%
                  		}
                  		else
                  		{
                    %>
                    <h2>No Products In Your Cart</h2>
                    <%
                  		}
                    %>
                  </div>
               </div>
            </div>
            <div class="row">
               <div class="col-md-12">
                  <div class="our_products">
                     <div class="row">
                     
                        <%
                        	int net_price=0;
                        	for(Cart c:list)
                        	{
                        		net_price=net_price+c.getTotal_price();
                        		Product p=ProductDao.getProduct(c.getPid());
                        %>
                        <div class="col-md-4 margin_bottom1">
                           <div class="product_box">
                              <figure><img src="product_images/<%=p.getProduct_image() %>" alt="#" style="width: 150px;height: 220px;"/></figure>
                              <br><br>
                              <h4>Product Price : <%=c.getProduct_price() %></h4>
                              
                              <form method="post" action="change_qty.jsp">
                              	<input type="hidden" name="cid" value="<%=c.getCid()%>">
                              	<h4>Product Qty : </h4><input type="number" min="1" max="10" name="product_qty" value="<%=c.getProduct_qty()%>" onchange="this.form.submit();">
                              </form>
                              <h4>Total Price : <%=c.getTotal_price() %></h4>
                              <a href="product-detail.jsp?pid=<%=p.getPid()%>"><h3><%=p.getProduct_name() %></h3></a>
                           </div>
                        </div>
                        <%	} %>
                        
                       
                     </div>
                     <h1>Net Price To Pay : <%=net_price %></h1>
                     <form>
						<input type="text" id="amount" name="amount" value="<%=net_price%>">
						
					</form>
                    <button id="payButton" onclick="CreateOrderID()" class="bttnStyle">Pay Now</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- end products -->

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
      <script type="text/javascript">
	var xhttp=new XMLHttpRequest();
	var RazorpayOrderId;
	function CreateOrderID()
	{
		alert("1");
		xhttp.open("GET","http://localhost:8081/MyProject/OrderCreation",false);
		xhttp.send();
		RazorpayOrderId=xhttp.responseText;
		alert("2");
		OpenCheckOut();
	}
</script>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script type="text/javascript">
	
	
	function OpenCheckOut()
	{
		alert("3");
		var amount=document.getElementById("amount").value;
		var new_amount=parseInt(amount)*100;
		alert("1");
		var options={
				"key":"rzp_test_M2570fHzxsVczK",
				"amount":new_amount,
				"currency":"INR",
				"name":name,
				"description":"Test",
				"callback_url":"http://localhost:8081/MyProject/index.jsp?id=<%=u.getId()%>",
				"prefill":{
					"name":"Jigar Thakkar",
					"email":"jigar.thakkar.tops@gmail.com",
					"contact":"9377614772"
				},
				"notes":{
					"address":"Gandhinagar"
				},
				"theme":{
					"color":"#3399cc"
				}
				
				
		};
		var rzp1=new Razorpay(options);
		rzp1.on('payment.failed',function (response){
			alert(response.error.code);
	        alert(response.error.description);
	        alert(response.error.source);
	        alert(response.error.step);
	        alert(response.error.reason);
	        alert(response.error.metadata.order_id);
	        alert(response.error.metadata.payment_id);
		});
		rzp1.open();
	    e.preventDefault();
	}
</script>
   </body>
</html>
    