import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.ExternalContext;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

@ManagedBean
@RequestScoped
public class LoginBean {
    private String username;
    private String password;

    // Getters and setters for username and password

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    // Method to authenticate user
    public String login() {
        try {
            // Establish database connection
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/employee_management";
            String dbUsername = "root";
            String dbPassword = "";
            Connection connection = DriverManager.getConnection(url, dbUsername, dbPassword);

            // Prepare SQL statement for authentication
            String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, username);
            statement.setString(2, password);

            // Execute the statement
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                // User authenticated
                // Create HTTP session
                HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(true);
                // Store username and password in session attributes
                session.setAttribute("username", username);
                session.setAttribute("password", password);
                // Redirect to welcome page
                return "EmployeeManagement.jsp";
            } else {
                // Authentication failed
                FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Authentication failed!", null));
                return null; // Stay on the same page
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle any exceptions
            FacesContext.getCurrentInstance().addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "Error: " + e.getMessage(), null));
            return null; // Stay on the same page
        }
    }
}
