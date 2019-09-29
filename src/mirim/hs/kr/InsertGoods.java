package mirim.hs.kr;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mirim.hs.kr.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
/**

* Servlet implementation class InsertGoods

*/

@WebServlet("/InsertGoods")

public class InsertGoods extends HttpServlet {

private static final long serialVersionUID = 1L;
/**
* @see HttpServlet#HttpServlet()
*/
	public InsertGoods() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.setCharacterEncoding("UTF-8");

	String path = request.getRealPath("/upload");

	System.out.println("path:"+ path);

					response.setContentType("text/html; charset=UTF-8");

					PrintWriter out = response.getWriter();

					int fileSize = 1024*1024*25;
					
					MultipartRequest multi = new MultipartRequest(request, path, fileSize, "UTF-8", new DefaultFileRenamePolicy());

					LogonDataBean g = new LogonDataBean();

					g.setId(multi.getParameter("id"));
					g.setTitle(multi.getParameter("title"));
					g.setTarget(multi.getParameter("target"));
					//g.setFiles(multi.getParameter("files"));
					g.setsDate(multi.getParameter("sDate"));
					g.seteDate(multi.getParameter("eDate"));
					g.setContent(multi.getParameter("content"));
					
					System.out.println(multi.getParameter("id")+multi.getParameter("title")+multi.getParameter("chk")+multi.getParameter("target"));

					g.setFiles(multi.getFilesystemName("files"));
					
					System.out.print(multi.getFilesystemName("files"));

					LogonDBBean dao = new LogonDBBean();

					try {
						dao.writeEvent(g);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					finally {
						response.sendRedirect("event.jsp");
					}
				}

			}
