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
	
	public ArrayList<LogonDataBean> borad(int chk) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		ArrayList<LogonDataBean> list = new ArrayList<LogonDataBean>();
		
		try {
			conn = getConnection();
			if(chk == 1) {
				sql = "select num, target, id, title, to_char(edate, 'YY/MM/DD') as edate from EVENTBOARD where sysdate < edate+1 order by num desc";
			}
			else if(chk == 2) {
				sql = "select num, target, id, title, to_char(edate, 'YY/MM/DD') as edate from EVENTBOARD where sysdate > edate+1 order by num desc";
			}
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
	
	public ArrayList<LogonDataBean> borad2(int chk, String choice) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		ArrayList<LogonDataBean> list = new ArrayList<LogonDataBean>();
		System.out.print(chk+"dd"+choice);
		
		try {
			conn = getConnection();
			if(chk == 1) {
				sql = "select num, target, id, title, to_char(edate, 'YY/MM/DD') as edate from EVENTBOARD where sysdate < edate+1 and target like '%"+choice+"%' order by num desc";
			}
			else if(chk == 2) {
				sql = "select num, target, id, title, to_char(edate, 'YY/MM/DD') as edate from EVENTBOARD where sysdate < edate+1 and title like '%"+choice+"%' order by num desc";
			}
			pstmt = conn.prepareStatement(sql);
			//pstmt.setString(1, choice);
			rs = pstmt.executeQuery();
			while(rs.next()){
					LogonDataBean logon = new LogonDataBean();
					logon.setNum(rs.getInt("num"));
					logon.setTarget(rs.getString("target"));
					logon.setTitle(rs.getString("title"));
					logon.setId(rs.getString("id"));
					logon.seteDate(rs.getString("edate"));
					System.out.print(rs.getInt("num")+rs.getString("target")+rs.getString("title"));
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
	
	public ArrayList<LogonDataBean> view2(int num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<LogonDataBean> list = new ArrayList<LogonDataBean>();
		
		try {
			conn = getConnection();
			String sql = "select * from JOINEVENT where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				LogonDataBean logon = new LogonDataBean();
				logon.setNum(rs.getInt("num"));
				logon.setTitle(rs.getString("title"));
				logon.setId(rs.getString("id"));
				logon.setContent(rs.getString("content"));
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
	
	public ArrayList<LogonDataBean> joinborad() throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		ArrayList<LogonDataBean> list = new ArrayList<LogonDataBean>();
		
		try {
			conn = getConnection();
				sql = "select num, id, title from JOINEVENT order by num desc";
			pstmt = conn.prepareStatement(sql);
			//pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while(rs.next()){
					LogonDataBean logon = new LogonDataBean();
					logon.setNum(rs.getInt("num"));
					logon.setTitle(rs.getString("title"));
					logon.setId(rs.getString("id"));
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
	
	public void joinEvent(LogonDataBean member) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		System.out.print(member.getId());
		try {
			conn = getConnection();
			String sql = "insert into JOINEVENT (id, title, content, files, chk, rnum) values(?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getTitle());
			pstmt.setString(3, member.getContent());
			pstmt.setString(4, member.getFiles());
			pstmt.setString(5, member.getChk());
			pstmt.setInt(6, member.getRnum());

			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e) {} }//if
			if(conn!=null){ try{ conn.close(); }catch(Exception e) {} }//if
		}
	
	}
	
	public String conChk(int num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String pass = "";
		
		try {
			conn = getConnection();
			String sql = "select chk from JOINEVENT where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pass = rs.getString("chk");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(rs!=null){ try{ rs.close(); } catch(Exception e) {} }//if
			if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e) {} }//if
			if(conn!=null){ try{ conn.close(); }catch(Exception e) {} }//if
		}
		
		return pass;
	}
	
	public ArrayList<LogonDataBean> showBoard(String id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		ArrayList<LogonDataBean> list = new ArrayList<LogonDataBean>();
		
		try {
			conn = getConnection();
			sql = "select num, target, title from EVENTBOARD where id = ? order by num desc";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
					LogonDataBean logon = new LogonDataBean();
					logon.setNum(rs.getInt("num"));
					logon.setTarget(rs.getString("target"));
					logon.setTitle(rs.getString("title"));
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
	
	public ArrayList<LogonDataBean> showBoard2(String id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		ArrayList<LogonDataBean> list = new ArrayList<LogonDataBean>();
		
		try {
			conn = getConnection();
			sql = "select num, id, title from JOINEVENT where rnum IN (select num from EVENTBOARD where id = ?) order by num desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
					LogonDataBean logon = new LogonDataBean();
					logon.setNum(rs.getInt("num"));
					logon.setTitle(rs.getString("title"));
					logon.setId(rs.getString("id"));
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
	
	public ArrayList<LogonDataBean> showBoard3(String id) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql="";
		ArrayList<LogonDataBean> list = new ArrayList<LogonDataBean>();
		
		try {
			conn = getConnection();
			sql = "select num, title from JOINEVENT where id = ? order by num desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
					LogonDataBean logon = new LogonDataBean();
					logon.setNum(rs.getInt("num"));
					logon.setTitle(rs.getString("title"));
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
	
	public ArrayList<LogonDataBean> result(int num) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<LogonDataBean> list = new ArrayList<LogonDataBean>();
		
		try {
			conn = getConnection();
			String sql = "select distinct id from (select distinct id from joinevent where rnum = ? order by dbms_random.value) where rownum <=1;";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if(rs.next()){
				LogonDataBean logon = new LogonDataBean();
				logon.setId(rs.getString("id"));
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
	
	public void delete(LogonDataBean member) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		//System.out.print(num);
		try {
			conn = getConnection();
			String sql = "delete from EVENTBOARD where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member.getNum());

			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e) {} }//if
			if(conn!=null){ try{ conn.close(); }catch(Exception e) {} }//if
		}
	
	}
	
	public void delete2(LogonDataBean member) throws Exception{
		Connection conn = null;
		PreparedStatement pstmt = null;
		//System.out.print(num);
		try {
			conn = getConnection();
			String sql = "delete from JOINEVENT where num = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, member.getNum());

			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			if(pstmt!=null){ try{ pstmt.close(); } catch(Exception e) {} }//if
			if(conn!=null){ try{ conn.close(); }catch(Exception e) {} }//if
		}
	
	}

}
