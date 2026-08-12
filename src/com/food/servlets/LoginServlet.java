package com.food.servlets;

import java.io.IOException;

import org.mindrot.jbcrypt.BCrypt;

import com.tap.DAOImplementation.UserDAOImpl;
import com.tap.model.user;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 5689494626514037174L;

    @Override
    protected void doPost(HttpServletRequest req,
                           HttpServletResponse resp)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        String password = req.getParameter("password");

        System.out.println("Entered Username: " + name);

        UserDAOImpl userDAOImpl = new UserDAOImpl();

        user loggedInUser =
                userDAOImpl.getUserByUsername(name);

        System.out.println("User Object: " + loggedInUser);


        // =====================================================
        // USER NOT FOUND
        // =====================================================

        if (loggedInUser == null) {

            System.out.println("User not found");

            resp.sendRedirect("Login.jsp?error=invalid");

            return;
        }


        // =====================================================
        // PASSWORD CHECK
        // =====================================================

        System.out.println(
                "DB Password: "
                + loggedInUser.getPassword()
        );


        boolean passwordMatch =
                BCrypt.checkpw(
                        password,
                        loggedInUser.getPassword()
                );


        System.out.println(
                "Password Match: "
                + passwordMatch
        );


        // =====================================================
        // LOGIN SUCCESS
        // =====================================================

        if (passwordMatch) {

            /*
             * Get the existing HTTP session.
             */
            HttpSession session = req.getSession();


            /*
             * Store the logged-in user in the session.
             */
            session.setAttribute(
                    "user",
                    loggedInUser
            );


            /*
             * Debug information
             */
            System.out.println(
                    "Login successful"
            );

            System.out.println(
                    "Session ID: "
                    + session.getId()
            );

            System.out.println(
                    "Logged-in User: "
                    + loggedInUser
            );


            /*
             * Continue to Restaurant page.
             */
            resp.sendRedirect("Restaurant");


        } else {

            // =================================================
            // WRONG PASSWORD
            // =================================================

            System.out.println(
                    "Invalid password"
            );

            resp.sendRedirect(
                    "Login.jsp?error=invalid"
            );
        }
    }
}