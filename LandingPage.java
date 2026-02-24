package PROJECTGUI;

import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import java.io.InputStream;
import java.sql.*;

public class LandingPage extends JFrame {
    private CardLayout cardLayout = new CardLayout();
    private JPanel mainContainer = new JPanel(cardLayout);
    private final Color DASH_RED = new Color(204, 41, 34);
    private final String ADMIN_CODE = "DRIVE2026";

    private JButton loginBtn = new JButton("Log-In");
    private JButton signupBtn = new JButton("SignUp");

    public LandingPage() {
        setTitle("DriveDash Car Rental System");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setSize(1400, 800);

        mainContainer.add(createLandingView(), "LANDING");
        mainContainer.add(createAuthView(true), "LOGIN");
        mainContainer.add(createAuthView(false), "SIGNUP");

        add(mainContainer);
        setLocationRelativeTo(null);
        setVisible(true);
    }

    // --- VIEW 1: LANDING PAGE ---
    private JPanel createLandingView() {
        ImagePanel panel = new ImagePanel("/1.png"); 
        panel.setLayout(new GridBagLayout());
        GridBagConstraints gbc = new GridBagConstraints();

        gbc.gridx = 0; gbc.gridy = 0; gbc.weightx = 0.5; 
        gbc.fill = GridBagConstraints.BOTH;
        panel.add(Box.createGlue(), gbc);

        JPanel buttonContainer = new JPanel(new GridLayout(2, 1, 0, 20));
        buttonContainer.setOpaque(false); 

        Dimension btnSize = new Dimension(250, 70);
        Font btnFont = new Font("SansSerif", Font.BOLD, 22);
        
        loginBtn.setPreferredSize(btnSize);
        loginBtn.setFont(btnFont);
        loginBtn.setForeground(DASH_RED);
        loginBtn.setBackground(Color.WHITE);
        loginBtn.setFocusPainted(false);
        loginBtn.addActionListener(e -> cardLayout.show(mainContainer, "LOGIN"));

        signupBtn.setPreferredSize(btnSize);
        signupBtn.setFont(btnFont);
        signupBtn.setForeground(Color.WHITE);
        signupBtn.setContentAreaFilled(false);
        signupBtn.setOpaque(false);
        signupBtn.setBorder(BorderFactory.createLineBorder(Color.WHITE, 3));
        signupBtn.setFocusPainted(false);
        signupBtn.addActionListener(e -> cardLayout.show(mainContainer, "SIGNUP"));

        buttonContainer.add(loginBtn);
        buttonContainer.add(signupBtn);

        gbc.gridx = 1; gbc.weightx = 0.5;
        gbc.insets = new Insets(300, 200, 0, 0); 
        gbc.anchor = GridBagConstraints.CENTER; 
        gbc.fill = GridBagConstraints.NONE;
        panel.add(buttonContainer, gbc);

        return panel;
    }

    // --- VIEW 2 & 3: LOGIN/SIGNUP ---
    private JPanel createAuthView(boolean isLogin) {
        JPanel splitPanel = new JPanel(new GridLayout(1, 2));

        // --- LEFT PANEL (WHITE) ---
        JPanel left = new JPanel(new GridBagLayout());
        left.setBackground(Color.WHITE);
        GridBagConstraints lGbc = new GridBagConstraints();
        lGbc.gridx = 0;
        lGbc.weightx = 1.0; // Ensures components occupy the horizontal axis
        lGbc.fill = GridBagConstraints.NONE;
        
        int allowance = 50; // Your margin from the left edge

        // 1. BACK BUTTON (Top-Left)
        JButton backBtn = new JButton("← Back to Home");
        backBtn.setFont(new Font("SansSerif", Font.BOLD, 16));
        backBtn.setForeground(DASH_RED);
        backBtn.setContentAreaFilled(false);
        backBtn.setBorderPainted(false);
        backBtn.setFocusPainted(false);
        backBtn.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
        backBtn.addActionListener(e -> cardLayout.show(mainContainer, "LANDING"));

        lGbc.gridy = 0; lGbc.weighty = 0.0;
        lGbc.anchor = GridBagConstraints.NORTHWEST; // Fixed to top-left
        lGbc.insets = new Insets(20, allowance, 0, 0); 
        left.add(backBtn, lGbc);

        // 2. TITLE (Below Back Button, Left Aligned)
        JLabel title = new JLabel(isLogin ? "Log-in" : "Sign-Up");
        title.setFont(new Font("SansSerif", Font.BOLD, 80));
        lGbc.gridy = 1; lGbc.weighty = 0.1;
        lGbc.anchor = GridBagConstraints.WEST; // Force to far left
        lGbc.insets = new Insets(10, allowance, 0, 0);
        left.add(title, lGbc);

        // 3. ENLARGED VERIFICATION (Bottom-Left)
        JPanel verificationPanel = new JPanel(new FlowLayout(FlowLayout.LEFT, 0, 0));
        verificationPanel.setBackground(Color.WHITE);
        Font verificationFont = new Font("SansSerif", Font.PLAIN, 20);

        JCheckBox authCheck = new JCheckBox(isLogin ? "I am not a robot" : "I agree to the ");
        authCheck.setBackground(Color.WHITE);
        authCheck.setFont(verificationFont);
        verificationPanel.add(authCheck);

        if (!isLogin) {
            JLabel termsLink = new JLabel("<html><u>Terms and Conditions</u></html>");
            termsLink.setForeground(DASH_RED);
            termsLink.setFont(verificationFont);
            termsLink.setCursor(Cursor.getPredefinedCursor(Cursor.HAND_CURSOR));
            termsLink.addMouseListener(new MouseAdapter() {
                @Override public void mouseClicked(MouseEvent e) { showTermsPopup(); }
            });
            verificationPanel.add(termsLink);
        }

        lGbc.gridy = 2; lGbc.weighty = 1.0; 
        lGbc.anchor = GridBagConstraints.SOUTHWEST; // Fixed to bottom-left
        lGbc.insets = new Insets(0, allowance, 40, 0);
        left.add(verificationPanel, lGbc);

        // --- RIGHT PANEL (RED) ---
        JPanel right = new JPanel(new GridBagLayout());
        right.setBackground(DASH_RED);
        GridBagConstraints rGbc = new GridBagConstraints();
        rGbc.fill = GridBagConstraints.HORIZONTAL;
        rGbc.gridx = 0;

        // NEW: "Enter your Details:" Header
        JLabel detailsHeader = new JLabel("Enter your Details:");
        detailsHeader.setForeground(Color.WHITE);
        detailsHeader.setFont(new Font("SansSerif", Font.BOLD, 24));
        rGbc.gridy = 0;
        rGbc.insets = new Insets(20, 50, 20, 50); // Margin top/bottom
        right.add(detailsHeader, rGbc);

        Dimension fieldSize = new Dimension(400, 50); 
        Font fieldFont = new Font("SansSerif", Font.PLAIN, 18);

        JTextField userF = new JTextField("Username");
        styleField(userF, fieldSize, fieldFont);
        rGbc.gridy = 1; rGbc.insets = new Insets(10, 50, 10, 50); 
        right.add(userF, rGbc);

        JLabel passLabel = new JLabel("<html><font color='white'>Password:</font></html>");
        passLabel.setFont(new Font("SansSerif", Font.BOLD, 14));
        rGbc.gridy = 2; right.add(passLabel, rGbc);

        JPasswordField passF = new JPasswordField();
        styleField(passF, fieldSize, fieldFont);
        rGbc.gridy = 3; right.add(passF, rGbc);

        if (!isLogin) {
            JTextField emailF = new JTextField("Email");
            JTextField nameF = new JTextField("Legal Name");
            JTextField licenseF = new JTextField("Driver's License");
            JTextField phoneF = new JTextField("Phone Number");
            Dimension authBtnSize = new Dimension(180, 50);
            Font authBtnFont = new Font("SansSerif", Font.BOLD, 18);

            JTextField[] fields = {emailF, nameF, licenseF, phoneF};
            int gridStart = 4;
            for (JTextField f : fields) {
                styleField(f, fieldSize, fieldFont);
                rGbc.gridy = gridStart++;
                right.add(f, rGbc);
            }
            
            JButton regBtn = new JButton("Register");
            regBtn.setPreferredSize(authBtnSize);
            regBtn.setFont(authBtnFont);
            rGbc.gridy = gridStart; rGbc.fill = GridBagConstraints.NONE; rGbc.anchor = GridBagConstraints.EAST;
            right.add(regBtn, rGbc);
            regBtn.addActionListener(e -> {
                if (!authCheck.isSelected()) JOptionPane.showMessageDialog(this, "Agree to Terms first!");
                else handleSignup(userF.getText(), new String(passF.getPassword()), emailF.getText(), nameF.getText(), licenseF.getText(), phoneF.getText());
            });
        } else {
        	Dimension authBtnSize = new Dimension(180, 50);
            Font authBtnFont = new Font("SansSerif", Font.BOLD, 18);
            JButton logBtn = new JButton("Log-In");
            logBtn.setPreferredSize(authBtnSize);
            logBtn.setFont(authBtnFont);
            rGbc.gridy = 4; rGbc.fill = GridBagConstraints.NONE; rGbc.anchor = GridBagConstraints.EAST;
            right.add(logBtn, rGbc);
            logBtn.addActionListener(e -> {
                if (!authCheck.isSelected()) JOptionPane.showMessageDialog(this, "Check 'I am not a robot'");
                else handleLogin(userF.getText(), new String(passF.getPassword()));
            });
        }

        splitPanel.add(left);
        splitPanel.add(right);
        return splitPanel;
    }

    private void styleField(JTextField field, Dimension size, Font font) {
        field.setPreferredSize(size);
        field.setFont(font);
        field.setBorder(BorderFactory.createCompoundBorder(field.getBorder(), BorderFactory.createEmptyBorder(5, 10, 5, 10)));
    }

    private void showTermsPopup() {
        String termsText = "DRIVEDASH TERMS AND CONDITIONS\n\n1. Booking and Payment\n- Valid license and ID required.\n\n2. Usage\n- No illegal activities or racing.\n\n3. Liability\n- Renter is responsible for damage.\n\n4. Fees\n- Renter pays all traffic fines.\n\n5. Fuel\n- Return with same fuel level.";
        JTextArea ta = new JTextArea(termsText); ta.setEditable(false); ta.setLineWrap(true);
        JScrollPane sp = new JScrollPane(ta); sp.setPreferredSize(new Dimension(400, 300));
        JOptionPane.showMessageDialog(this, sp, "Terms", JOptionPane.INFORMATION_MESSAGE);
    }

    private Connection connect() throws SQLException {
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/car_rental", "root", "myPASSsql@54321");
    }

    private void handleLogin(String u, String p) {
        try (Connection conn = connect()) {
            String sql = "SELECT role FROM users WHERE USERNAME=? AND password=?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, u); pstmt.setString(2, p);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                JOptionPane.showMessageDialog(this, "Welcome " + u);
                cardLayout.show(mainContainer, "LANDING");
            } else JOptionPane.showMessageDialog(this, "Invalid Credentials");
        } catch (SQLException ex) { ex.printStackTrace(); }
    }

    private void handleSignup(String u, String p, String email, String name, String lic, String ph) {
        int res = JOptionPane.showConfirmDialog(this, "Register as Admin?", "Role", JOptionPane.YES_NO_OPTION);
        String role = "USER", empId = null;
        if (res == JOptionPane.YES_OPTION) {
            String code = JOptionPane.showInputDialog("Admin Code:");
            if (ADMIN_CODE.equals(code)) { role = "ADMIN"; empId = JOptionPane.showInputDialog("Employee ID:"); }
        }
        try (Connection conn = connect()) {
            String sql = "INSERT INTO users (USERNAME, EMAIL, password, legal_name, drivers_license, phone_number, role, EMPLOYEE_ID) VALUES (?,?,?,?,?,?,?,?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, u); pstmt.setString(2, email); pstmt.setString(3, p);
            pstmt.setString(4, name); pstmt.setString(5, lic); pstmt.setString(6, ph);
            pstmt.setString(7, role); pstmt.setString(8, empId);
            pstmt.executeUpdate();
            JOptionPane.showMessageDialog(this, "Success!");
            cardLayout.show(mainContainer, "LOGIN");
        } catch (SQLException ex) { ex.printStackTrace(); }
    }

    class ImagePanel extends JPanel {
        private BufferedImage img;
        public ImagePanel(String path) {
            try { InputStream is = getClass().getResourceAsStream(path); if (is != null) img = ImageIO.read(is); }
            catch (Exception e) { e.printStackTrace(); }
        }
        @Override protected void paintComponent(Graphics g) {
            super.paintComponent(g); if (img != null) g.drawImage(img, 0, 0, getWidth(), getHeight(), this);
        }
    }

    public static void main(String[] args) { SwingUtilities.invokeLater(LandingPage::new); }
}