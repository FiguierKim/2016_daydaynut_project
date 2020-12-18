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
import model.Post;
import model.PostListView;

public class SearchAllDao {
	
	// 硫붿떆吏�媛앹껜瑜��앹꽦
	protected Post makePostFromResultSet(ResultSet rs)
			throws SQLException { 
		Post post = new Post();
		post.setPostId(rs.getInt("postId"));
		post.setSaleCategory(rs.getString("saleCategory"));
		post.setItemCategory(rs.getString("itemCategory"));
		post.setMaker(rs.getString("maker"));
		post.setPassword(rs.getString("password"));
		post.setTitle(rs.getString("title"));
		post.setItemName(rs.getString("itemName"));
		post.setPrice(rs.getInt("price"));
		post.setTradeWay(rs.getString("tradeWay"));
		post.setPhone(rs.getString("phone"));
		post.setContent(rs.getString("content"));
		post.setMakeDate(rs.getTimestamp("makeDate"));
		post.setImageFile(rs.getString("imageFile"));
		return post;
	}
	//寃�깋 ��移댁슫��-> �섎� 湲곕컲�쇰줈 異쒕젰 ��媛�닔 怨꾩궛. �곹뭹踰붿＜, 寃�깋踰붿＜, 寃�깋�ㅼ썙�쒕� �뚮씪誘명꽣濡�諛쏆쓬
	public int selectCount(Connection conn, String saleCategory, String keyword) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from post where (title like '%"+keyword+"%' or content like '%"+keyword+"%' or itemname like '%"+keyword+"%') and salecategory='"+saleCategory+"'");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	//�대떦 議곌굔��留뚯”�섎뒗 �됱쓣 由ъ뒪�몄뿉 ��옣
	public List<Post> searchList(Connection conn, int firstRow, int endRow, String saleCategory, String keyword)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from post where (title like '%"+keyword+"%' or content like '%"+keyword+"%' or itemname like '%"+keyword+"%') and salecategory='"+saleCategory+"' order by postid desc limit ?, ?"); // first, last
			pstmt.setInt(1, firstRow - 1);
			pstmt.setInt(2, endRow - firstRow + 1);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				List<Post> postList = new ArrayList<Post>();
				do {
					postList.add(makePostFromResultSet(rs));
				} while (rs.next());
				return postList;
			} else {
				return Collections.emptyList();
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}


	private static final int MESSAGE_COUNT_PER_PAGE = 10;
		//寃�깋
		public PostListView getSearchList(Connection conn, int pageNumber, String saleCategory, String keyword)
				throws Exception {
			int currentPageNumber = pageNumber;
			try {
				int postTotalCount = selectCount(conn, saleCategory, keyword);
							
				List<Post> postList = null;
				int firstRow = 0;
				int endRow = 0;
				if (postTotalCount > 0) {
					firstRow = (pageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
					endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
					postList = searchList(conn, firstRow,  endRow, saleCategory, keyword);
				} else {
					currentPageNumber = 0;
					postList = Collections.emptyList();
				}
				return new PostListView(postTotalCount, currentPageNumber, postList, 
						MESSAGE_COUNT_PER_PAGE, firstRow, endRow);
			} catch (SQLException e) {
				throw new Exception("Errors:" + e.getMessage(), e);
			} finally {
				JdbcUtil.close(conn);
			}
		}
		
		
}
