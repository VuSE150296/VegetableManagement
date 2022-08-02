/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.Order;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.utils.DBUtils;

/**
 *
 * @author Vu Dang
 */
public class OrderDAO {

    public boolean OrderInsert(OrderDTO order) throws SQLException {
        boolean checkOrder = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        long millis = System.currentTimeMillis();
        Date orderDate = new java.sql.Date(millis);
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblOrder(orderID, orderDate, total, userID)"
                        + " VALUES(?, ?, ?, ?)";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, "");
                ptm.setDate(2, orderDate);
                ptm.setFloat(3, order.getTotal());
                ptm.setString(4, order.getUserID());
                checkOrder = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return checkOrder;
    }

    public String OrderID(OrderDetailDTO order) throws SQLException {
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        String orderID = "";
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sqlSO = "SELECT TOP 1 orderID FROM tblOrder ORDER BY orderID DESC";
                ptm = conn.prepareStatement(sqlSO);
                rs = ptm.executeQuery();
                orderID = rs.getString("orderID");
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return orderID;
    }
    
    public boolean OrderDeatailInsert(OrderDetailDTO order) throws SQLException {
        boolean checkOrderDetail = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        long millis = System.currentTimeMillis();
        Date orderDate = new java.sql.Date(millis);
        String orderID = OrderID(order);
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                String sql = "INSERT INTO tblOrderDetail(detailID, price, quantity, orderID, productID)"
                        + " VALUES(?, ?, ?, ?, ?)";
                ptm = conn.prepareStatement(sql);
                ptm.setString(1, "");
                ptm.setFloat(2, order.getPrice());
                ptm.setInt(3, order.getQuantity());
                ptm.setString(4, orderID);
                ptm.setString(5, order.getProductID());
                checkOrderDetail = ptm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return checkOrderDetail;
    }
    
}
