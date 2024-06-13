<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Employee</title>
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
    try {
        // Establish database connection
        Class.forName("com.mysql.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/employee_management";
        String dbUsername = "root";
        String dbPassword = "";
        conn = DriverManager.getConnection(url, dbUsername, dbPassword);
        
        // Get parameters from the request
        int employeeId = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String department = request.getParameter("department");
        String position = request.getParameter("position");
        double salary = Double.parseDouble(request.getParameter("salary"));
        Date hireDate = Date.valueOf(request.getParameter("hireDate"));
        
        // Update employee record in the database
        String sqlUpdate = "UPDATE employees SET name = ?, email = ?, department = ?, position = ?, salary = ?, hire_date = ? WHERE id = ?";
        stmt = conn.prepareStatement(sqlUpdate);
        stmt.setString(1, name);
        stmt.setString(2, email);
        stmt.setString(3, department);
        stmt.setString(4, position);
        stmt.setDouble(5, salary);
        stmt.setDate(6, hireDate);
        stmt.setInt(7, employeeId);
        
        int rowsAffected = stmt.executeUpdate();
        if (rowsAffected > 0) {
%>
<div class="container">
    <div class="header">
        <h2>Employee Updated Successfully</h2>
    </div>
    <p><a href="EmployeeManagement.jsp">Go Back to Employee Management</a></p>
</div>
<%
        } else {
            // No rows affected, likely due to invalid employee ID
            out.println("Failed to update employee. Employee ID may be invalid.");
        }
    } catch (Exception e) {
        e.printStackTrace();
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
</body>
</html>
