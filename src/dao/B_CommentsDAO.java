package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.B_CommentsDTO;

public class B_CommentsDAO {
	
	private static B_CommentsDAO instance;
	private B_CommentsDAO() {}
	public synchronized static B_CommentsDAO getInstance() {
		if (instance == null) {
			instance = new B_CommentsDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	

	public int insertCmt(B_CommentsDTO dto) throws Exception {
		String sql = "insert into fb_comments values(fb_comments_seq.nextval, ?, ?, sysdate, ?)";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, dto.getWriter());
			pstat.setString(2, dto.getComments());
			pstat.setInt(3, dto.getParent_seq());

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public List<B_CommentsDTO> getCommentsList(int parent_seq) throws Exception {
		String sql = "select * from fb_comments where parent_seq=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, parent_seq);
			try (ResultSet rs = pstat.executeQuery();) {
				List<B_CommentsDTO> list = new ArrayList<>();

				while (rs.next()) {
					B_CommentsDTO dto = new B_CommentsDTO();

					dto.setSeq(rs.getInt("seq"));
					dto.setWriter(rs.getString("writer"));
					dto.setComments(rs.getString("comments"));
					dto.setWrite_date(rs.getDate("write_date"));
					dto.setParent_seq(rs.getInt("parent_seq"));

					list.add(dto);
				}
				return list;
			}
		}
	}

	public int modifyCmt(int seq, String comments) throws Exception {
		String sql = "update fb_comments set comments=? where seq=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setString(1, comments);
			pstat.setInt(2, seq);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public int deleteCmt(int seq) throws Exception {
		String sql = "delete from fb_comments where seq=?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql);) {
			pstat.setInt(1, seq);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}

	public int countCmt(int parent_seq) throws Exception{
		String sql = "select count(seq) from fb_comments where parent_seq=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setInt(1, parent_seq);
			
			int result= pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
}
