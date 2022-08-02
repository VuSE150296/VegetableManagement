/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sample.shopping.ProductDTO;
import sample.utils.DBUtils;

/**
 *
 * @author ASUS
 */
public class ShoppingDAO {

    private static final String SEARCH = "SELECT productID, productName, image, price, quantity, categoryID, importDate, usingDate FROM tblProduct WHERE productName like ? ";
    private static final String ADD = "SELECT productID, productName, image, price, quantity, categoryID, importDate, usingDate FROM tblProduct ";
    private static final String CHECK_DUPLICATE = "SELECT productID, productName, image, price, quantity, categoryID, importDate, usingDate FROM tblProduct WHERE productID=? ";
    private static final String INSERT = "INSERT INTO tblProduct(productID, productName, image, price, quantity, categoryID, importDate, usingDate) VALUES(?,?,?,?,?,?,?,?)";
    private static final String DELETE = "DELETE tblProduct WHERE productID=? ";
    private static final String UPDATE = "UPDATE tblProduct SET productName=?, price=?, quantity=?, categoryID=?, importDate=?, usingDate=? WHERE productID=?";

    public List<ProductDTO> getListVegetable(String search) throws SQLException {

        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(SEARCH);
                ptm.setString(1, "%" + search + "%");
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String categoryID = rs.getString("categoryID");
                    Date importDate = rs.getDate("importDate");
                    Date usingDate = rs.getDate("usingDate");

                    listProduct.add(new ProductDTO(productID, productName, image, price, quantity, categoryID, importDate, usingDate));
                }
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
        return listProduct;
    }

    public List<ProductDTO> add() throws SQLException {
        List<ProductDTO> listProduct = new ArrayList<>();
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(ADD);
                rs = ptm.executeQuery();
                while (rs.next()) {
                    String productID = rs.getString("productID");
                    String productName = rs.getString("productName");
                    String image = rs.getString("image");
                    float price = rs.getFloat("price");
                    int quantity = rs.getInt("quantity");
                    String categoryID = rs.getString("categoryID");
                    Date importDate = rs.getDate("importDate");
                    Date usingDate = rs.getDate("usingDate");

                    listProduct.add(new ProductDTO(productID, productName, image, price, quantity, categoryID, importDate, usingDate));
                }
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
        return listProduct;
    }

    public boolean checkDuplicate(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        ResultSet rs = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, productID);
                rs = ptm.executeQuery();
                if (rs.next()) {
                    check = true;
                }
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
        return check;
    }

    public boolean insert(ProductDTO product) throws SQLException, ClassNotFoundException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;

        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(INSERT);
                ptm.setString(1, product.getProductID());
                ptm.setString(2, product.getProductName());
                ptm.setString(3, product.getImage());
                ptm.setFloat(4, product.getPrice());
                ptm.setInt(5, product.getQuantity());
                ptm.setString(6, product.getCategoryID());
                ptm.setDate(7, product.getImportDate());
                ptm.setDate(8, product.getUsingDate());
                check = ptm.executeUpdate() > 0;
            }
        } finally {
            if (ptm != null) {
                ptm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return check;
    }

    public boolean delete(String productID) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(DELETE);
                ptm.setString(1, productID);
                check = ptm.executeUpdate() > 0 ? true : false;
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
        return check;
    }

    public boolean update(ProductDTO product) throws SQLException {
        boolean check = false;
        Connection conn = null;
        PreparedStatement ptm = null;
        try {
            conn = DBUtils.getConnection();
            if (conn != null) {
                ptm = conn.prepareStatement(UPDATE);

                ptm.setString(1, product.getProductName());
                ptm.setFloat(2, product.getPrice());
                ptm.setInt(3, product.getQuantity());
                ptm.setString(4, product.getCategoryID());
                ptm.setDate(5, product.getImportDate());
                ptm.setDate(6, product.getUsingDate());
                ptm.setString(7, product.getProductID());
                check = ptm.executeUpdate() > 0 ? true : false;
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
        return check;
    }

}
