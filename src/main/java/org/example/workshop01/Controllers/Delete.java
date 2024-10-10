package org.example.workshop01.Controllers;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.example.workshop01.DAOs.ProductDAO;

import java.io.IOException;

public class Delete extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("id") == null || request.getParameter("id").isEmpty()) {
            response.sendRedirect("List");
        } else {
            request.getRequestDispatcher("delete.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            String id = request.getParameter("txtProID");
            ProductDAO dao = new ProductDAO();
            int count = dao.deleteProduct(id);
            if (count > 0) {
                response.sendRedirect("List");
            } else {
                response.sendRedirect("Delete?id=" + id);
            }
    }
}
