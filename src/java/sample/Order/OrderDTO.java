/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.Order;

/**
 *
 * @author Vu Dang
 */
public class OrderDTO {

    private String orderID;
    private String userID;
    private String productID;
    private String productName;
    private float price;
    private int quantity;
    private float total;

    public OrderDTO() {
    }

    public OrderDTO(String userID, float total) {
        this.userID = userID;
        this.total = total;
    }

    public OrderDTO(float price, int quantity) {
        this.price = price;
        this.quantity = quantity;
    }

    public OrderDTO(String orderID, String productID, float price, int quantity) {
        this.orderID = orderID;
        this.productID = productID;
        this.price = price;
        this.quantity = quantity;
    }

    public OrderDTO(String productID, float price, int quantity) {
        this.productID = productID;
        this.price = price;
        this.quantity = quantity;
    }

    public OrderDTO(String userID, String productID, float price, int quantity, float total) {
        this.userID = userID;
        this.productID = productID;
        this.price = price;
        this.quantity = quantity;
        this.total = total;
    }

    public OrderDTO(String userID, String productID, String productName, float price, int quantity, float total) {
        this.userID = userID;
        this.productID = productID;
        this.productName = productName;
        this.price = price;
        this.quantity = quantity;
        this.total = total;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getTotal() {
        return total;
    }

    public void setTotal(float total) {
        this.total = total;
    }

}
