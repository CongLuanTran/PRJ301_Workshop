<%@ page import="org.example.workshop01.DAOs.ProductDAO" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="org.example.workshop01.Models.Product" %><%--
  Created by IntelliJ IDEA.
  User: tranc
  Date: 10/1/2024
  Time: 4:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Add New</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
<%
    if (request.getParameter("btnCreate") != null) {
        String id = request.getParameter("txtID");
        String name = request.getParameter("txtName");
        int price = Integer.parseInt(request.getParameter("txtPrice"));
        int quant = Integer.parseInt(request.getParameter("txtQuant"));
        String des = request.getParameter("txtDes");
        String cat = request.getParameter("cboCat");

        Product p = new Product(id, name, quant, price, des, cat);
        ProductDAO dao = new ProductDAO();

        int count = dao.addProduct(p);
        if (count > 0) {
            response.sendRedirect("index.jsp");
            return;
        } else {
            response.sendRedirect("addnew.jsp");
            return;
        }
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
<main class="mt-3 mx-2 float-end" style="width: 80%">
    <h2>
        Create New
    </h2>
    Product
    <hr>
    <form action="" method="post">
        <div class="form-group row my-2">
            <label for="pro_id" class="col-sm-2 col-form-label text-end">Product ID</label>
            <div class="col-sm-10 float-end">
                <input type="text" name="txtID" class="form-control" id="pro_id" required>
            </div>
        </div>
        <div class="form-group row my-2">
            <label for="pro_name" class="col-sm-2 col-form-label text-end">Product Name</label>
            <div class="col-sm-10">
                <input type="text" name="txtName" class="form-control" id="pro_name" required>
            </div>
        </div>
        <div class="form-group row my-2">
            <label for="pro_price" class="col-sm-2 col-form-label text-end">Price</label>
            <div class="col-sm-10">
                <input type="number" name="txtPrice" class="form-control" id="pro_price" required>
            </div>
        </div>
        <div class="form-group row my-2">
            <label for="pro_quantity" class="col-sm-2 col-form-label text-end">Quantity</label>
            <div class="col-sm-10">
                <input type="number" name="txtQuant" class="form-control" id="pro_quantity" required>
            </div>
        </div>
        <div class="form-group row my-2">
            <label for="pro_description" class="col-sm-2 col-form-label text-end">Description</label>
            <div class="col-sm-10">
                <textarea name="txtDes" class="form-control" id="pro_description" required></textarea>
            </div>
        </div>
        <div class="form-group row my-2">
            <label for="cat_name" class="col-sm-2 col-form-label text-end">Category Name</label>
            <div class="col-sm-10">
                <select name="cboCat" class="form-select" id="cat_name" required>
                    <%
                        ProductDAO productDAO = new ProductDAO();
                        ResultSet rs = productDAO.getAllCategories();
                        while (rs.next()) {
                    %>
                    <option value=<%=rs.getString("cat_name")%>><%=rs.getString("cat_name")%>
                    </option>
                    <%
                        }
                    %>
                </select>
            </div>
        </div>
        <div class="d-flex justify-content-end">
            <div class="col-sm-10">
                <input name="btnCreate" type="submit" class="btn btn-primary" value="Create">
                <a href="index.jsp" class="btn btn-danger">Back to list</a>
            </div>
        </div>
    </form>
</main>

</body>
</html>
