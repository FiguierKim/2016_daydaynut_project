package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import jdbc.util.JdbcUtil;
import model.TradeListView;
import model.Trade;

public class TradeDao {

	public int insert(Connection conn, Trade trade) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn
					.prepareStatement("insert into trade (pno, seller ,buyer, item, price, tradedate) values(?,?,?,?,?,?)");
			pstmt.setString(1, trade.getpNo());
			pstmt.setString(2, trade.getSeller());
			pstmt.setString(3, trade.getBuyer());
			pstmt.setString(4, trade.getItem());
			pstmt.setInt(5, trade.getPrice());
			pstmt.setTimestamp(6, new Timestamp(trade.getTradeDate().getTime()));
			return pstmt.executeUpdate();

		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	public Trade select(Connection conn, String pno) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn
					.prepareStatement("select * from trade where pno=?");
			pstmt.setString(1, pno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return setTradeResult(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int selectCount2(Connection conn, String buyer) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from trade where buyer='"+buyer+"'");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	protected Trade setTradeResult(ResultSet rs) throws SQLException {
		Trade trade = new Trade();

		trade.setTradeId(rs.getInt("tradeid"));
		trade.setSeller(rs.getString("seller"));
		trade.setBuyer(rs.getString("buyer"));
		trade.setItem(rs.getString("item"));
		trade.setPrice(rs.getInt("price"));
		trade.setTradeDate(rs.getTimestamp("tradedate"));

		return trade;
	}

	public int selectCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from trade");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public List<Trade> selectList(Connection conn, int firstRow, int endRow)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// [1] Select List Result Query
			pstmt = conn
					.prepareStatement("select * from trade order by tradename asc limit ?,?");
			pstmt.setInt(1, firstRow - 1);
			pstmt.setInt(2, endRow - firstRow + 1);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				List<Trade> tradeList = new ArrayList<Trade>();
				do {
					tradeList.add(setTradeResult(rs));
				} while (rs.next());
				return tradeList;
			} else {
				return Collections.emptyList();
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public List<Trade> selectListB(Connection conn, int firstRow, int endRow, String buyer)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// [1] Select List Result Query
			pstmt = conn
					.prepareStatement("select * from trade where buyer='" + buyer + "' order by tradeid asc limit ?,?");
			pstmt.setInt(1, firstRow - 1);
			pstmt.setInt(2, endRow - firstRow + 1);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				List<Trade> tradeList = new ArrayList<Trade>();
				do {
					tradeList.add(setTradeResult(rs));
				} while (rs.next());
				return tradeList;
			} else {
				return Collections.emptyList();
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	public int delete(Connection conn, String tradeId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			// [1] DELETE
			pstmt = conn.prepareStatement("delete from trade where tradeid=?");
			pstmt.setString(1, tradeId);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	private static final int MESSAGE_COUNT_PER_PAGE = 10;
	
	public TradeListView getTradeListM(Connection conn, int pageNumber, String buyer)
			throws Exception {
		int currentPageNumber = pageNumber;
		try {
			int postTotalCount = selectCount2(conn, buyer);

			List<Trade> tradeList = null;
			int firstRow = 0;
			int endRow = 0;
			if (postTotalCount > 0) {
				firstRow = (pageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
				tradeList = selectListB(conn, firstRow, endRow, buyer);
			} else {
				currentPageNumber = 0;
				tradeList = Collections.emptyList();
			}
			return new TradeListView(postTotalCount, currentPageNumber,
					tradeList, MESSAGE_COUNT_PER_PAGE, firstRow, endRow);
		} catch (SQLException e) {
			throw new Exception("Errors:" + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
}
