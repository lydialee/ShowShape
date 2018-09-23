import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ShapeServ extends HttpServlet {

	private static final long serialVersionUID = 1L;
    
    public ShapeServ() {
        super();
        // TODO Auto-generated constructor stub
    }
	
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	String leMessage = request.getParameter("Message");
	String leShape = request.getParameter("Shape");
	String leColor = request.getParameter("Color");
	String leBGColor = request.getParameter("BGColor");
	String leX = request.getParameter("X");
	String leY = request.getParameter("Y");
	String leFTStyle = request.getParameter("FTStyle");
	String leFTSize = request.getParameter("FTSize");
//	  String leAppletX =request.getParameter("AppletX") ;
//      String leAppletY = request.getParameter("AppletY") ;

 
      
      request.getSession().setAttribute("message", leMessage);
//      request.getSession().setAttribute("appletheight", leAppletX);
//      request.getSession().setAttribute("appletwidth", leAppletY);
      request.getSession().setAttribute("fontSize", leFTSize);
      request.getSession().setAttribute("fontStyle", leFTStyle);
      request.getSession().setAttribute("Color", leColor);
      request.getSession().setAttribute("BGColor", leBGColor);
      request.getSession().setAttribute("shapeX", leX);
      request.getSession().setAttribute("shapeY", leY);
      request.getSession().setAttribute("Shape", leShape);

	  request.getRequestDispatcher("index.jsp").forward(request,response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
    
}
