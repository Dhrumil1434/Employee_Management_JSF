<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*,java.util.*,javax.servlet.*" %>
<%
    Connection conn = null;
    PreparedStatement stmt = null;
    try {
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/employee_management";
        String dbUsername = "root";
        String dbPassword = "";
        conn = DriverManager.getConnection(url, dbUsername, dbPassword);
        
        // Retrieve parameters from the request
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String department = request.getParameter("department");
        String position = request.getParameter("position");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String hireDate = request.getParameter("hireDate");
        int aid = Integer.parseInt(request.getParameter("aid"));
        
        // Insert the new employee into the database
        String sql = "INSERT INTO employees (name, email, department, position, salary, hire_date, aid) VALUES (?, ?, ?, ?, ?, ?, ?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, name);
        stmt.setString(2, email);
        stmt.setString(3, department);
        stmt.setString(4, position);
        stmt.setDouble(5, salary);
        stmt.setString(6, hireDate);
        stmt.setInt(7, aid);
        int rowsInserted = stmt.executeUpdate();
        
        // Redirect to EmployeeManagement.jsp after successful insertion
        if (rowsInserted > 0) {
            response.sendRedirect("EmployeeManagement.jsp");
        } else {
            out.println("Error adding employee. Please try again.");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("Error adding employee. Please try again.");
    } finally {
        // Close the PreparedStatement and Connection
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
