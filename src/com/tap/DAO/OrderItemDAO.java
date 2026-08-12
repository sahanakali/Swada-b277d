package com.tap.DAO;

import java.util.List;

import com.tap.model.orderItem;

public interface OrderItemDAO {

    // Add a new order item
    int addOrderItem(orderItem item);

    // Get order item by ID
    orderItem getOrderItem(int orderItemId);

    // Get all items belonging to an order
    List<orderItem> getOrderItemsByOrderId(int orderId);

    // Get all order items
    List<orderItem> getAllOrderItems();

    // Update quantity
    boolean updateQuantity(int orderItemId, int quantity);

    // Delete order item
    boolean deleteOrderItem(int orderItemId);
}