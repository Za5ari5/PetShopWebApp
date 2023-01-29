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
	List<Cart> cartProduct = null;
	if (cart_list != null) {
		ProductDao pDao = new ProductDao(DbCnx.getConnection());
		cartProduct = pDao.getCartProducts(cart_list);
		request.setAttribute("cart_list", cart_list);
	}	
		
		
		%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ include file = "Nav.jsp" %>
       
       
       <div class="center_content">
       	<div class="left_content">
            <div class="title"><span class="title_icon"><img src="images/bullet1.gif" alt="" title="" /></span>My cart</div>
        
        	<div class="feat_prod_box_details">
            
            <table class="cart_table">
            	<tr class="cart_title">
                	<td>Item pic</td>
                	<td>Book name</td>
                    <td>Unit price</td>
                    <td>Quantity</td>
                    <td>Total price</td>
                    <td>Cancel</td>
                                 
                </tr>
                <%
                
                double i = 0;
				if (cartProduct != null) {
					
					for (Cart c : cartProduct) {
						i = i+ (c.getPrice()*c.getQuantity());
				%>
            	<tr>
                	<td><a href="#"><img style="width:20px;" src="images/<%=c.getImage() %>"  alt="" title="" border="0" class="cart_thumb" /></a></td>
                	<td><%= c.getName() %></td>
                    <td><%= c.getPrice() %>$</td>
                    <td><form name="quantity" action="/PetShopWebApp/QuantityServlet?pid=<%=c.getId() %>" method="post">
                    <input type="text" class="contact_input" name="quantity_number" maxlength="3" style="width: 20px;"/>
                    <h2><%= c.getQuantity() %></h2>
                    <button type="submit">Set Quantity</button>
                    
                    
                    
                    </form>
                    </td>
                    <td><%= c.getPrice()*c.getQuantity() %>$</td>
                    <td><a href="/PetShopWebApp/CancelServlet?pid=<%=c.getId() %>">Cancel</a></td>             
                </tr>          
              <%	
					}}else if(cartProduct == null){%>
					<h1>No Products YET</h1>
				<%}
				session.setAttribute("i", i);%>

                <tr>
                <td colspan="4" class="cart_total"><span class="red">TOTAL SHIPPING:</span></td>
                <td> <%= i %>$</td>                
                </tr>  
                
                <a href="/PetShopWebApp/Category" class="continue">&lt; continue</a>
            	<a href="/PetShopWebApp/CheckoutServlet" class="checkout">checkout &gt;</a>
                 
            
            </table>
            
            

             
            
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