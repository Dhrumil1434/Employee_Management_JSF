<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>
    <style>
        /* Add your CSS styles here */
        /* Styles for container, header, forms */
        .container {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: #f4f4f4;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            font-family: Arial, sans-serif;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .employee-form form {
            display: flex;
            flex-wrap: wrap;
        }

        .employee-form input {
            flex: 1;
            padding: 10px;
            margin: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }

        .employee-form button {
            flex: 1;
            padding: 10px;
            margin: 5px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 16px;
            box-sizing: border-box;
        }

        .employee-form button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<%
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    try {
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/employee_management";
        String dbUsername = "root";
        String dbPassword = "";
        conn = DriverManager.getConnection(url, dbUsername, dbPassword);
        
        // Get employee ID from the request parameter
        int employeeId = Integer.parseInt(request.getParameter("id"));
        
        // Fetch employee record based on ID
        String sqlEmployee = "SELECT * FROM employees WHERE id = ?";
        stmt = conn.prepareStatement(sqlEmployee);
        stmt.setInt(1, employeeId);
        rs = stmt.executeQuery();
        if (rs.next()) {
%>
<div class="container">
    <div class="header">
        <h2>Edit Employee</h2>
    </div>
    <div class="employee-form">
        <form action="UpdateEmployee.jsp" method="post">
            <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
            <input type="text" name="name" value="<%= rs.getString("name") %>" required>
            <input type="email" name="email" value="<%= rs.getString("email") %>" required>
            <input type="text" name="department" value="<%= rs.getString("department") %>" required>
            <input type="text" name="position" value="<%= rs.getString("position") %>" required>
            <input type="number" name="salary" value="<%= rs.getDouble("salary") %>" required>
            <input type="date" name="hireDate" value="<%= rs.getDate("hire_date") %>" required>
            <button type="submit">Update</button>
        </form>
    </div>
</div>
<%
        } else {
            // Employee record not found
            out.println("Employee not found");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close the ResultSet, PreparedStatement, and Connection
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
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
</body>
</html>
