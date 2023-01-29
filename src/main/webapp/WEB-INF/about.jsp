<%@page import="com.petshop.db.DbCnx"%>
<%@page import="com.petshop.dao.ProductDao"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@page import="com.petshop.model.*"%>
    <%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
    	request.setAttribute("auth", auth);
		}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}	
		%>
		
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<%@ include file = "Nav.jsp" %>

<!--end of nav Content-->

       
       
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>About us</div>
        
        	<div class="feat_prod_box_details">
            <p class="details">
            <img src="images/about.gif" alt="" title="" class="right" /> 
            Welcome to Our Pet Shop and thank you for visiting our website! We appreciate that you are curious about our company and look forward to meeting you in our store in the near future. In the meantime, please let us tell you a little bit about Our Pet Shop. <br/><br/>
Our Pet Shop is a locally owned and operated pet and pet food and supply store. Our mission is to give you mangificent pets and provide your pets with everything that they need to ensure their pet lives a long and happy life. We love to talk about pets of all types. We are constantly researching and learning about new products that can make your pets lives better.<br/><br/> 
Our goal is to provide a clean, pet friendly store that has everything that your pet needs. While our store is not very large, we offer an experience that is fast, friendly, local, and less expensive that the "Big Box" pet stores.         
            </p>
            
            
            </div>	
            
              

            

            
        <div class="clear"></div>
        </div><!--end of left content-->
        

<%@ include file = "Rightcontent.jsp" %>        
        <!--end of right content-->
       
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
              
<%@ include file = "Footer.jsp" %>
    

</div>

</body>
</html>