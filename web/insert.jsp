<%-- 
    Document   : insert
    Created on : Mar 10, 2022, 9:42:05 PM
    Author     : ASUS
--%>


<%@page import="sample.shopping.ProductError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Page</title>
    </head>
    <body>
        <h1>Insert New Product</h1>
        <%
            ProductError productError = (ProductError) request.getAttribute("PRODUCT_ERROR");
            if (productError == null) {
                productError = new ProductError();
            }
        %>
        <form action="MainController" method="POST">
            Product ID<input type="text" name="productID" required=""/>
            <%= productError.getProductIDError()%></br>
            Product Name<input type="text" name="productName" required=""/>
            <%= productError.getProductNameError()%></br>
            Image<input type="text" name="image" required=""/>
            <%= productError.getImageError() %></br>
            Price<input type="number" name="price" required="" min="1"/></br>
            Quantity<input type="number" name="quantity" required="" min="0"/></br>
            Category ID<input type="text" name="categoryID" required=""/>
            <%= productError.getCategoryIDError()%></br>
            Import Date<input type="date" name="importDate" required=""/></br>
            Using Date<input type="date" name="usingDate" required=""/></br>
            <input type="submit" name="action" value="Insert"/>
            <input type="reset" value="Reset"/>

        </form>
        <%
            String message = (String) request.getAttribute("MESSAGE");
            if (message == null) {
                message = "";
            }
        %>
        <h1><%= message%></h1>
        <a href="MainController?action=Search Product&search=">Admin Page</a>
    </body>
</html>
