package com.tap.DAOImplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.OrderItemDAO;
import com.tap.model.orderItem;
import com.tap.utility.DBConnection;

public class OrderItemDAOImpl implements OrderItemDAO {

    // =========================================================
    // ADD ORDER ITEM
    // =========================================================

    @Override
    public int addOrderItem(orderItem item) {

        int orderItemId = 0;

        String sql =
                "INSERT INTO orderitem "
                + "(orderID, menuID, quantity, itemTotal) "
                + "VALUES (?, ?, ?, ?)";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                    con.prepareStatement(
                            sql,
                            Statement.RETURN_GENERATED_KEYS
                    )
        ) {

            ps.setInt(
                    1,
                    item.getOrderId()
            );

            ps.setInt(
                    2,
                    item.getMenuId()
            );

            ps.setInt(
                    3,
                    item.getQuantity()
            );

            ps.setInt(
                    4,
                    item.getItemTotal()
            );

            int rows =
                    ps.executeUpdate();

            if (rows > 0) {

                try (ResultSet rs =
                        ps.getGeneratedKeys()) {

                    if (rs.next()) {

                        orderItemId =
                                rs.getInt(1);
                    }
                }
            }

        } catch (Exception e) {

            System.out.println(
                    "Error while adding order item:"
            );

            e.printStackTrace();
        }

        return orderItemId;
    }


    // =========================================================
    // GET ORDER ITEM BY ID
    // =========================================================

    @Override
    public orderItem getOrderItem(
            int orderItemId) {

        orderItem item = null;

        String sql =
                "SELECT * FROM orderitem "
                + "WHERE orderItemId = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                    con.prepareStatement(sql)
        ) {

            ps.setInt(
                    1,
                    orderItemId
            );

            try (ResultSet rs =
                    ps.executeQuery()) {

                if (rs.next()) {

                    item =
                        new orderItem(
                            rs.getInt("orderItemId"),
                            rs.getInt("orderID"),
                            rs.getInt("menuID"),
                            rs.getInt("quantity"),
                            rs.getInt("itemTotal")
                        );
                }
            }

        } catch (Exception e) {

            System.out.println(
                    "Error while getting order item:"
            );

            e.printStackTrace();
        }

        return item;
    }


    // =========================================================
    // GET ORDER ITEMS BY ORDER ID
    // =========================================================

    @Override
    public List<orderItem>
    getOrderItemsByOrderId(int orderId) {

        List<orderItem> items =
                new ArrayList<>();

        String sql =
                "SELECT * FROM orderitem "
                + "WHERE orderID = ? "
                + "ORDER BY orderItemId";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                    con.prepareStatement(sql)
        ) {

            ps.setInt(
                    1,
                    orderId
            );

            try (ResultSet rs =
                    ps.executeQuery()) {

                while (rs.next()) {

                    orderItem item =
                            new orderItem(
                                rs.getInt(
                                    "orderItemId"
                                ),
                                rs.getInt(
                                    "orderID"
                                ),
                                rs.getInt(
                                    "menuID"
                                ),
                                rs.getInt(
                                    "quantity"
                                ),
                                rs.getInt(
                                    "itemTotal"
                                )
                            );

                    items.add(item);
                }
            }

        } catch (Exception e) {

            System.out.println(
                    "Error while getting order items:"
            );

            e.printStackTrace();
        }

        return items;
    }


    // =========================================================
    // GET ALL ORDER ITEMS
    // =========================================================

    @Override
    public List<orderItem>
    getAllOrderItems() {

        List<orderItem> items =
                new ArrayList<>();

        String sql =
                "SELECT * FROM orderitem "
                + "ORDER BY orderItemId DESC";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                    con.prepareStatement(sql);
            ResultSet rs =
                    ps.executeQuery()
        ) {

            while (rs.next()) {

                orderItem item =
                        new orderItem(
                            rs.getInt(
                                "orderItemId"
                            ),
                            rs.getInt(
                                "orderID"
                            ),
                            rs.getInt(
                                "menuID"
                            ),
                            rs.getInt(
                                "quantity"
                            ),
                            rs.getInt(
                                "itemTotal"
                            )
                        );

                items.add(item);
            }

        } catch (Exception e) {

            System.out.println(
                    "Error while getting all order items:"
            );

            e.printStackTrace();
        }

        return items;
    }


    // =========================================================
    // UPDATE QUANTITY
    // =========================================================

    @Override
    public boolean updateQuantity(
            int orderItemId,
            int quantity) {

        String sql =
                "UPDATE orderitem "
                + "SET quantity = ? "
                + "WHERE orderItemId = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                    con.prepareStatement(sql)
        ) {

            ps.setInt(
                    1,
                    quantity
            );

            ps.setInt(
                    2,
                    orderItemId
            );

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            System.out.println(
                    "Error while updating order item:"
            );

            e.printStackTrace();
        }

        return false;
    }


    // =========================================================
    // DELETE ORDER ITEM
    // =========================================================

    @Override
    public boolean deleteOrderItem(
            int orderItemId) {

        String sql =
                "DELETE FROM orderitem "
                + "WHERE orderItemId = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                    con.prepareStatement(sql)
        ) {

            ps.setInt(
                    1,
                    orderItemId
            );

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            System.out.println(
                    "Error while deleting order item:"
            );

            e.printStackTrace();
        }

        return false;
    }
}