<%@ page import="java.sql.ResultSet" %>
<%@ page import="org.example.workshop01.DAOs.ProductDAO" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<%
    if (request.getParameter("btnDelete") != null) {
        String id = request.getParameter("txtProID");
        ProductDAO dao = new ProductDAO();
        dao.deleteProduct(id);
    }
%>
<nav class="navbar navbar-dark bg-dark py-0">
    <div class="container-fluid justify-content-start">
        <a href="index.jsp" class="navbar-brand">PRJ301</a>
        <ul class="navbar-nav px-2 py-1" style="background-color: black">
            <li class="nav-item">
                <a href="index.jsp" class="nav-link active" aria-current="page">Products</a>
            </li>
        </ul>
    </div>
</nav>
<main class="mt-3 mx-auto" style="width: 80%;">
    <h1>
        List of Products
    </h1>
    <a type="role" class="btn btn-primary my-2" href="addnew.jsp">Add New</a>
    <table class="table table-bordered">
        <tr>
            <th>ID</th>
            <th>Product Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Description</th>
            <th>Category Name</th>
            <th></th>
        </tr>
        <%
            ProductDAO productDao = new ProductDAO();
            ResultSet rs = productDao.getAllProducts();
            while (rs.next()) {
        %>
        <tr>
            <td><%=rs.getString("pro_id")%>
            </td>
            <td><%=rs.getString("pro_name")%>
            </td>
            <td><%=rs.getInt("pro_price")%>
            </td>
            <td><%=rs.getInt("pro_quantity")%>
            </td>
            <td><%=rs.getString("pro_description")%>
            </td>
            <td><%=rs.getString("cat_name")%>
            </td>
            <td>
                <a href="edit.jsp?id=<%=rs.getString("pro_id")%>" role="button" class="btn btn-success">Edit</a>
                <a href="delete.jsp?id=<%=rs.getString("pro_id")%>" role="button" class="btn btn-danger">Delete</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</main>
</body>
</html>