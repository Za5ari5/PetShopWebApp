<%@page import="com.petshop.model.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.petshop.model.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
    	request.setAttribute("auth", auth);
		}
		
		ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file = "Nav.jsp" %>
       
       
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>My account</div>
        
        	<div class="feat_prod_box_details">
        	<% if(auth != null){%>
            <p class="details">
             Welcome.
            </p>
            
            	
            	<h1>You can Logout from here.</h1>
            	<h1><a href="/PetShopWebApp/LogOut">Logout</a></h1>
            	
            <%}else{%>
                        <p class="details">
             You must Login to shop from our Website.
            </p>
                  	<div class="contact_form">
                    <div class="form_subtitle">login into your account</div>
                     <form name="register" action="/PetShopWebApp/MyAccount" method="post">          
                        <div class="form_row">
                        <label class="contact"><strong>Username:</strong></label>
                        <input type="text" class="contact_input" name="login-username" />
                        </div>  


                        <div class="form_row">
                        <label class="contact"><strong>Password:</strong></label>
                        <input type="password" class="contact_input" name="login-password" />
                        </div>                     

                        
                        <div class="form_row">
    					<button type="submit">Login</button>

                        </div>   
                        
                      </form>     
                        
                    </div>
            	<% }
            	%>
  
            
            </div>	
            
 
            
        <div class="clear"></div>
        </div><!--end of left content-->
        
<%@ include file = "Rightcontent.jsp" %> <!--end of right content-->
        
        
       
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
              
<%@ include file = "Footer.jsp" %>
    

</div>

</body>
</html>