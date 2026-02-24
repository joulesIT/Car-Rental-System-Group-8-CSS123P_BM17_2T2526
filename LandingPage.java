package PROJECTGUI;

import javax.swing.*;
import java.awt.*;
import java.sql.*;

public class LandingPage extends JFrame {
    private CardLayout cardLayout = new CardLayout();
    private JPanel mainContainer = new JPanel(cardLayout);

    public LandingPage() {
        setTitle("DriveDash - Simple Car Rental System");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(500, 400);

        // Add the three different screens
        mainContainer.add(createHomePanel(), "HOME");
        mainContainer.add(createLoginPanel(), "LOGIN");
        mainContainer.add(createSignupPanel(), "SIGNUP");

        add(mainContainer);
        setLocationRelativeTo(null);
        setVisible(true);
    }

    // --- SCREEN 1: HOME ---
    private JPanel createHomePanel() {
        JPanel panel = new JPanel(new BorderLayout());
        JLabel label = new JLabel("Welcome to DriveDash", SwingConstants.CENTER);
        label.setFont(new Font("Arial", Font.BOLD, 24));
        
        JButton goToLogin = new JButton("Get Started / Login");
        goToLogin.addActionListener(e -> cardLayout.show(mainContainer, "LOGIN"));

        panel.add(label, BorderLayout.CENTER);
        panel.add(goToLogin, BorderLayout.SOUTH);
        return panel;
    }

    // --- SCREEN 2: LOGIN ---
    private JPanel createLoginPanel() {
        JPanel panel = new JPanel(new GridLayout(4, 2, 10, 10));
        JTextField userField = new JTextField();
        JPasswordField passField = new JPasswordField();
        JButton loginBtn = new JButton("Login");
        JButton signupBtn = new JButton("Create Account");

        panel.add(new JLabel("Username:")); panel.add(userField);
        panel.add(new JLabel("Password:")); panel.add(passField);
        panel.add(loginBtn); panel.add(signupBtn);

        loginBtn.addActionListener(e -> handleLogin(userField.getText(), new String(passField.getPassword())));
        signupBtn.addActionListener(e -> cardLayout.show(mainContainer, "SIGNUP"));

        return panel;
    }

    // --- SCREEN 3: SIGNUP ---
    private JPanel createSignupPanel() {
        JPanel panel = new JPanel(new GridLayout(4, 2, 10, 10));
        JTextField userField = new JTextField();
        JPasswordField passField = new JPasswordField();
        JButton registerBtn = new JButton("Register");
        JButton backBtn = new JButton("Back to Login");

        panel.add(new JLabel("New Username:")); panel.add(userField);
        panel.add(new JLabel("New Password:")); panel.add(passField);
        panel.add(registerBtn); panel.add(backBtn);

        registerBtn.addActionListener(e -> handleSignup(userField.getText(), new String(passField.getPassword())));
        backBtn.addActionListener(e -> cardLayout.show(mainContainer, "LOGIN"));

        return panel;
    }

    // --- DATABASE LOGIC ---
    private Connection connect() throws SQLException {
        // Update "root" and "password" with your MySQL credentials
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/car_rental", "root", "myPASSsql@54321");
    }

    private void handleLogin(String user, String pass) {
        try (Connection conn = connect()) {
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user);
            pstmt.setString(2, pass);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                JOptionPane.showMessageDialog(this, "Login Successful! Welcome " + user);
                cardLayout.show(mainContainer, "HOME");
            } else {
                JOptionPane.showMessageDialog(this, "Invalid username or password.");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            JOptionPane.showMessageDialog(this, "Database Error: " + ex.getMessage());
        }
    }

    private void handleSignup(String user, String pass) {
        if (user.isEmpty() || pass.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Fields cannot be empty.");
            return;
        }
        try (Connection conn = connect()) {
            String sql = "INSERT INTO users (username, password) VALUES (?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user);
            pstmt.setString(2, pass);
            pstmt.executeUpdate();
            JOptionPane.showMessageDialog(this, "Account created successfully!");
            cardLayout.show(mainContainer, "LOGIN");
        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(this, "Username might already exist.");
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(() -> new LandingPage());
    }
}