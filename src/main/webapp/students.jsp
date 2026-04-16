package com.app;

import java.io.IOException;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class StudentServlet extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        RequestDispatcher rd = req.getRequestDispatcher("students.jsp");
        rd.forward(req, res);
    }

    public void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String name = req.getParameter("name");

        ServletContext context = getServletContext();
        List<String> students = (List<String>) context.getAttribute("students");

        if (students == null) {
            students = new ArrayList<>();
        }

        students.add(name);
        context.setAttribute("students", students);

        res.sendRedirect("students");
    }
}
