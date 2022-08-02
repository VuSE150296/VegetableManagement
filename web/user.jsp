<%-- 
    Document   : user
    Created on : Feb 16, 2022, 8:12:09 AM
    Author     : ADMIN
--%>

<%@page import="sample.shopping.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>USER Page</title>
    </head>

    <h1>Your information:</h1>
    <%
        UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
        if (loginUser == null || !loginUser.getRoleID().equals("US")) {
            response.sendRedirect("login.jsp");
            return;
        }
    %>
    User ID: <%= loginUser.getUserID()%></br>
    Full Name: <%= loginUser.getFullName()%></br>
    Role ID: <%= loginUser.getRoleID()%></br>
    Password: <%= "***"%></br>
    <%
        String search = request.getParameter("search");
        if (search == null) {
            search = "";
        }
    %>
    <form action="MainController" method="POST">
        <input type="submit" name="action" value="Logout" />
    </form>
    <form action="MainController">
        Search<input type="text" name="search" required="" value="<%=search%>"/>
        <input type="submit" name="action" value="Search"/>
    </form>


    <form action="MainController">
        <input type="submit" name="action" value="View"/>

    </form>
    <%
        List<ProductDTO> list = (List<ProductDTO>) request.getAttribute("LIST_VEGETABLE");
        if (list != null) {
            if (list.size() > 0) {
    %>

    <table border="1">
        <thead>
            <tr>
                <th>No</th>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Image</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Category ID</th>
                <th>Import Date</th>
                <th>Using Date</th>
                <th>Quantity to add</th>
                <th>Add</th>

            </tr>
        </thead>
        <tbody>
            <%
                int count = 1;
                for (ProductDTO vegetable : list) {
            %> 
        <form action="MainController">

            <tr>

                <td><%= count++%></td>
                <td>
                    <input type="text" name="productID" value="<%= vegetable.getProductID()%>" readonly=""/>
                </td>

                <td>
                    <input type="text" name="productName" value="<%= vegetable.getProductName()%>" readonly=""/>
                </td>

                <td>
                    <img src="<%= vegetable.getImage()%>" style=“width:80px;height:80px;" readonly=""/>
                </td>

                <td>
                    <input type="text" name="price" value="<%= vegetable.getPrice()%>" readonly=""/>
                </td>

                <td>
                    <input type="text" name="quantity" value="<%= vegetable.getQuantity()%>" readonly=""/>
                </td>

                <td>
                    <input type="text" name="categoryID" value="<%= vegetable.getCategoryID()%>" readonly=""/>
                </td>

                <td>
                    <input type="text" name="importDate" value="<%= vegetable.getImportDate()%>" readonly=""/>
                </td>

                <td>
                    <input type="text" name="usingDate" value="<%= vegetable.getUsingDate()%>" readonly=""/>
                </td> 
                <td>
                    <input type="number" name="quantity_add" value="1"/></td>

                <td>
                    
                    <input type="submit" name="action" value="Add"/>
                   
                   
                </td>



            </tr>
        </form>


        <%
            }
        %>


    </tbody>
</table>
<%
        String message = (String) request.getAttribute("SHOPPING_MESSAGE");
        if (message == null) {
            message = "";
        }
    %>
    <%= message%>
    <%
        String messageCheckOut = (String) request.getAttribute("CHECK_OUT");
        if (messageCheckOut == null) {
            messageCheckOut = "";
        }
    %>
    <%= messageCheckOut%>
<%
    String error = (String) request.getAttribute("ERROR");
    if (error == null) {
        error = "";
    }
%>
<%= error%>


<%
        }
    }
%>
</body>
</html>
