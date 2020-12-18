package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import jdbc.util.JdbcUtil;
import model.User_Comp;

public class UserDao_Comp {

	public int insert(Connection conn, User_Comp user) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn
					.prepareStatement("insert into user_comp (userid, pwd, username, companyname, companynum, companyowner, address, telecom, tel, mobile, fax, email, categori, product1, product2) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getPwd());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getCompanyName());
			pstmt.setString(5, user.getCompanyNum());
			pstmt.setString(6, user.getCompanyOwner());
			pstmt.setString(7, user.getMainAddress()+user.getSubAddress());
			pstmt.setString(8, user.getTelecom());
			pstmt.setString(9, user.getTel1() + user.getTel2() + "-"
					+ user.getTel3());
			pstmt.setString(10, user.getMobile1() + "-" + user.getMobile2()
					+ "-" + user.getMobile3());
			pstmt.setString(11, user.getFax1() + "-" + user.getFax2()
					+ "-" + user.getFax3());
			pstmt.setString(12, user.getEmail1() +"@"+ user.getEmail2());
			pstmt.setString(13, user.getCategori());
			pstmt.setString(14, user.getProduct1());
			pstmt.setString(15, user.getProduct2());
			
			return pstmt.executeUpdate();

		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	public User_Comp select(Connection conn, String userId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn
					.prepareStatement("select * from user_comp where userid=?");
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return setUserResult(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public User_Comp select2(Connection conn, String userName, String companyNum) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn
					.prepareStatement("select * from user_comp where userName=? and companynum=?");
			pstmt.setString(1, userName);
			pstmt.setString(2, companyNum);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return setUserResult(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	protected User_Comp setUserResult(ResultSet rs) throws SQLException {
		User_Comp user = new User_Comp();

		user.setUserId(rs.getString("userid"));
		user.setPwd(rs.getString("pwd"));
		user.setUserName(rs.getString("username"));
		user.setCompanyName(rs.getString("companyname"));
		user.setCompanyNum(rs.getString("companynum"));
		user.setCompanyOwner(rs.getString("companyowner"));
		user.setAddress(rs.getString("address"));
		user.setTel(rs.getString("tel"));
		user.setTelecom(rs.getString("telecom"));
		user.setMobile(rs.getString("mobile"));
		user.setFax(rs.getString("fax"));
		user.setEmail(rs.getString("email"));
		user.setCategori(rs.getString("categori"));
		user.setProduct1(rs.getString("product1"));
		user.setProduct2(rs.getString("product2"));
		
		return user;
	}

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from user_comp");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public List<User_Comp> selectList(Connection conn, int firstRow, int endRow)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// [1] Select List Result Query
			pstmt = conn
					.prepareStatement("select * from user_comp order by username asc limit ?,?");
			pstmt.setInt(1, firstRow - 1);
			pstmt.setInt(2, endRow - firstRow + 1);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				List<User_Comp> userList = new ArrayList<User_Comp>();
				do {
					userList.add(setUserResult(rs));
				} while (rs.next());
				return userList;
			} else {
				return Collections.emptyList();
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	public int delete(Connection conn, String userId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// [1] DELETE
			pstmt = conn
					.prepareStatement("delete from user_comp where userid=?");
			pstmt.setString(1, userId);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	public int update(Connection conn, User_Comp user) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			// [1] Update
			pstmt = conn
					.prepareStatement("update user_comp set pwd=?, email=?, address=?, tel=?, telecom=?, mobile=?, fax=?  where userid=?");
			pstmt.setString(1, user.getPwd());
			pstmt.setString(2, user.getEmail1() + "@" + user.getEmail2());
			pstmt.setString(3,
					user.getMainAddress() + " " + user.getSubAddress());
			pstmt.setString(4, user.getTel1() + ")" + user.getTel2() + "-"
					+ user.getTel3());
			pstmt.setString(5, user.getTelecom());
			pstmt.setString(6, user.getMobile1() + "-" + user.getMobile2()
					+ "-" + user.getMobile3());
			pstmt.setString(7, user.getFax1() + "-" + user.getFax2()
					+ "-" + user.getFax3());
			pstmt.setString(8, user.getUserId());
			return pstmt.executeUpdate();

		} finally {
			JdbcUtil.close(pstmt);
		}
	}
}
