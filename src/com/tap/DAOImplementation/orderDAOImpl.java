package com.tap.DAOImplementation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tap.DAO.orderDAO;
import com.tap.model.order;
import com.tap.utility.DBConnection;

public class orderDAOImpl implements orderDAO {

    // =========================================================
    // ADD ORDER
    // =========================================================

    @Override
    public int addOrder(order o) {

        int orderID = 0;

        String sql =
                "INSERT INTO ordertable "
                + "(UserID, RestaurantID, OrderDate, TotalAmount, Status, PaymentMethod) "
                + "VALUES (?, ?, ?, ?, ?, ?)";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                    con.prepareStatement(
                            sql,
                            Statement.RETURN_GENERATED_KEYS
                    )
        ) {

            ps.setInt(1, o.getUserID());
            ps.setInt(2, o.getRestaurantID());
            ps.setTimestamp(3, o.getOrderDate());
            ps.setDouble(4, o.getTotalAmount());
            ps.setString(5, o.getStatus());
            ps.setString(6, o.getPaymentMethod());

            int rows = ps.executeUpdate();

            if (rows > 0) {

                try (ResultSet rs = ps.getGeneratedKeys()) {

                    if (rs.next()) {
                        orderID = rs.getInt(1);
                    }
                }
            }

        } catch (Exception e) {

            System.out.println(
                    "Error while adding order:"
            );

            e.printStackTrace();
        }

        return orderID;
    }


    // =========================================================
    // GET ORDER BY ORDER ID
    // =========================================================

    @Override
    public order getOrder(int orderID) {

        order o = null;

        String sql =
                "SELECT * FROM ordertable "
                + "WHERE OrderID = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                    con.prepareStatement(sql)
        ) {

            ps.setInt(1, orderID);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    /*
                     * IMPORTANT:
                     * Use the default constructor.
                     * The old code was incorrectly doing:
                     *
                     * new order(orderID, orderID, null,
                     *            orderID, sql, sql);
                     */

                    o = new order();

                    o.setOrderID(
                            rs.getInt("OrderID")
                    );

                    o.setUserID(
                            rs.getInt("UserID")
                    );

                    o.setRestaurantID(
                            rs.getInt("RestaurantID")
                    );

                    o.setOrderDate(
                            rs.getTimestamp("OrderDate")
                    );

                    o.setTotalAmount(
                            rs.getDouble("TotalAmount")
                    );

                    o.setStatus(
                            rs.getString("Status")
                    );

                    o.setPaymentMethod(
                            rs.getString("PaymentMethod")
                    );
                }
            }

        } catch (Exception e) {

            System.out.println(
                    "Error while getting order:"
            );

            e.printStackTrace();
        }

        return o;
    }


    // =========================================================
    // GET ALL ORDERS
    // =========================================================

    @Override
    public List<order> getAllOrders() {

        List<order> orders =
                new ArrayList<>();

        String sql =
                "SELECT * FROM ordertable "
                + "ORDER BY OrderDate DESC";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                    con.prepareStatement(sql);
            ResultSet rs =
                    ps.executeQuery()
        ) {

            while (rs.next()) {

                order o = new order();

                o.setOrderID(
                        rs.getInt("OrderID")
                );

                o.setUserID(
                        rs.getInt("UserID")
                );

                o.setRestaurantID(
                        rs.getInt("RestaurantID")
                );

                o.setOrderDate(
                        rs.getTimestamp("OrderDate")
                );

                o.setTotalAmount(
                        rs.getDouble("TotalAmount")
                );

                o.setStatus(
                        rs.getString("Status")
                );

                o.setPaymentMethod(
                        rs.getString("PaymentMethod")
                );

                orders.add(o);
            }

        } catch (Exception e) {

            System.out.println(
                    "Error while getting all orders:"
            );

            e.printStackTrace();
        }

        return orders;
    }


    // =========================================================
    // GET ORDERS BY USER ID
    // =========================================================

    @Override
    public List<order> getOrdersByUserID(int userID) {

        List<order> orders =
                new ArrayList<>();

        String sql =
                "SELECT * FROM ordertable "
                + "WHERE UserID = ? "
                + "ORDER BY OrderDate DESC";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                    con.prepareStatement(sql)
        ) {

            ps.setInt(1, userID);

            try (ResultSet rs = ps.executeQuery()) {

                while (rs.next()) {

                    order o = new order();

                    o.setOrderID(
                            rs.getInt("OrderID")
                    );

                    o.setUserID(
                            rs.getInt("UserID")
                    );

                    o.setRestaurantID(
                            rs.getInt("RestaurantID")
                    );

                    o.setOrderDate(
                            rs.getTimestamp("OrderDate")
                    );

                    o.setTotalAmount(
                            rs.getDouble("TotalAmount")
                    );

                    o.setStatus(
                            rs.getString("Status")
                    );

                    o.setPaymentMethod(
                            rs.getString("PaymentMethod")
                    );

                    orders.add(o);
                }
            }

        } catch (Exception e) {

            System.out.println(
                    "Error while getting user orders:"
            );

            e.printStackTrace();
        }

        return orders;
    }


    // =========================================================
    // UPDATE ORDER STATUS
    // =========================================================

    @Override
    public boolean updateOrderStatus(
            int orderID,
            String status) {

        String sql =
                "UPDATE ordertable "
                + "SET Status = ? "
                + "WHERE OrderID = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                    con.prepareStatement(sql)
        ) {

            ps.setString(1, status);
            ps.setInt(2, orderID);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            System.out.println(
                    "Error while updating order:"
            );

            e.printStackTrace();
        }

        return false;
    }


    // =========================================================
    // DELETE ORDER
    // =========================================================

    @Override
    public boolean deleteOrder(int orderID) {

        String sql =
                "DELETE FROM ordertable "
                + "WHERE OrderID = ?";

        try (
            Connection con = DBConnection.getConnection();
            PreparedStatement ps =
                    con.prepareStatement(sql)
        ) {

            ps.setInt(1, orderID);

            return ps.executeUpdate() > 0;

        } catch (Exception e) {

            System.out.println(
                    "Error while deleting order:"
            );

            e.printStackTrace();
        }

        return false;
    }
}