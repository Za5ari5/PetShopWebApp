<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Pet Shop</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link rel="stylesheet" type="text/css" href="css/lightbox.css" />


</head>
<body style="background-color: #5B5F53;">
<div id="wrap " style="background-color: #5B5F53;">

       <div class="header">
       		<div class="logo"><a href="/PetShopWebApp/HomePage"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>            
        <div id="menu">
            <ul>                                                                       
            <li class="selected"><a href="/PetShopWebApp/HomePage">home</a></li>
            <li><a href="/PetShopWebApp/About">about us</a></li>
            <li><a href="/PetShopWebApp/Category">pets</a></li>
            <li><a href="/PetShopWebApp/Specials">specials pets</a></li>
            <li><a href="/PetShopWebApp/MyAccount">my accout</a></li>
            <%if(auth == null) {%>
            <li><a href="/PetShopWebApp/Register">register</a></li>
            <%}else if(auth != null) {%>
            <li><a href="/PetShopWebApp/Cart">cart</a></li>
            <li><a href="/PetShopWebApp/LogOut">logout</a></li>
            <%}%>
            </ul>
        </div>     
            
            
       </div> 