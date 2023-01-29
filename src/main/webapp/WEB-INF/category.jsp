<%@page import="java.util.ArrayList"%>
<%@page import="com.petshop.dao.*"%>
<%@page import="com.petshop.db.*"%>
<%@page import="com.petshop.model.*"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
           <%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
    request.setAttribute("auth", auth);
}
ProductDao pd = new ProductDao(DbCnx.getConnection());
List<Product> products = pd.getAllProducts();
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file = "Nav.jsp" %>

       
       <div class="center_content">
       	<div class="left_content">
                        	<div class="crumb_nav">
            <a href="/PetShopWebApp/HomePage">home</a> &gt;&gt; pets
            </div>
            <% 	if (!products.isEmpty()) {
				for (Product p : products) {
			%>
<div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span><%=p.getName()%></div>           
           
           
<!-- start here -->

            
        
        	<div class="feat_prod_box_details">
            
            	<div class="prod_img"><a href="details.html"><img style="width:100px;"src="images/<%=p.getImage() %>" alt="" title="" border="0" /></a>
                <br /><br />
                <a href="images/<%=p.getImage() %>" rel="lightbox"><img src="images/zoom.gif" alt="" title="" border="0" /></a>
                </div>
                
                <div class="prod_det_box">
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title">Details</div>
                    <p class="details"><%=p.getDetails() %></p>
                    <div class="price"><strong>PRICE: $<%= p.getPrice() %></strong> <span class="red">100 $</span></div>
                    <div class="price"><strong>COLORS: </strong> 
                    <span class="colors"><img src="images/color1.gif" alt="" title="" border="0" /></span>
                    <span class="colors"><img src="images/color2.gif" alt="" title="" border="0" /></span>
                    <span class="colors"><img src="images/color3.gif" alt="" title="" border="0" /></span>                    </div>
                    <a href="/PetShopWebApp/AddToCartServlet?id=<%=p.getId()%>" class="more"><img src="images/order_now.gif" alt="" title="" border="0" /></a>
                    <div class="clear"></div>
                    </div>
                    
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            </div>	 
            <%
			}
			} else {
			out.println("There is no proucts");
			}
			%>   
<!-- end here -->                                  
                    


            
          
            
        <div class="clear"></div>
        </div><!--end of left content-->
        
<%@ include file = "Rightcontent.jsp" %> <!--end of right content-->
        
        
       
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
              
<%@ include file = "Footer.jsp" %>

    

</div>

</body>
</html>