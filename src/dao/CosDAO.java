package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CosDTO;

public class CosDAO {
	private static CosDAO instance;
	
	private CosDAO() {}
	
	public synchronized static CosDAO getInstance() {
		if(instance==null) {
			instance = new CosDAO();
		}
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public String getPlaceAddress(String placeName) throws Exception {
		String sql = "select address1 from walk_place where place_name=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setNString(1, placeName);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				rs.next();
				
				return rs.getNString("address1");
			}
			
		}
	}
	
	public CosDTO getAllAddress (String place_name) throws Exception {
		String sql = "select postcode, address1, address2 from walk_place where place_name=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setNString(1, place_name);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				if(rs.next()) {
					return new CosDTO(rs.getNString("postcode"),rs.getNString("address1"));
				}else {
					return null;
				}
			}
		}
	}
	
	public String getPlace_Name(String address1) throws Exception {
		String sql = "select place_name from walk_place where address1=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setNString(1, address1);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				if(rs.next()) {
					return rs.getNString("place_name");
				}else {
					return null;
				}
			}
		}
	}
	
	// 경태꺼
	public List<CosDTO> getCosList(String courseArea) throws Exception{
		String sql="select * from course where course_area=?";
		try(Connection con= this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1,courseArea);
			try(ResultSet rs=pstat.executeQuery();){
			List<CosDTO> list = new ArrayList<>();
			while(rs.next()) {
				int seq = rs.getInt("seq");
				String course_area = rs.getString("course_area");
				String course_name = rs.getString("course_name");
				String address1 = rs.getString("address1");
				String postcode = rs.getString("postcode");
				String oriName= rs.getString("oriName");
				String sysName= rs.getString("sysName");
				String explain = rs.getString("explain");
				String ex_time = rs.getString("ex_time");
				String ex_way = rs.getString("ex_way");
				list.add(new CosDTO(seq,course_area,course_name,address1,postcode, oriName,sysName,explain, ex_time, ex_way));
			}
			return list;
			}
		}
	}
	
	public CosDTO getSearchList(String courseName) throws Exception{
		String sql="select * from course where course_name=?";
		try(Connection con= this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1,courseName);
			try(ResultSet rs=pstat.executeQuery();){
			while(rs.next()) {
				int seq = rs.getInt("seq");
				String course_area = rs.getString("course_area");
				String course_name = rs.getString("course_name");
				String address1 = rs.getString("address1");
				String postcode = rs.getString("postcode");
				String oriName= rs.getString("oriName");
				String sysName= rs.getString("sysName");
				String explain = rs.getString("explain");
				String ex_time = rs.getString("ex_time");
				String ex_way = rs.getString("ex_way");
				return new CosDTO(seq,course_area,course_name,address1,postcode,oriName,sysName, explain, ex_time, ex_way);
			}
			}
		}
		return null;
	}
	
	public int insert(CosDTO dto)throws Exception{
		String sql="insert into course values(course_seq.nextval,?,?,?,?,?,?,?,?,?)";
		try(Connection con= this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setString(1, dto.getCourse_area());
			pstat.setString(2, dto.getCourse_name());
			pstat.setString(3, dto.getAddress1());
			pstat.setString(4, dto.getPostcode());
			pstat.setString(5, dto.getOriName());
			pstat.setString(6, dto.getSysName());
			pstat.setString(7, dto.getExplain());
			pstat.setString(8, dto.getEx_time());
			pstat.setString(9, dto.getEx_way());
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public List<CosDTO> getAllList() throws Exception{
		String sql="select * from course";
		try(Connection con= this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs=pstat.executeQuery();
				){
			List<CosDTO> list = new ArrayList<>();
			while(rs.next()) {
				int seq = rs.getInt("seq");
				String course_area = rs.getString("course_area");
				String course_name = rs.getString("course_name");
				String address1 = rs.getString("address1");
				String postcode = rs.getString("postcode");
				String oriName= rs.getString("oriName");
				String sysName= rs.getString("sysName");
				String explain = rs.getString("explain");
				String ex_time = rs.getString("ex_time");
				String ex_way = rs.getString("ex_way");
				list.add(new CosDTO(seq,course_area,course_name,address1,postcode,oriName,sysName, explain, ex_time, ex_way));
			}
			return list;
			}
		
	}
	
	public List<CosDTO> search(String keyword) throws Exception{
		String sql = "select * from course where course_area like ? or course_name like ? or address1 like ? order by 2,3";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, "%"+keyword+"%");
			pstat.setString(2, "%"+keyword+"%");
			pstat.setString(3, "%"+keyword+"%");
			try(ResultSet rs = pstat.executeQuery();){
				List<CosDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt("seq");
					String course_area = rs.getString("course_area");
					String course_name = rs.getString("course_name");
					String address1 = rs.getString("address1");
					String postcode = rs.getString("postcode");
					String oriName= rs.getString("oriName");
					String sysName= rs.getString("sysName");
					String explain = rs.getString("explain");
					String ex_time = rs.getString("ex_time");
					String ex_way = rs.getString("ex_way");
					list.add(new CosDTO(seq,course_area,course_name,address1,postcode,oriName,sysName,explain, ex_time, ex_way));
				}
				return list;
			}
			
		}
	}
}
