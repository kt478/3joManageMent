package dao;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.PersonDTO;

public class PersonDAO {

	private static PersonDAO instance = null;

	public synchronized static PersonDAO getInstance(){		
		if(instance==null) {
			instance = new PersonDAO();
		}
		return instance; //싱글톤 적용
	}

	private PersonDAO() {}
	private Connection getConnection()throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	public static String getSHA512(String pw){ //암호화 복호화 메서드
		String toReturn = null;
		try {
			MessageDigest digest = MessageDigest.getInstance("SHA-512");
			digest.reset();
			digest.update(pw.getBytes("utf8"));
			toReturn = String.format("%064x", new BigInteger(1, digest.digest()));
		} catch (Exception e) {
			e.printStackTrace();
		}

		return toReturn;
	}


	public boolean isIdExist(String id)throws Exception{ //idCheck기능 사용가능한지를 알려주는 Boolean으로 
		String sql = "select * from person_info where Id=?";
		try(Connection con =this.getConnection();
				PreparedStatement pstat= con.prepareStatement(sql);){
			pstat.setNString(1, id);
			try(ResultSet rs = pstat.executeQuery()){
				return rs.next();
			}

		}
	}

	public int signup(PersonDTO dto) throws Exception {
		String sql = "insert into person_info values(?,?,?,?,?,?,?,?,?,?,sysdate)";

		try(Connection con =this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setString(1,dto.getId());
			pstat.setString(2,dto.getPw());
			pstat.setNString(3, dto.getEmail());
			pstat.setString(4,dto.getPerson_name());
			pstat.setString(5,dto.getPerson_age());
			pstat.setString(6,dto.getPerson_gender());
			pstat.setString(7,dto.getLocal());
			pstat.setString(8,dto.getContact());
			pstat.setString(9,dto.getPerson_sysName());
			pstat.setString(10,dto.getPerson_oriName());

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}

	}
	public List<PersonDTO> filesById(String id)throws Exception{
		String sql ="select * from person_info where id=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setNString(1, id);
			try(ResultSet rs = pstat.executeQuery()){
				List<PersonDTO> ilist =new ArrayList<>();
				while(rs.next()) {
					String image_id = rs.getNString("id");
					String oriName= rs.getNString("person_oriName");
					String sysName= rs.getNString("person_sysName");
					ilist.add(new PersonDTO(image_id,oriName,sysName));
				}
				return ilist;
			}
		}
	}
	
	public PersonDTO login(String id, String pw)throws Exception {
		String sql = "select * from person_info where id=? and pw=?";
		try(Connection con =this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setNString(1, id);
			pstat.setNString(2,pw);
			try(ResultSet rs=pstat.executeQuery();){
				if(rs.next()) {
					String loginId = rs.getNString("id");
					String name = rs.getNString("person_name");
					String local = rs.getNString("local");
					String gender = rs.getNString("person_gender");
					
					return new PersonDTO(loginId, name, local, gender);
				}
			}
		}
		return null;
	}
	public List <PersonDTO> memberList(String id)throws Exception {
		String sql ="select * from person_info where id=?";
		try(Connection con =this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setNString(1, id);
			try(ResultSet rs =pstat.executeQuery()){
				List<PersonDTO> list = new ArrayList<>();

				while(rs.next()) {
					
					String id2 =rs.getNString("id");
					String pw =rs.getNString("pw");
					String email = rs.getNString("email");
					String person_name=rs.getNString("person_name");
					String person_age=rs.getNString("person_age");
					String person_gender=rs.getNString("person_gender");
					String local=rs.getString("local");
					String contact=rs.getNString("contact");
					String person_sysName=rs.getNString("person_sysname");
					String person_oriName=rs.getNString("person_oriname");
					Date reg_date=rs.getDate("reg_date");

					list.add(new PersonDTO(id2,pw,person_name,email,person_age,person_gender,local,contact,person_sysName,person_oriName,reg_date));

				}
				return list;
			}
		}

	}
	public int infomodify(PersonDTO dto)throws Exception {

		String sql ="update person_info set pw=?, email=?, person_name=?, person_age=?, person_gender=?, local=?, contact=?, person_sysName=?, person_oriName=? where id=? ";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setNString(1, dto.getPw());
			pstat.setNString(2, dto.getEmail());
			pstat.setNString(3, dto.getPerson_name());
			pstat.setNString(4, dto.getPerson_age());
			pstat.setNString(5, dto.getPerson_gender());
			pstat.setNString(6, dto.getLocal());
			pstat.setNString(7, dto.getContact());
			pstat.setNString(8, dto.getPerson_sysName());
			pstat.setNString(9, dto.getPerson_oriName());
			pstat.setNString(10, dto.getId());
			
			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}
	}
	
	public PersonDTO information(String otehrId) throws Exception {
		String sql = "select person_name, person_age, person_gender from person_info where id=?";
		try(
				Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				){
			pstat.setNString(1, otehrId);
			try(
					ResultSet rs = pstat.executeQuery();
					){
				if(rs.next()) {
					String name = rs.getNString("person_name");
					String age = rs.getNString("person_age");
					String gender = rs.getNString("person_gender");
					
					return new PersonDTO(name, age, gender);
				}else{
					return null;
				}
			}
		}
	}
}
