package com.tap.DAO;

import java.util.List;

import com.tap.model.order;

public interface orderDAO {

    
    int addOrder(order o);
    order getOrder(int orderID);
    List<order> getAllOrders();
    List<order> getOrdersByUserID(int userID);
    boolean updateOrderStatus(int orderID, String status);
    boolean deleteOrder(int orderID);
}