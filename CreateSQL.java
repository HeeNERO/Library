package sql;

import java.sql.*;

public class CreateSQL {

    private Connection connect() {

        String url = "jdbc:sqlite:G:/MINDWORK/sqlite/db/library.db";
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(url);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return conn;
    }

    public void selectAll(){
        String sql = "SELECT ID, Title FROM Book";

        try (Connection conn = connect();
             Statement stmt  = conn.createStatement();
             ResultSet rs    = stmt.executeQuery(sql)){

            while (rs.next()) {
                System.out.println(rs.getInt("ID") +  "\t" +
                        rs.getString("Title"));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public static void main(String[] args) {

        CreateSQL sql = new CreateSQL();
        sql.selectAll();

    }
}
