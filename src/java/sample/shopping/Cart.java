/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.shopping;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Admin
 */
public class Cart {
    private Map<String, ProductDTO> cart;

    public Cart() {
    }

    public Cart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }

    public Map<String, ProductDTO> getCart() {
        return cart;
    }

    public void setCart(Map<String, ProductDTO> cart) {
        this.cart = cart;
    }
    public void add(ProductDTO vegetable){
        if(this.cart==null){
            this.cart = new HashMap<>();
        }
        if(this.cart.containsKey(vegetable.getProductID())){
            int currentQuantity = this.cart.get(vegetable.getProductID()).getQuantity();
            vegetable.setQuantity(currentQuantity+ vegetable.getQuantity());
        }
        cart.put(vegetable.getProductID(), vegetable);
    }
     public boolean remove(String id){
        boolean check = false;
        if(this.cart != null){
            if(this.cart.containsKey(id)){
                this.cart.remove(id);
                check = true;
            }
        }
        return check;
    }   
    public boolean edit(String id, ProductDTO newVegetable){
        boolean check = false;
        if(this.cart!= null){
            if(this.cart.containsKey(id)){
                this.cart.replace(id, newVegetable);
                check= true;
            }
        }
        return check;
    }
}
