package com.mywebapp.utils;

import com.mywebapp.beans.Book;
import com.mywebapp.beans.UserAccount;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DBUtils {

	public static boolean isBookExist(Connection conn, int bookCode, UserAccount loginedUser) {
		String sql = "SELECT * FROM `bookshelf` WHERE userName = ? AND code = ?";

		PreparedStatement psmt = null;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, loginedUser.getUserName());
			psmt.setInt(2, bookCode);
			ResultSet rs = psmt.executeQuery();
			if (rs.next()) return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static boolean changeBookshelf(Connection conn, int bookCode, boolean add, UserAccount loginedUser) {

		String sql;
		if (add) {
			sql = "INSERT INTO `bookshelf`(`code`, `userName`) VALUES (?, ?)";
		}
		else {
			sql = "DELETE FROM `bookshelf` WHERE code = ? AND userName = ?";
		}

		try {
			PreparedStatement psmt = conn.prepareStatement(sql);
			psmt.setInt(1, bookCode);
			psmt.setString(2, loginedUser.getUserName());
			psmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public static ArrayList<Book> getBooksAtBookshelf(Connection conn, UserAccount loginedUser) {
		String sql = "SELECT * FROM `bookshelf` INNER JOIN books USING(code) WHERE userName = ?";

		ResultSet rs = null;
		ArrayList<Book> books = new ArrayList();

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setString(1, loginedUser.getUserName());
			rs = pstm.executeQuery();
			while (rs.next()) {
				int code = rs.getInt("code");
				String name = rs.getNString("name");
				String author = rs.getNString("author");
				String img = rs.getString("image");
				String pdf = rs.getString("pdfUrl");

				books.add(new Book(code, name, author, img, pdf));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return books;
	}

	public static ArrayList<Book> findBookByName(Connection conn, String input) {
		String query = "SELECT code, name, author, image, pdfUrl FROM books WHERE locate(?, name) != 0";

		ResultSet rs = null;
		ArrayList<Book> books = new ArrayList();

		try {
			PreparedStatement pstm = conn.prepareStatement(query);
			pstm.setNString(1, input);
			rs = pstm.executeQuery();
			while (rs.next()) {
				int code = rs.getInt("code");
				String name = rs.getNString("name");
				String author = rs.getNString("author");
				String img = rs.getString("image");
				String pdf = rs.getString("pdfUrl");

				books.add(new Book(code, name, author, img, pdf));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return books;
	}

	public static ArrayList<Book> getBookByCategory(Connection conn, int categoryCode, int codeBook){
		String query = "SELECT code, name, author, image, pdfUrl FROM books WHERE categorycode = ? AND code != ?";

		ResultSet rs = null;
		ArrayList<Book> books = new ArrayList();

		try {
			PreparedStatement pstm = conn.prepareStatement(query);
			pstm.setInt(1, categoryCode);
			pstm.setInt(2, codeBook);
			rs = pstm.executeQuery();
			while (rs.next()) {
				int code = rs.getInt("code");
				String name = rs.getNString("name");
				String author = rs.getNString("author");
				String img = rs.getString("image");
				String pdf = rs.getString("pdfUrl");

				books.add(new Book(code, name, author, img, pdf));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return books;
	}

	public static Book getBookDetail(Connection conn, int code){

		String sql = "SELECT b.code, b.name, b.author, b.categorycode, c.name AS category, b.description, b.image, b.pdfUrl FROM books b INNER JOIN categories c on b.categorycode = c.code WHERE b.code = ?";

		try {
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setInt(1, code);

			ResultSet rs = pstm.executeQuery();
			if (rs.next()) {
				String name = rs.getNString("name");
				String author = rs.getNString("author");
				int categoryCode = rs.getInt("categorycode");
				String category = rs.getNString("category");
				String description = rs.getNString("description");
				String img = rs.getString("image");
				String pdf = rs.getString("pdfUrl");
				return new Book(name, author, categoryCode, category, description, img, pdf);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return new Book();
	}

	public static ArrayList<Book> getBestSellingBooks(Connection conn) {

		String query = "SELECT b.code, b.name, b.author, b.image, b.pdfUrl, bf.price " +
				"FROM bestsellingbooks bs " +
				"INNER JOIN booksforsale bf USING(code) " +
				"INNER JOIN books b USING (code)" ;

		ResultSet rs = null;
		ArrayList<Book> books = new ArrayList();

		try {
			PreparedStatement pstm = conn.prepareStatement(query);
			rs = pstm.executeQuery();

			while (rs.next()) {
				int code = rs.getInt("code");
				String name = rs.getNString("name");
				String author = rs.getNString("author");
				String img = rs.getString("image");
				String pdf = rs.getString("pdfUrl");
				int price = rs.getInt("price");
				books.add(new Book(code, name, author, img, pdf, price));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return books;
	}
	
	public static ArrayList<Book> getHotBooks(Connection conn) {
		
		String query = "SELECT b.code, b.name, b.author, b.image, b.pdfUrl FROM hotBooks hb INNER JOIN books b USING(code)";
		
		ResultSet rs = null;
		ArrayList<Book> hotBooks = new ArrayList();
		
		try {
			PreparedStatement pstm = conn.prepareStatement(query);
			rs = pstm.executeQuery();
			while (rs.next()) {
				int code = rs.getInt("code");
				String name = rs.getNString("name");
				String author = rs.getNString("author");
				String img = rs.getString("image");
				String pdf = rs.getString("pdfUrl");

				hotBooks.add(new Book(code, name, author, img, pdf));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return hotBooks;
	}
	
	public static boolean isAccountExist(Connection conn,  
			String userName) {
		
        String sql = "Select a.userName from userAccounts a " //
                + " where a.userName = ?";
 

        ResultSet rs = null;
		try {
	        PreparedStatement pstm = conn.prepareStatement(sql);
	        pstm.setString(1, userName);
			rs = pstm.executeQuery();
	        if (rs.next()) {
	            return true;
	        }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return false;
	}

	public static void addUserAccount(Connection conn, String displayName, String userName, String pass) {
		String sql = "INSERT INTO `useraccounts`(`userName`, `password`, `displayName`) VALUES (?, ?, ?)";
		try {
			PreparedStatement pstm= conn.prepareStatement(sql);

			pstm.setString(1, userName);
			pstm.setString(2, pass);
			pstm.setNString(3, displayName);

			pstm.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
 
    public static UserAccount findUser(Connection conn, //
            String userName, String password) throws SQLException {
 
        String sql = "Select a.userName, a.password, a.displayName from userAccounts a " //
                + " where a.userName = ? and a.password= ?";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);
        pstm.setString(2, password);
        ResultSet rs = pstm.executeQuery();
 
        if (rs.next()) {
        	String displayName = rs.getNString("displayName");
            UserAccount user = new UserAccount(userName, password, displayName);
            return user;
        }
        return null;
    }
 
    public static UserAccount findUser(Connection conn, String userName) throws SQLException {
 
        String sql = "Select a.userName, a.password, a.displayName from userAccounts a "
                + " where a.userName = ? ";
 
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, userName);
 
        ResultSet rs = pstm.executeQuery();
 
        if (rs.next()) {
			String displayName = rs.getNString("displayName");
            String password = rs.getString("password");
            UserAccount user = new UserAccount(userName, password, displayName);
            return user;
        }
        return null;
    }
}
