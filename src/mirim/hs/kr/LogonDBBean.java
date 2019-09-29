package mirim.hs.kr;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class LogonDBBean {
	
	private static LogonDBBean instance = new LogonDBBean();
	
	public static LogonDBBean getInstance() {
		return instance;
	}
	
	private Connection getConnection() throws Exception {
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "EVENT";
		String pass = "1234";
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection(url, user, pass);
		return conn;
	}
	
	public void insertMember(LogonDataBean member) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		 try {
			 conn = getConnection();
			 String sql = "insert into member values(?,?,?,?)";
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, member.getId());
			 pstmt.setString(2, member.getPw());
			 pstmt.setString(3, member.getName());
			 pstmt.setString(4, member.getEmail());
			 pstmt.executeUpdate();
		 }
		 catch (Exception e) {
			e.printStackTrace();
		 }
		 finally{
			if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e) {} }//if
			if(conn!=null){ try{ conn.close(); }catch(Exception e) {} }//if
		 }
	}
	
	public int userCheck(String id, String pw) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpass = "";
		int x = -1;
		
		try {
			conn = getConnection();
			String sql = "select pw from member where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpass = rs.getString("pw");
				if(dbpass.equals(pw)) {
					x = 1;
				}
				else {
					x = 0;
				}
			}
			else {
				x = -1;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(rs!=null){ try{ rs.close(); } catch(Exception e) {} }//if
			if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e) {} }//if
			if(conn!=null){ try{ conn.close(); }catch(Exception e) {} }//if
		}
		
		return x;
	}
	
	public void writeEvent(LogonDataBean member) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.print(member.getId());
		try {
			conn = getConnection();
			String sql = "insert into EVENTBOARD (id, target, title, content, sdate, edate, files, chk) values(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getTarget());
			pstmt.setString(3, member.getTitle());
			pstmt.setString(4, member.getContent());
			pstmt.setString(5, member.getsDate());
			pstmt.setString(6, member.geteDate());
			pstmt.setString(7, member.getFiles());
			pstmt.setString(8, member.getChk());

			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e) {} }//if
			if(conn!=null){ try{ conn.close(); }catch(Exception e) {} }//if
		}
	
	}
	
	public ArrayList<LogonDataBean> borad() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<LogonDataBean> list = new ArrayList<LogonDataBean>();
		
		try {
			conn = getConnection();
			String sql = "select num, target, id, title, to_char(edate, 'YY/MM/DD') as edate from EVENTBOARD order by num desc";
			pstmt = conn.prepareStatement(sql);
			//pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()){
					LogonDataBean logon = new LogonDataBean();
					logon.setNum(rs.getInt("num"));
					logon.setTarget(rs.getString("target"));
					logon.setTitle(rs.getString("title"));
					logon.setId(rs.getString("id"));
					logon.seteDate(rs.getString("edate"));
				   	list.add(logon);
					
				}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(rs!=null){ try{ rs.close(); } catch(Exception e) {} }//if
			if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e) {} }//if
			if(conn!=null){ try{ conn.close(); }catch(Exception e) {} }//if
		}
		return list;
		
	}
	
	public ArrayList<LogonDataBean> view(int num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<LogonDataBean> list = new ArrayList<LogonDataBean>();
		
		try {
			conn = getConnection();
			String sql = "select num, target, title, id, content, to_char(sdate, 'YY/MM/DD') as sdate, to_char(edate, 'YY/MM/DD') as edate, files, chk from EVENTBOARD where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				LogonDataBean logon = new LogonDataBean();
				logon.setNum(rs.getInt("num"));
				logon.setTarget(rs.getString("target"));
				logon.setTitle(rs.getString("title"));
				logon.setId(rs.getString("id"));
				logon.setContent(rs.getString("content"));
				logon.setsDate(rs.getString("sdate"));
				logon.seteDate(rs.getString("edate"));
				logon.setFiles(rs.getString("files"));
				logon.setChk(rs.getString("chk"));
				list.add(logon);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(rs!=null){ try{ rs.close(); } catch(Exception e) {} }//if
			if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e) {} }//if
			if(conn!=null){ try{ conn.close(); }catch(Exception e) {} }//if
		}
		return list;
		
	}

}
