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
import model.Post;
import model.PostListView;

public class PostDao {

	public int insert(Connection conn, Post post) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn
					.prepareStatement("insert into post (salecategory, itemcategory, maker, password, title, itemname, price, tradeway, phone, content, makedate, imagefile) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			pstmt.setString(1, post.getSaleCategory());
			pstmt.setString(2, post.getItemCategory());
			pstmt.setString(3, post.getMaker());
			pstmt.setString(4, post.getPassword());
			pstmt.setString(5, post.getTitle());
			pstmt.setString(6, post.getItemName());
			pstmt.setInt(7, post.getPrice());
			pstmt.setString(8, post.getTradeWay());
			pstmt.setString(9, post.getPhone());
			pstmt.setString(10, post.getContent());
			pstmt.setTimestamp(11, new Timestamp(post.getMakeDate().getTime()));
			pstmt.setString(12, post.getImageFile());

			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	public Post select(Connection conn, String id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from post where postid = ? ");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return makePostFromResultSet(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public Post select2(Connection conn, String maker) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from post where maker = ? ");
			pstmt.setString(1, maker);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return makePostFromResultSet(rs);
			} else {
				return null;
			}
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}

	protected Post makePostFromResultSet(ResultSet rs)
			throws SQLException { // 硫붿떆吏�媛앹껜瑜�留뚮뱾��
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
	//�꾩껜 ��移댁슫��
	public int selectCount(Connection conn, String saleCategory) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from post where salecategory='"+saleCategory+"'");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}

	public int selectCount2(Connection conn, String maker) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("select count(*) from post where maker='"+maker+"'");
			rs.next();
			return rs.getInt(1);
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(stmt);
		}
	}
	
	//�대떦 移댄뀒怨좊━ 移댁슫��
		public int selectCount(Connection conn, String itemCategory, String saleCategory) throws SQLException {
			Statement stmt = null;
			ResultSet rs = null;
			String ic = itemCategory;
			String sc = saleCategory;
			try {
				stmt = conn.createStatement();
				rs = stmt.executeQuery("select count(*) from post where itemcategory='"+ic+"'and salecategory='"+sc+"' ");
				rs.next();
				return rs.getInt(1);
			} finally {
				JdbcUtil.close(rs);
				JdbcUtil.close(stmt);
			}
		}
		
	//�꾩껜 紐⑸줉 �좏깮
	public List<Post> selectList(Connection conn, int firstRow, int endRow, String saleCategory)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from post where salecategory='"+saleCategory+"' order by postid desc limit ?, ?"); // first, last
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
	
	public List<Post> selectListM(Connection conn, int firstRow, int endRow, String maker)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from post where maker='"+maker+"' order by postid desc limit ?, ?"); // first, last
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
	
	//�대떦 移댄뀒怨좊━ 紐⑸줉 �좏깮
	public List<Post> selectList(Connection conn, int firstRow, int endRow, String itemCategory, String saleCategory)
			throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("select * from post where itemcategory=? and salecategory='"+saleCategory+"' order by postid desc limit ?, ?"); // first, last
			pstmt.setString(1, itemCategory);
			pstmt.setInt(2, firstRow - 1);
			pstmt.setInt(3, endRow - firstRow + 1);
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
	
	

	public int delete(Connection conn, String postId) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn
					.prepareStatement("delete from post where postid = ?");
			pstmt.setString(1, postId);
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public int update(Connection conn, Post post) throws SQLException {
		PreparedStatement pstmt = null;
		try {
			pstmt = conn
					.prepareStatement("update post set salecategory=?, itemcategory=?, maker=?, password=?, title=?, itemname=?, price=?, tradeway=?, phone=?, content=?, makedate=?, imagefile=? where postid=?");
			
			pstmt.setString(1, post.getSaleCategory());
			pstmt.setString(2, post.getItemCategory());
			pstmt.setString(3, post.getMaker());
			pstmt.setString(4, post.getPassword());
			pstmt.setString(5, post.getTitle());
			pstmt.setString(6, post.getItemName());
			pstmt.setInt(7, post.getPrice());
			pstmt.setString(8, post.getTradeWay());
			pstmt.setString(9, post.getPhone());
			pstmt.setString(10, post.getContent());
			pstmt.setTimestamp(11, new Timestamp(post.getMakeDate().getTime()));
			pstmt.setString(12, post.getImageFile());
			pstmt.setInt(13, post.getPostId());
			return pstmt.executeUpdate();
		} finally {
			JdbcUtil.close(pstmt);
		}
	}

	private static final int MESSAGE_COUNT_PER_PAGE = 10;
	//�꾩껜 紐⑸줉 �앹꽦
	public PostListView getPostList(Connection conn, int pageNumber, String saleCategory)
			throws Exception {
		int currentPageNumber = pageNumber;
		try {
			int postTotalCount = selectCount(conn, saleCategory);

			List<Post> postList = null;
			int firstRow = 0;
			int endRow = 0;
			if (postTotalCount > 0) {
				firstRow = (pageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
				postList = selectList(conn, firstRow, endRow, saleCategory);
			} else {
				currentPageNumber = 0;
				postList = Collections.emptyList();
			}
			return new PostListView(postTotalCount, currentPageNumber,
					postList, MESSAGE_COUNT_PER_PAGE, firstRow, endRow);
		} catch (SQLException e) {
			throw new Exception("Errors:" + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	public PostListView getPostListM(Connection conn, int pageNumber, String maker)
			throws Exception {
		int currentPageNumber = pageNumber;
		try {
			int postTotalCount = selectCount2(conn, maker);

			List<Post> postList = null;
			int firstRow = 0;
			int endRow = 0;
			if (postTotalCount > 0) {
				firstRow = (pageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
				postList = selectListM(conn, firstRow, endRow, maker);
			} else {
				currentPageNumber = 0;
				postList = Collections.emptyList();
			}
			return new PostListView(postTotalCount, currentPageNumber,
					postList, MESSAGE_COUNT_PER_PAGE, firstRow, endRow);
		} catch (SQLException e) {
			throw new Exception("Errors:" + e.getMessage(), e);
		} finally {
			JdbcUtil.close(conn);
		}
	}
	
	//�대떦 移댄뀒怨좊━ 紐⑸줉 �앹꽦
	public PostListView getPostList(Connection conn, int pageNumber, String itemCategory, String saleCategory)
			throws Exception {
		int currentPageNumber = pageNumber;
		try {
			int postTotalCount = selectCount(conn, itemCategory, saleCategory);

			List<Post> postList = null;
			int firstRow = 0;
			int endRow = 0;
			if (postTotalCount > 0) {
				firstRow = (pageNumber - 1) * MESSAGE_COUNT_PER_PAGE + 1;
				endRow = firstRow + MESSAGE_COUNT_PER_PAGE - 1;
				postList = selectList(conn, firstRow, endRow, itemCategory, saleCategory);
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
