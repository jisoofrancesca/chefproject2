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
	   
	   public void boardInsert(BoardDTO d){
			try{
				getConnection();
				if(d.getKind().equals(null)){
				String sql="INSERT INTO chef(no,name,subject,content,pwd,group_id) "
						+ "VALUES((SELECT NVL(MAX(no)+1,1) FROM chef),?,?,?,?,"
						+ "(SELECT NVL(MAX(group_id)+1,1) FROM chef))";
				ps=conn.prepareStatement(sql);
				ps.setString(1, d.getName());
				ps.setString(2, d.getSubject());
				ps.setString(3, d.getContent());
				ps.setString(4, d.getPwd());
				}else{
				String sql="INSERT INTO chef(no,name,subject,content,pwd,group_id,kind) "
						+ "VALUES((SELECT NVL(MAX(no)+1,1) FROM chef),?,?,?,?,"
						+ "(SELECT NVL(MAX(group_id)+1,1) FROM chef),?)";
				ps=conn.prepareStatement(sql);
				ps.setString(1, d.getName());
				ps.setString(2, d.getSubject());
				ps.setString(3, d.getContent());
				ps.setString(4, d.getPwd());
				ps.setString(5, d.getKind());
				}
				ps.executeUpdate();			
			}catch(Exception ex){
				System.out.println(ex.getMessage());
			}finally{
				disConnection();
			}
		}
	
	   public void boardReply(int root,BoardDTO dto){
			try{
				getConnection();
				// 답글을 달려는 글의 정보불러오기
				String sql="SELECT group_id,group_step,group_tab FROM chef WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, root);			
				ResultSet rs=ps.executeQuery();
				rs.next();
				int gi=rs.getInt(1);
				int gs=rs.getInt(2);
				int gt=rs.getInt(3);
				rs.close();
				ps.close();
				
				sql="UPDATE chef SET group_step=group_step+1 WHERE group_id=? AND group_step>?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, gi);
				ps.setInt(2, gs);
				ps.executeQuery();
				ps.close();
				
				sql="UPDATE chef SET depth=depth+1 WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, root);
				ps.executeUpdate();
				ps.close();
				
				sql="INSERT INTO chef(no,name,subject,content,pwd,group_id,group_step,group_tab,root,kind)"
						+ " VALUES ((SELECT NVL(MAX(no)+1,1) FROM chef),?,?,?,?,?,?,?,?,?)";
				ps=conn.prepareStatement(sql);
				ps.setString(1, dto.getName());
				ps.setString(2, dto.getSubject());
				ps.setString(3, dto.getContent());
				ps.setString(4, dto.getPwd());
				ps.setInt(5, gi);
				ps.setInt(6, gs+1);
				ps.setInt(7, gt+1);
				ps.setInt(8, root);
				ps.setString(9, dto.getKind());
				
				ps.executeUpdate();
				
			}catch(Exception ex){
				System.out.println(ex.getMessage());
			}finally{
				disConnection();
			}
		}
	
	 //글 삭제하기
		public boolean boardDelete(int no,String pwd){
			boolean bCheck=false;		
			try{			
				getConnection();
				// 패스워드 가져오기
				String sql="SELECT pwd FROM chef WHERE no=?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ResultSet rs=ps.executeQuery();
				rs.next();
				String db_pwd=rs.getString(1);
				rs.close();
				ps.close();
				
				// 패스워드 확인
				if(db_pwd.equals(pwd)){
					bCheck=true;
					// 루트 ???와 답글이 있는지 확인
					sql="SELECT root,depth FROM chef WHERE no=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, no);
					rs=ps.executeQuery();
					rs.next();
					int root=rs.getInt(1);
					int depth=rs.getInt(2);
					rs.close();
					ps.close();

					//답글이없는경우 삭제
					if(depth==0){
						sql="DELETE FROM chef WHERE no=?";
						ps=conn.prepareStatement(sql);
						ps.setInt(1, no);
						ps.executeUpdate();
						ps.close();
					}else{
						//Update
						sql="UPDATE chef SET subject=?,content=? WHERE no=?";
						String msg="삭제된 게시물입니다";
						ps=conn.prepareStatement(sql);
						ps.setString(1, msg);
						ps.setString(2, msg);
						ps.setInt(3, no);
						ps.executeUpdate();
						ps.close();
						
					}
					//depth -1
					sql="UPDATE chef SET depth=depth-1 WHERE no=?";
					ps=conn.prepareStatement(sql);
					ps.setInt(1, root);
					ps.executeUpdate();
					
					
				}else{
					bCheck=false;
				}
				
			}catch(Exception ex){
				System.out.println(ex.getMessage());
			}finally{
				disConnection();
			}
			return bCheck;
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
