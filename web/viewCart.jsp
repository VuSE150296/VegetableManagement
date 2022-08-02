<%-- 
    Document   : viewCart
    Created on : Feb 27, 2022, 7:52:11 PM
    Author     : ASUS
--%>

<%@page import="sample.user.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.shopping.ProductDTO"%>
<%@page import="sample.shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Vegetable Shop</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            Cart cart = (Cart) session.getAttribute("CART");
            if (cart == null) {
        %>
        <h1>Ban chua chon san pham nao!</h1>>
        <%
        } else {
        %>
        <table border="1">
            <thead>
                <tr>
                    <th>No</th>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total</th>
                    <th>Remove</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <tbody>

                <%
                    int count = 1;
                    double total = 0;
                    for (ProductDTO vegetable : cart.getCart().values()) {
                        total += vegetable.getPrice() * vegetable.getQuantity();
                %>
            <form action="MainController" method="POST">
                <tr>
                <input type="hidden" name="userID" value="<%= loginUser.getUserID()%>"/>
                <td><%= count++%></td>
                <td>
                    <input type="text" name="productID" value="<%= vegetable.getProductID()%>" readonly=""/>
                </td>
                <td><input type="text" name="productName" value="<%= vegetable.getProductName()%>" readonly=""/></td>
                <td>
                    <input type="number" name="quantity" value="<%= vegetable.getQuantity()%>"/>
                </td>
                <td><input type="text" name="price" value="<%= vegetable.getPrice()%>" readonly=""/></td>
                <td><input type="text" name="total_product" value="<%= vegetable.getPrice() * vegetable.getQuantity()%>" readonly=""/></td>
                <td>
                    <input type="submit" name="action" value="Remove"/>
                </td>
                <td>
                    <input type="submit" name="action" value="Edit"/>
                </td>
                </tr>

                <%
                    }
                %>
                <input type="hidden" name="total" value="<%= total%>"/>
                <td><input type="submit" name="action" value="Check out"/></td>

            </form>
        </tbody>
    </table>
    <h1>Total: <%= total%></h1>
    <%
        }
    %>
    <a href="MainController?action=Search&search=">Add more</a>
</body>
</html>
