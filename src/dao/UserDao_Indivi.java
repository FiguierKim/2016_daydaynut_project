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
import model.User_Indivi;

public class UserDao_Indivi {

	public int insert(Connection conn, User_Indivi user) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn
					.prepareStatement("insert into user_indivi (userid, pwd, username, usernum, email, address, bank, useraccount, telecom, tel, mobile) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)");
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getPwd());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4,
					user.getUserFirstNum() + "-" + user.getUserSecondNum());
			pstmt.setString(5, user.getEmail1() + "@" + user.getEmail2());
			pstmt.setString(6,
					user.getMainAddress() + " " + user.getSubAddress());
			pstmt.setString(7, user.getBank());
			pstmt.setString(8, user.getUserAccount());
			pstmt.setString(9, user.getTel1() + ")" + user.getTel2() + "-"
					+ user.getTel3());
			pstmt.setString(10, user.getTelecom());
			pstmt.setString(11, user.getMobile1() + "-" + user.getMobile2()
					+ "-" + user.getMobile3());
			return pstmt.executeUpdate();

		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	public User_Indivi select(Connection conn, String userId)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn
					.prepareStatement("select * from user_indivi where userid=?");
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
	
	public User_Indivi select2(Connection conn, String userName, String userNum) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from user_indivi where username = ? and usernum=? ");
			pstmt.setString(1, userName);
			pstmt.setString(2, userNum);
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

	protected User_Indivi setUserResult(ResultSet rs) throws SQLException {
		User_Indivi user = new User_Indivi();

		user.setUserId(rs.getString("userid"));
		user.setPwd(rs.getString("pwd"));
		user.setUserName(rs.getString("username"));
		user.setUserNum(rs.getString("usernum"));
		user.setEmail(rs.getString("email"));
		user.setAddress(rs.getString("address"));
		user.setBank(rs.getString("bank"));
		user.setUserAccount(rs.getString("useraccount"));
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
			rs = stmt.executeQuery("select count(*) from user_indivi");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public List<User_Indivi> selectList(Connection conn, int firstRow,
			int endRow) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// [1] Select List Result Query
			pstmt = conn
					.prepareStatement("select * from user_indivi order by username asc limit ?,?");
			pstmt.setInt(1, firstRow - 1);
			pstmt.setInt(2, endRow - firstRow + 1);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				List<User_Indivi> userList = new ArrayList<User_Indivi>();
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
					.prepareStatement("delete from user_indivi where userid=?");
			pstmt.setString(1, userId);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	public int update(Connection conn, User_Indivi user) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			// [1] Update
			pstmt = conn
					.prepareStatement("update user_indivi set pwd=?, email =?,  Address=?, bank=?, useraccount=?, tel=?, telecom=?, mobile=? where userid=?");
			pstmt.setString(1, user.getPwd());
			pstmt.setString(2, user.getEmail1() + "@" + user.getEmail2());
			pstmt.setString(3,
					user.getMainAddress() + " " + user.getSubAddress());
			pstmt.setString(4, user.getBank());
			pstmt.setString(5, user.getUserAccount());
			pstmt.setString(6, user.getTel1() + ")" + user.getTel2() + "-"
					+ user.getTel3());
			pstmt.setString(7, user.getTelecom());
			pstmt.setString(8, user.getMobile1() + "-" + user.getMobile2()
					+ "-" + user.getMobile3());
			pstmt.setString(9, user.getUserId());
			return pstmt.executeUpdate();

		} finally {
			JdbcUtil.close(pstmt);
		}
	}
}
