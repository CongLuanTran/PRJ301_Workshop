package org.example.workshop01.DAOs;

import org.example.workshop01.DBConnection.DBConnection;
import org.example.workshop01.Models.Product;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ProductDAO {
    private Connection conn;

    public ProductDAO() {
        conn = DBConnection.getConnection();
    }

    public ResultSet getAllProducts() {
        ResultSet rs = null;
        try {
            Statement stmt = conn.createStatement();
            String sql = "select pro_id, pro_name, pro_quantity, pro_price, pro_description, cat_name " +
                    "from product join category on product.cat_id = category.cat_id";
            rs = stmt.executeQuery(sql);
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return rs;
    }

    public ResultSet getAllCategories() {
        ResultSet rs = null;
        try {
            Statement stmt = conn.createStatement();
            String sql = "select cat_name from category";
            rs = stmt.executeQuery(sql);
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return rs;
    }

    public Product getProductById(String id) {
        Product p = null;
        try {
            PreparedStatement pstmt = conn.prepareStatement("select * from product join category on product.cat_id=category.cat_id where pro_id=?");
            pstmt.setString(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                p = new Product();
                p.setId(id);
                p.setName(rs.getString("pro_name"));
                p.setQuantity(rs.getInt("pro_quantity"));
                p.setPrice(rs.getInt("pro_price"));
                p.setDescription(rs.getString("pro_description"));
                p.setCategory(rs.getString("cat_name"));
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return p;
    }

    public int addProduct(Product p) {
        int count = 0;

        String cat_id = getCatId(p.getCategory());
        if (cat_id != null) {
            try {
                PreparedStatement pstmt = conn.prepareStatement("insert into product values(?,?,?,?,?,?)");
                pstmt.setString(1, p.getId());
                pstmt.setString(2, p.getName());
                pstmt.setInt(3, p.getPrice());
                pstmt.setInt(4, p.getQuantity());
                pstmt.setString(5, p.getDescription());
                pstmt.setString(6, cat_id);
                count = pstmt.executeUpdate();
            } catch (SQLException e) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return count;
    }

    public int editProduct(Product p) {
        int count = 0;

        String cat_id = getCatId(p.getCategory());
        if (cat_id != null) {
            try {
                PreparedStatement pstmt = conn.prepareStatement("update product " +
                        "set pro_name=?, pro_price=?, pro_quantity=?, pro_description=?, cat_id=?" +
                        "where pro_id=?");
                pstmt.setString(1, p.getName());
                pstmt.setInt(2, p.getPrice());
                pstmt.setInt(3, p.getQuantity());
                pstmt.setString(4, p.getDescription());
                pstmt.setString(5, cat_id);
                pstmt.setString(6, p.getId());
                count = pstmt.executeUpdate();
            } catch (SQLException e) {
                Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        return count;
    }

    public int deleteProduct(String id) {
        int count = 0;

        try {
            PreparedStatement pstmt = conn.prepareStatement("delete from product where pro_id=?");
            pstmt.setString(1, id);
            count = pstmt.executeUpdate();
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return count;
    }

    private String getCatId(String cat_name) {
        String cat_id = null;
        try {
            PreparedStatement pstmt = conn.prepareStatement("select cat_id from category where cat_name=?");
            pstmt.setString(1, cat_name);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                cat_id = rs.getString("cat_id");
            }
        } catch (SQLException e) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, e);
        }
        return cat_id;
    }
}
