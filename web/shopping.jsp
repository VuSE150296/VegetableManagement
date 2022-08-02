<%-- 
    Document   : shopping
    Created on : Mar 1, 2022, 9:30:12 PM
    Author     : Vu Dang
--%>

<%@page import="sample.shopping.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vegetable</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <h1>Welcome to our vegetable shop!</h1>
        <%
            List<ProductDTO> list = (List<ProductDTO>) request.getAttribute("LIST_PRODUCT");
            if (list != null) {
                if (list.size() > 0) {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                </tr>
            </thead>
            <tbody>
                <%
                    int count = 1;
                    for (ProductDTO product : list) {
                %>
            <form action="MainController">
                <tr>
                    <td><%= count++%></td>
                    <td><input type="text" name="productID" value="<%= product.getProductID()%>" readonly=""/></td>
                    <td>
                        <input type="text" name="productName" value="<%= product.getProductName()%>" readonly=""/>
                    </td>
                    <td>
                        <input type="text" name="price" value="<%= product.getPrice()%>" readonly=""/>
                    </td>
                    <td><input type="text" name="quantity" value="<%= product.getQuantity()%>" readonly=""/></td>
                    
                </tr>


            </form>
            <%
                }
            %>
        </tbody>
    </table>
    <form action="MainController">
        <input type="submit" name="action" value="View Cart"/>
    </form>
    <%
        }
        String message = (String) request.getAttribute("CHECK_OUT");
        if (message == null) {
            message = "";
        }
    %>
    <%= message%>
    <%
        }
    %>

</body>
</html>