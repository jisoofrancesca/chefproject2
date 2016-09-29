package com.dao;

import java.util.*;
import java.sql.*;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement ps;
	private final String URL="jdbc:oracle:thin:@211.238.142.77:1521:ORCL";
	
	public void BoardDAO(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDirver");			
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	
	public void getConnection(){
		try{
			conn=DriverManager.getConnection(URL,"scott","tiger");
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	
	public void disConnection(){
		try{
			if(ps!=null)ps.close();
			if(conn!=null)conn.close();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}
	}
	
	public List<BoardDTO> chefListData(int page){
		ArrayList<BoardDTO> list=new ArrayList();
		try{
			getConnection();
			String sql="SELECT no,name,subject,regdate,hit,group_tab,TO_CHAR(regdate,'YYYY-MM-DD'),kind "
					+ "FROM chef ORDER BY group_id DESC,group_step ASC,no DESC";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			
			int rowSize=5;
			int i=0, j=0;
			int pagecnt=(page*rowSize)-rowSize;
			while(rs.next()){
				if(i<rowSize && j>=pagecnt){
					BoardDTO d=new BoardDTO();
					d.setNo(rs.getInt(1));
					d.setName(rs.getString(2));
					d.setSubject(rs.getString(3));
					d.setRegdate(rs.getDate(4));
					d.setHit(rs.getInt(5));
					d.setGroup_tab(rs.getInt(6));
					d.setDbday(rs.getString(7));
					d.setKind(rs.getString(8));					
					list.add(d);
					i++;
				}
				j++;
			}
			rs.close();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}finally{
			disConnection();
		}
		return list;		
	}
	
	//한명의 자세한 내용보기
	   public BoardDTO chefContentData(int no){
	      BoardDTO d=new BoardDTO();
	      try{
	         getConnection();
	         //조회수 +1
	         String sql="UPDATE chef SET hit=hit+1 WHERE no=?";
	         ps=conn.prepareStatement(sql);
	         ps.setInt(1, no);
	         ps.executeUpdate();
	         ps.close();
	         
	         //원하는 사람의 데이터 가져오기
	         sql="SELECT no,name,subject,content,regdate,hit,kind FROM chef WHERE no=?";
	         ps=conn.prepareStatement(sql);
	         ps.setInt(1, no);
	         ResultSet rs=ps.executeQuery();
	         rs.next();
	         d.setNo(rs.getInt(1));
	         d.setName(rs.getString(2));
	         d.setSubject(rs.getString(3));
	         d.setContent(rs.getString(4));
	         d.setRegdate(rs.getDate(5));
	         d.setHit(rs.getInt(6));
	         d.setKind(rs.getString(7));
	         rs.close();
	         
	      }catch(Exception ex){
	         System.out.println(ex.getMessage());
	      }finally{
	         disConnection();
	      }
	      return d;
	   }
	
	
	public int boardTotal(){
		int total=0;
		try{
			getConnection();
			String sql="SELECT CEIL(COUNT(*)/5) FROM chef";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}finally{
			disConnection();
		}
		return total;
	}
	
	public int boardCount(){
		int total=0;
		try{
			getConnection();
			String sql="SELECT COUNT(*) FROM chef";
			ps=conn.prepareStatement(sql);
			ResultSet rs=ps.executeQuery();
			rs.next();
			total=rs.getInt(1);
			rs.close();
		}catch(Exception ex){
			System.out.println(ex.getMessage());
		}finally{
			disConnection();
		}
		return total;
	}
	
}
