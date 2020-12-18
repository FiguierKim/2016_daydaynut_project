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
import model.User;

public class UserDao {

	public int insert(Connection conn, User user) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn
					.prepareStatement("insert into user (userid, pwd, categori, username, usernum, email, address, telecom, tel, mobile) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getPwd());
			pstmt.setString(3, user.getCategori());
			pstmt.setString(4, user.getUserName());
			pstmt.setString(5,
					user.getUserFirstNum() + "-" + user.getUserSecondNum());
			pstmt.setString(6, user.getEmail1() + "@" + user.getEmail2());
			pstmt.setString(7,
					user.getMainAddress() + " " + user.getSubAddress());
			pstmt.setString(8, user.getTel1() + ")" + user.getTel2() + "-"
					+ user.getTel3());
			pstmt.setString(9, user.getTelecom());
			pstmt.setString(10, user.getMobile1() + "-" + user.getMobile2()
					+ "-" + user.getMobile3());
			return pstmt.executeUpdate();

		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	public User select(Connection conn, String userId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from user where userid=?");
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

	protected User setUserResult(ResultSet rs) throws SQLException {
		User user = new User();

		user.setUserId(rs.getString("userid"));
		user.setPwd(rs.getString("pwd"));
		user.setCategori(rs.getString("categori"));
		user.setUserName(rs.getString("username"));
		user.setUserNum(rs.getString("usernum"));
		user.setEmail(rs.getString("email"));
		user.setAddress(rs.getString("address"));
		user.setTel(rs.getString("tel"));
		user.setTelecom(rs.getString("telecom"));
		user.setMobile(rs.getString("mobile"));

		return user;
	}

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from user");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public List<User> selectList(Connection conn, int firstRow, int endRow)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// [1] Select List Result Query
			pstmt = conn
					.prepareStatement("select * from user order by username asc limit ?,?");
			pstmt.setInt(1, firstRow - 1);
			pstmt.setInt(2, endRow - firstRow + 1);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				List<User> userList = new ArrayList<User>();
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
			pstmt = conn.prepareStatement("delete from user where userid=?");
			pstmt.setString(1, userId);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	public int update(Connection conn, User user) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			// [1] Update
			pstmt = conn
					.prepareStatement("update user set pwd=?, email =?,  Address=?, tel=?, telecom=?, mobile=? where userid=?");
			pstmt.setString(1, user.getPwd());
			pstmt.setString(2, user.getEmail1() + "@" + user.getEmail2());
			;
			pstmt.setString(2,
					user.getMainAddress() + " " + user.getSubAddress());
			pstmt.setString(3, user.getTel1() + ")" + user.getTel2() + "-"
					+ user.getTel3());
			pstmt.setString(4, user.getTelecom());
			pstmt.setString(5, user.getMobile1() + "-" + user.getMobile2()
					+ "-" + user.getMobile3());
			pstmt.setString(6, user.getUserId());
			return pstmt.executeUpdate();

		} finally {
			JdbcUtil.close(pstmt);
		}
	}
}
