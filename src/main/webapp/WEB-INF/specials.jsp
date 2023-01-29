<%@page import="java.util.*"%>
<%@page import="com.petshop.db.DbCnx"%>
<%@page import="com.petshop.dao.ProductDao"%>
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
	ProductDao pd = new ProductDao(DbCnx.getConnection());
	List<Product> products = pd.getSpecialProduct();
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
        	
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>Special gifts</div>
        
        
                    <% 	if (!products.isEmpty()) {
				for (Product p : products) {
			%>
        	<div class="feat_prod_box">
            
            	<div class="prod_img"><a href="details.html"><img style="width:100px;" src="images/<%=p.getImage() %>" alt="" title="" border="0" /></a></div>
                
                <div class="prod_det_box">
                	<span class="special_icon"><img src="images/special_icon.gif" alt="" title="" /></span>
                	<div class="box_top"></div>
                    <div class="box_center">
                    <div class="prod_title"><%=p.getName() %></div>
                    <p class="details"><%= p.getDetails() %></p>
                    <a href="/PetShopWebApp/Details" class="more">- more details -</a>
                    <div class="clear"></div>
                    </div>
                    
                    <div class="box_bottom"></div>
                </div>    
            <div class="clear"></div>
            </div>	
            
            <% 			}
        			} else {
        				out.println("There is no proucts");
        				}
        				%> 
 
                     
            
        <div class="clear"></div>
        </div><!--end of left content-->
        
<%@ include file = "Rightcontent.jsp" %> <!--end of right content-->
        
        
       
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
              
<%@ include file = "Footer.jsp" %>
    

</div>

</body>
</html>