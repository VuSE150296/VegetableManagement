<%-- 
    Document   : admin
    Created on : Mar 7, 2022, 3:06:29 PM
    Author     : Admin
--%>
<%@page import="sample.shopping.ProductDTO"%>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <body>
        <%
            UserDTO loginUser = (UserDTO) session.getAttribute("LOGIN_USER");
            if (loginUser == null || !loginUser.getRoleID().equals("AD")) {
                response.sendRedirect("login.jsp");
                return;
            }


        %>
        <h1>Welcome: <%= loginUser.getFullName()%></h1>

        <form action="MainController" method="POST">
            <input type="submit" name="action" value="Logout" />
        </form>
        <%
            String search = request.getParameter("search");
            if (search == null) {
                search = "";
            }
        %>

        <form action="MainController">
            Search<input type="text" name="search" required="" value="<%=search%>"/>
            <input type="submit" name="action" value="Search Product"/>
        </form>

            <form action="MainController" method="POST">
                 <input type="submit" name="action" value="Insert" />
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
                    <th>Delete</th>
                    <th>Update</th>

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
                        <input style="text-align: center"type="text" name="productID" value="<%= vegetable.getProductID()%>" required="" readonly=""/>
                    </td>
                    <td>
                        <input style="text-align: center" type="text" name="productName" value="<%= vegetable.getProductName()%>" required=""/>
                    </td>
                    <td><img src="<%= vegetable.getImage()%>" style="width:60px;height:60px;" readonly=""/></td>
                    <td>
                        <input style="text-align: center" type="number" name="price" value="<%= vegetable.getPrice()%>" required=""/>
                    </td>
                    <td>
                        <input style="text-align: center" type="number" name="quantity" value="<%= vegetable.getQuantity()%>" required=""/>
                    </td>
                    <td>
                        <input style="text-align: center" type="text" name="categoryID" value="<%= vegetable.getCategoryID()%>" required=""/>
                    </td>
                    <td>
                        <input style="text-align: center" type="date" name="importDate" value="<%= vegetable.getImportDate()%>" required=""/>
                    </td>
                    <td>
                        <input style="text-align: center" type="date" name="usingDate" value="<%= vegetable.getUsingDate()%>" required=""/>
                    </td>
                    <td>
                        <input type="submit" name="action" value="Delete"/>
                        <input type="hidden" name="search" value="<%= search%>"
                    </td>
                    <td>
                        <input type="submit" name="action" value="Update"/>
                        <input type="hidden" name="search" value="<%= search%>"
                    </td>




                </tr>
            </form>


            <%
                }
            %>


        </tbody>
    </table>

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
