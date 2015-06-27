package account.models.test;

/*import java.sql.DriverManager;
 import java.sql.ResultSet;*/
import java.sql.DriverManager;
import java.util.ArrayList;

import test.ConnectionStub;
import test.StatementStub;
import test.ResultSetStub;

/*import com.mysql.jdbc.Connection;
 import com.mysql.jdbc.PreparedStatement;
 import com.mysql.jdbc.Statement;*/

public class getCommentsInfo {

	public static ArrayList<Comments> getComments() {

		ArrayList<Comments> list = new ArrayList<Comments>();

		// To connect to the database
		String connectionURL = "jdbc:mysql://localhost:3306/test";
		ConnectionStub connection = null;
		ResultSetStub rs = null;
		String dbUsername = "root"; // Database username
		String dbPassword = "1234"; // Database password

		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) {
			System.out.println(" Unable to load driver. ");
		}
		try {
			connection = (ConnectionStub) DriverManager.getConnection(
					connectionURL, dbUsername, dbPassword);
			// System.out.println(" Connection Established. ");

			// After this, create your own logic
			StatementStub sql = (StatementStub) connection
					.prepareStatement("CALL get_comments");
			rs = (ResultSetStub) sql.executeQuery();

			if (rs != null) {

				int id;
				int parent;
				String date = "";
				String owner = "";
				String text = "";
				String fname = "";
				String lname = "";

				while (rs.next()) {
					id = rs.getInt("comment_id");
					parent = rs.getInt("parent");
					date = rs.getString("create_dt");
					owner = rs.getString("create_by");
					text = rs.getString("content");
					fname = rs.getString("fname");
					lname = rs.getString("lname");

					Comments newcomment = new Comments(id, parent, date, owner,
							text, fname, lname);
					list.add(newcomment);
				}
			}

			connection.close();
		} catch (Exception e) {
			System.out.println(" Error connecting to database:  " + e);
		}

		return list;
	}
}
