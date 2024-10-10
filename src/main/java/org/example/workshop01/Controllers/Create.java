package org.example.workshop01.Controllers;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import org.example.workshop01.DAOs.ProductDAO;
import org.example.workshop01.Models.Product;

import java.io.IOException;

public class Create extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("addnew.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("txtID");
        String name = request.getParameter("txtName");
        int price = Integer.parseInt(request.getParameter("txtPrice"));
        int quant = Integer.parseInt(request.getParameter("txtQuan"));
        String des = request.getParameter("txtDes");
        String cat = request.getParameter("cboCat");

        Product p = new Product(id, name, quant, price, des, cat);
        ProductDAO dao = new ProductDAO();

        int count = dao.addProduct(p);
        if (count > 0) {
            response.sendRedirect("List");
        } else {
            response.sendRedirect("List");
        }
    }
}
