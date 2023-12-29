
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String jdbcUri = getServletContext().getInitParameter("jdbcUri");
        String dbUri = getServletContext().getInitParameter("dbUri");
        String dbId = getServletContext().getInitParameter("dbId");
        String dbPass = getServletContext().getInitParameter("dbPass");

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        int age = Integer.parseInt(request.getParameter("age"));
        String city = request.getParameter("city");

        try {
            Class.forName(jdbcUri);
            try (Connection con = DriverManager.getConnection(dbUri, dbId, dbPass)) {
                PreparedStatement ps = con.prepareStatement("INSERT INTO regtbl(name, gender, age, address, city) VALUES(?,?,?,?,?)");

                ps.setString(1, name);
                ps.setString(2, gender);
                ps.setInt(3, age);
                ps.setString(4, address);
                ps.setString(5, city);

                int i = ps.executeUpdate();
                if (i > 0) {
                    out.println("User Inserted Successfully");
                } else {
                    out.println("Error: User not inserted");
                }
            }

        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
            out.println("Error: " + ex.getMessage());
        }
    }
}
