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
public class OrderDetailDTO {

    private String productID;
    private float price;
    private int quantity;

    public OrderDetailDTO() {
    }

    public OrderDetailDTO(String productID, float price, int quantity) {
        this.productID = productID;
        this.price = price;
        this.quantity = quantity;
    }

    public String getProductID() {
        return productID;
    }

    public void setProductID(String productID) {
        this.productID = productID;
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

}
