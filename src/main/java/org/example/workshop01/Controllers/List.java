package org.example.workshop01.Controllers;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import org.example.workshop01.DAOs.ProductDAO;

import java.io.IOException;

public class List extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getParameter("id") != null || !request.getParameter("id").isEmpty()) {
            String id = request.getParameter("id");
            ProductDAO dao = new ProductDAO();
            dao.deleteProduct(id);
            response.sendRedirect("List");
        } else {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
