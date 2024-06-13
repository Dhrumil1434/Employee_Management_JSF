<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Management</title>
    <style>
        /* Add your CSS styles here */
        /* Styles for container, header, forms, and tables */
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #f4f4f4;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            animation: fadein 1s;
            font-family: Arial, sans-serif;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .employee-form {
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

        .employee-table-container {
            overflow-x: auto;
        }

        .employee-table {
            width: 100%;
            border-collapse: collapse;
            table-layout: fixed;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .employee-table th,
        .employee-table td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
            width: auto;
        }

        .employee-table th {
            background-color: #f5f5f5;
        }

        .employee-table td {
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .employee-table td .scrollable {
            overflow-x: auto;
            max-width: 100px; /* Adjust the max-width as needed */
        }

        .employee-table td a {
            margin-right: 10px;
            text-decoration: none;
            color: #007bff;
            transition: color 0.3s ease;
            cursor: pointer;
        }

        .employee-table td a:hover {
            color: #0056b3;
        }

        /* Animation */
        @keyframes fadein {
            from { opacity: 0; }
            to   { opacity: 1; }
        }

        /* Editable cell */
        .editable {
            cursor: pointer;
        }

        .editable:hover {
            background-color: #f0f0f0;
        }

        /* Edit button */
        .edit-button {
            display: none;
        }

        .edit-button.visible {
            display: block;
            margin-top: 10px;
        }
    </style>
    <script>
        // Function to enable edit button when a cell is double-clicked
        function enableEditButton() {
            var editButton = document.getElementById("edit-button");
            editButton.classList.add("visible");
        }
    </script>
</head>
<body>
<%
    session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null || session.getAttribute("password") == null) {
        // Redirect to login page if session or session attributes are not set
        response.sendRedirect("faces/login.xhtml");
    } else {
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
            
            // Get the session attributes
            String username = (String) session.getAttribute("username");
            String password = (String) session.getAttribute("password");
            
            // Fetch admin ID based on username and password
            String sqlAdminId = "SELECT id FROM admin WHERE username = ? AND password = ?";
            stmt = conn.prepareStatement(sqlAdminId);
            stmt.setString(1, username);
            stmt.setString(2, password);
            rs = stmt.executeQuery();
            int adminId = -1; // Default value if admin not found
            if (rs.next()) {
                adminId = rs.getInt("id");
                
                // Fetch employee records where aid (admin ID) matches
                String sqlEmployee = "SELECT * FROM employees WHERE aid = ?";
                stmt = conn.prepareStatement(sqlEmployee);
                stmt.setInt(1, adminId);
                rs = stmt.executeQuery();
%>
<div class="container">
    <div class="header">
        <h1>Employee Management System</h1>
    </div>
    <div class="employee-form">
        <h3>Add Employee:</h3>
        <form action="AddEmployee.jsp" method="post">
            <input type="text" name="name" placeholder="Name" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="text" name="department" placeholder="Department" required>
            <input type="text" name="position" placeholder="Position" required>
            <input type="number" name="salary" placeholder="Salary" required>
            <input type="date" name="hireDate" placeholder="Hire Date" required>
            <input type="hidden" name="aid" value="<%= adminId %>">
            <button type="submit">Add Employee</button>
        </form>
    </div>

    <div class="employee-table-container">
        <h3>Employee Records:</h3>
        <!-- Fetch and display employee records from the database -->
        <table class="employee-table">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Department</th>
                    <th>Position</th>
                    <th>Salary</th>
                    <th>Hire Date</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Reset the ResultSet cursor
                    rs.beforeFirst();
                    while (rs.next()) { 
                %>
                <tr>
                    <td class="editable" ondblclick="enableEditButton();"><%= rs.getString("name") %></td>
                    <td class="editable" ondblclick="enableEditButton();">
                        <div class="scrollable"><%= rs.getString("email") %></div>
                    </td>
                    <td class="editable" ondblclick="enableEditButton();"><%= rs.getString("department") %></td>
                    <td class="editable" ondblclick="enableEditButton();"><%= rs.getString("position") %></td>
                    <td class="editable" ondblclick="enableEditButton();"><%= rs.getDouble("salary") %></td>
                    <td class="editable" ondblclick="enableEditButton();"><%= rs.getDate("hire_date") %></td>
                    <td>
                        <a href="EditEmployee.jsp?id=<%= rs.getInt("id") %>">Edit</a>
                        <a href="DeleteEmployee.jsp?id=<%= rs.getInt("id") %>">Delete</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <!-- Edit button -->
        <form action="EditEmployee.jsp" method="get">
            <input type="hidden" name="id" id="edit-id">
            <button type="submit" id="edit-button" class="edit-button">Edit</button>
        </form>
    </div>
    <!-- Logout form -->
    <form action="faces/login.xhtml" method="post">
        <input type="hidden" name="logout" value="true">
        <button type="submit">Logout</button>
    </form>
</div>
<%
            } else {
                // Admin ID not found
                out.println("Admin ID not found");
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
    }
%>
</body>
</html>
