package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import javax.servlet.http.HttpSession;

public final class EmployeeManagement_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Employee Management</title>\n");
      out.write("    <style>\n");
      out.write("        /* Add your CSS styles here */\n");
      out.write("        /* Styles for container, header, forms, and tables */\n");
      out.write("        .container {\n");
      out.write("            max-width: 800px;\n");
      out.write("            margin: 20px auto;\n");
      out.write("            padding: 20px;\n");
      out.write("            background-color: #f4f4f4;\n");
      out.write("            border-radius: 8px;\n");
      out.write("            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);\n");
      out.write("            animation: fadein 1s;\n");
      out.write("            font-family: Arial, sans-serif;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .header {\n");
      out.write("            text-align: center;\n");
      out.write("            margin-bottom: 20px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .employee-form {\n");
      out.write("            margin-bottom: 20px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .employee-form form {\n");
      out.write("            display: flex;\n");
      out.write("            flex-wrap: wrap;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .employee-form input {\n");
      out.write("            flex: 1;\n");
      out.write("            padding: 10px;\n");
      out.write("            margin: 5px;\n");
      out.write("            border: 1px solid #ccc;\n");
      out.write("            border-radius: 4px;\n");
      out.write("            box-sizing: border-box;\n");
      out.write("            font-size: 16px;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .employee-form button {\n");
      out.write("            flex: 1;\n");
      out.write("            padding: 10px;\n");
      out.write("            margin: 5px;\n");
      out.write("            background-color: #007bff;\n");
      out.write("            color: #fff;\n");
      out.write("            border: none;\n");
      out.write("            border-radius: 4px;\n");
      out.write("            cursor: pointer;\n");
      out.write("            transition: background-color 0.3s ease;\n");
      out.write("            font-size: 16px;\n");
      out.write("            box-sizing: border-box;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .employee-form button:hover {\n");
      out.write("            background-color: #0056b3;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .employee-table-container {\n");
      out.write("            overflow-x: auto;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .employee-table {\n");
      out.write("            width: 100%;\n");
      out.write("            border-collapse: collapse;\n");
      out.write("            table-layout: fixed;\n");
      out.write("            background-color: #fff;\n");
      out.write("            border-radius: 8px;\n");
      out.write("            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .employee-table th,\n");
      out.write("        .employee-table td {\n");
      out.write("            padding: 10px;\n");
      out.write("            border: 1px solid #ddd;\n");
      out.write("            text-align: left;\n");
      out.write("            width: auto;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .employee-table th {\n");
      out.write("            background-color: #f5f5f5;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .employee-table td {\n");
      out.write("            white-space: nowrap;\n");
      out.write("            overflow: hidden;\n");
      out.write("            text-overflow: ellipsis;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .employee-table td .scrollable {\n");
      out.write("            overflow-x: auto;\n");
      out.write("            max-width: 100px; /* Adjust the max-width as needed */\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .employee-table td a {\n");
      out.write("            margin-right: 10px;\n");
      out.write("            text-decoration: none;\n");
      out.write("            color: #007bff;\n");
      out.write("            transition: color 0.3s ease;\n");
      out.write("            cursor: pointer;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .employee-table td a:hover {\n");
      out.write("            color: #0056b3;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Animation */\n");
      out.write("        @keyframes fadein {\n");
      out.write("            from { opacity: 0; }\n");
      out.write("            to   { opacity: 1; }\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Editable cell */\n");
      out.write("        .editable {\n");
      out.write("            cursor: pointer;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .editable:hover {\n");
      out.write("            background-color: #f0f0f0;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        /* Edit button */\n");
      out.write("        .edit-button {\n");
      out.write("            display: none;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        .edit-button.visible {\n");
      out.write("            display: block;\n");
      out.write("            margin-top: 10px;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("    <script>\n");
      out.write("        // Function to enable edit button when a cell is double-clicked\n");
      out.write("        function enableEditButton() {\n");
      out.write("            var editButton = document.getElementById(\"edit-button\");\n");
      out.write("            editButton.classList.add(\"visible\");\n");
      out.write("        }\n");
      out.write("    </script>\n");
      out.write("</head>\n");
      out.write("<body>\n");

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

      out.write("\n");
      out.write("<div class=\"container\">\n");
      out.write("    <div class=\"header\">\n");
      out.write("        <h1>Employee Management System</h1>\n");
      out.write("    </div>\n");
      out.write("    <div class=\"employee-form\">\n");
      out.write("        <h3>Add Employee:</h3>\n");
      out.write("        <form action=\"AddEmployee.jsp\" method=\"post\">\n");
      out.write("            <input type=\"text\" name=\"name\" placeholder=\"Name\" required>\n");
      out.write("            <input type=\"email\" name=\"email\" placeholder=\"Email\" required>\n");
      out.write("            <input type=\"text\" name=\"department\" placeholder=\"Department\" required>\n");
      out.write("            <input type=\"text\" name=\"position\" placeholder=\"Position\" required>\n");
      out.write("            <input type=\"number\" name=\"salary\" placeholder=\"Salary\" required>\n");
      out.write("            <input type=\"date\" name=\"hireDate\" placeholder=\"Hire Date\" required>\n");
      out.write("            <input type=\"hidden\" name=\"aid\" value=\"");
      out.print( adminId );
      out.write("\">\n");
      out.write("            <button type=\"submit\">Add Employee</button>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("\n");
      out.write("    <div class=\"employee-table-container\">\n");
      out.write("        <h3>Employee Records:</h3>\n");
      out.write("        <!-- Fetch and display employee records from the database -->\n");
      out.write("        <table class=\"employee-table\">\n");
      out.write("            <thead>\n");
      out.write("                <tr>\n");
      out.write("                    <th>Name</th>\n");
      out.write("                    <th>Email</th>\n");
      out.write("                    <th>Department</th>\n");
      out.write("                    <th>Position</th>\n");
      out.write("                    <th>Salary</th>\n");
      out.write("                    <th>Hire Date</th>\n");
      out.write("                    <th>Action</th>\n");
      out.write("                </tr>\n");
      out.write("            </thead>\n");
      out.write("            <tbody>\n");
      out.write("                ");
 
                    // Reset the ResultSet cursor
                    rs.beforeFirst();
                    while (rs.next()) { 
                
      out.write("\n");
      out.write("                <tr>\n");
      out.write("                    <td class=\"editable\" ondblclick=\"enableEditButton();\">");
      out.print( rs.getString("name") );
      out.write("</td>\n");
      out.write("                    <td class=\"editable\" ondblclick=\"enableEditButton();\">\n");
      out.write("                        <div class=\"scrollable\">");
      out.print( rs.getString("email") );
      out.write("</div>\n");
      out.write("                    </td>\n");
      out.write("                    <td class=\"editable\" ondblclick=\"enableEditButton();\">");
      out.print( rs.getString("department") );
      out.write("</td>\n");
      out.write("                    <td class=\"editable\" ondblclick=\"enableEditButton();\">");
      out.print( rs.getString("position") );
      out.write("</td>\n");
      out.write("                    <td class=\"editable\" ondblclick=\"enableEditButton();\">");
      out.print( rs.getDouble("salary") );
      out.write("</td>\n");
      out.write("                    <td class=\"editable\" ondblclick=\"enableEditButton();\">");
      out.print( rs.getDate("hire_date") );
      out.write("</td>\n");
      out.write("                    <td>\n");
      out.write("                        <a href=\"EditEmployee.jsp?id=");
      out.print( rs.getInt("id") );
      out.write("\">Edit</a>\n");
      out.write("                        <a href=\"DeleteEmployee.jsp?id=");
      out.print( rs.getInt("id") );
      out.write("\">Delete</a>\n");
      out.write("                    </td>\n");
      out.write("                </tr>\n");
      out.write("                ");
 } 
      out.write("\n");
      out.write("            </tbody>\n");
      out.write("        </table>\n");
      out.write("        <!-- Edit button -->\n");
      out.write("        <form action=\"EditEmployee.jsp\" method=\"get\">\n");
      out.write("            <input type=\"hidden\" name=\"id\" id=\"edit-id\">\n");
      out.write("            <button type=\"submit\" id=\"edit-button\" class=\"edit-button\">Edit</button>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("    <!-- Logout form -->\n");
      out.write("    <form action=\"faces/login.xhtml\" method=\"post\">\n");
      out.write("        <input type=\"hidden\" name=\"logout\" value=\"true\">\n");
      out.write("        <button type=\"submit\">Logout</button>\n");
      out.write("    </form>\n");
      out.write("</div>\n");

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

      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
