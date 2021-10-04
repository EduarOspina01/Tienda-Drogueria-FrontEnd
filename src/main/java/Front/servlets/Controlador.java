package Front.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.ParseException;

import Front.modelo.Usuarios;
import Front.modelo.UsuariosJSON;


@WebServlet("/Controlador")
public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Controlador() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String accion = request.getParameter("accion");
		if(accion.equals("Ingresar")) {
			this.validarUsuarios(request, response);
		}
		if(accion.equals("Menu")) {
			this.redireccionarMenu(request, response);
		}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	public void validarUsuarios(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		try {
			ArrayList<Usuarios> lista = UsuariosJSON.getJSON();
			String usuario = "";
			String password = "";
			usuario = request.getParameter("txtUsuario"); // Recibe informacion del formulario
			password = request.getParameter("txtContrasena"); // Recibe informacion del formulario
			if((usuario != "")&& (password != "")) {
				for (Usuarios user: lista) {
					if (user.getUsuario().equals(usuario) && user.getPassword().equals(password)) {
						request.setAttribute("usuario", user);
						request.getRequestDispatcher("/Controlador?accion=Menu&menu=Principal").forward(request, response);
					}
				}
				request.setAttribute("validacion",0);
				request.getRequestDispatcher("/Index.jsp").forward(request, response);
				
			}else {
				request.setAttribute("validacion",1);
				request.getRequestDispatcher("/Index.jsp").forward(request, response);
				
			}
		} catch (IOException e) {
			out.println(" No entro al try");
			e.printStackTrace();
		} catch (ParseException e) {
			out.println(" No entro al try");
			e.printStackTrace();
		}
	}
	
	public void redireccionarMenu(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String menu = request.getParameter("menu");
		if (menu.equals("Principal")) {
			request.getRequestDispatcher("Menu.jsp").forward(request, response);
		}
		if (menu.equals("Usuario")) {
			request.getRequestDispatcher("Usuario.jsp").forward(request, response);
			
		}
		if (menu.equals("Cliente")) {
			request.getRequestDispatcher("Cliente.jsp").forward(request, response);
		}
		if (menu.equals("Proveedor")) {
			request.getRequestDispatcher("Proveedores.jsp").forward(request, response);
		}
		if (menu.equals("Productos")) {
			request.getRequestDispatcher("Productos.jsp").forward(request, response);
		}
		if (menu.equals("Ventas")) {
			out.println("<h1>Aqui va la interfaz Ventas</h1>");
			//request.getRequestDispatcher("Usuario.jsp").forward(request, response);
		}
		if (menu.equals("Reportes")) {
			out.println("<h1>Aqui va la interfaz Reportes</h1>");
			//request.getRequestDispatcher("Usuario.jsp").forward(request, response);
		}
		if (menu.equals("Salir")) {
			request.getRequestDispatcher("Index.jsp").forward(request, response);
		}
	}
}
