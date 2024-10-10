<%@ page import="org.example.workshop01.DAOs.ProductDAO" %>
<%@ page import="org.example.workshop01.Models.Product" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: tranc
  Date: 10/7/2024
  Time: 5:36 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Delete</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<%
    if (request.getParameter("id") != null && !request.getParameter("id").isEmpty()) {
        Product p = null;
        try {
            ProductDAO dao = new ProductDAO();
            p = dao.getProductById(request.getParameter("id"));
        } catch (Exception e) {
            response.sendRedirect("index.jsp");
        }
        if (p == null) {
            response.sendRedirect("index.jsp");
        } else {
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
<main class="container mt-3 mx-2 float-end" style="width: 80%">
    <h2>
        Delete
    </h2>
    <h3>
        Are you sure you want to delete this?
    </h3>
    Product
    <hr>
    <form action="Delete" method="post">
        <div class="form-group row my-2">
            <label for="pro_id" class="col-sm-2 col-form-label text-end">Product ID</label>
            <div class="col-sm-10 float-end">
                <input value="<%=p.getId()%>" type="text" name="textID" class="form-control disabled" id="pro_id"
                       required readonly disabled>
                <input type="hidden" value="<%=p.getId()%>" name="txtProID">
            </div>
        </div>
        <div class="form-group row my-2">
            <label for="pro_name" class="col-sm-2 col-form-label text-end">Product Name</label>
            <div class="col-sm-10">
                <input value="<%=p.getName()%>" type="text" name="txtName" class="form-control" id="pro_name"
                       required readonly disabled>
            </div>
        </div>
        <div class="form-group row my-2">
            <label for="pro_price" class="col-sm-2 col-form-label text-end">Price</label>
            <div class="col-sm-10">
                <input value="<%=p.getPrice()%>" type="number" name="txtPrice" class="form-control" id="pro_price"
                       required readonly disabled>
            </div>
        </div>
        <div class="form-group row my-2">
            <label for="pro_quantity" class="col-sm-2 col-form-label text-end">Quantity</label>
            <div class="col-sm-10">
                <input value="<%=p.getQuantity()%>" type="number" name="txtQuan" class="form-control disabled"
                       id="pro_quantity"
                       required readonly disabled>
            </div>
        </div>
        <div class="form-group row my-2">
            <label for="pro_description" class="col-sm-2 col-form-label text-end">Description</label>
            <div class="col-sm-10">
                <textarea name="txtDes" class="form-control disabled" id="pro_description"
                          required readonly disabled><%=p.getDescription()%></textarea>
            </div>
        </div>
        <div class="form-group row my-2">
            <label for="cat_name" class="col-sm-2 col-form-label text-end">Category Name</label>
            <div class="col-sm-10">
                <select name="cboCat" class="form-select" id="cat_name" required disabled>
                    <%
                        ProductDAO productDAO = new ProductDAO();
                        ResultSet rs = productDAO.getAllCategories();
                        while (rs.next()) {
                    %>
                    <option <%=rs.getString("cat_name").equals(p.getCategory()) ? "selected" : ""%>
                            value=<%=rs.getString("cat_name")%>><%=rs.getString("cat_name")%>
                    </option>
                    <%
                        }
                    %>
                </select>
            </div>
        </div>
        <div class="d-flex justify-content-end">
            <div class="col-sm-10">
                <input name="btnDelete" type="submit" class="btn btn-primary" value="Delete">
                <a href="List" class="btn btn-danger">Back to list</a>
            </div>
        </div>
    </form>
</main>
<%
        }
    } else {
        response.sendRedirect("List");
    }
%>
</body>
</html>
