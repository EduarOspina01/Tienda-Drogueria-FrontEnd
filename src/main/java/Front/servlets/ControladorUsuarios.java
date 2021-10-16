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
import javax.servlet.http.HttpSession;

import Front.modelo.Usuarios;
import Front.modelo.UsuariosJSON;


@WebServlet("/ControladorUsuarios")
public class ControladorUsuarios extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorUsuarios() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession sesionuser = (HttpSession) request.getSession();
		Usuarios sesion = (Usuarios) sesionuser.getAttribute("sesion");
		
		
		PrintWriter out = response.getWriter();
		String cedula = request.getParameter("cedula");
		String nombre = request.getParameter("nombre");
		String email = request.getParameter("email");
		String usuario = request.getParameter("user");
		String contrasena = request.getParameter("pass");
		//botones
		String consultar = request.getParameter("Buscar");
		String Agregar = request.getParameter("Agregar");
		String Listar = request.getParameter("Listar_Usuarios");
		String eliminar = request.getParameter("Eliminar");
		String modificar = request.getParameter("Actualizar");
		
		if (Listar != null) {
			try {
				ArrayList<Usuarios> lista = UsuariosJSON.getJSON();
				request.setAttribute("lista", lista);
				request.getRequestDispatcher("Usuario.jsp").forward(request, response);
			} catch (Exception e) {
				out.println("Catch :(");
				// TODO: handle exception
			}
		}
		if (consultar != null) {
			if (cedula != "" && cedula != null) {
				boolean existe = false;					
				try {
					ArrayList<Usuarios> lista = UsuariosJSON.getJSON();
					for (Usuarios usuario_prueba: lista) {
						if(usuario_prueba.getCedula_usuario() == Long.parseLong(cedula)) {
							existe = true;
						}
					}
					if(!existe) {
						request.setAttribute("validacion", 8);//El usuario no existe
						request.getRequestDispatcher("/Usuario.jsp").forward(request, response);
					}else {
						ArrayList<Usuarios> listaid = UsuariosJSON.getforIdJSON(cedula);
						for(Usuarios user:listaid) {
							request.setAttribute("usuarios", user );
							request.getRequestDispatcher("Usuario.jsp").forward(request, response);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					out.println("Catch :(");
					out.println(cedula);
					// TODO: handle exception
				}
			}else {
				request.setAttribute("validacion", 0);//Ingrese el campo cedula
				request.getRequestDispatcher("/Usuario.jsp").forward(request, response);
			}
		}
		if (Agregar != null) {
			if (cedula != "" && nombre != "" && email != "" && usuario != "" && contrasena != "" && cedula != null && nombre != null && email != null && usuario != null && contrasena != null) {
				System.out.println("Entro If");
				boolean existe = false;
				try {
					ArrayList<Usuarios> listaid = UsuariosJSON.getforIdJSON(cedula);
					for (Usuarios usuario_prueba: listaid) {
						if(usuario_prueba.getCedula_usuario() == Long.parseLong(cedula)) {
							existe = true;
						}
					}
				} catch (Exception e) {
					out.println("Catch :(");
					out.println(cedula);
					// TODO: handle exception
				}
				if (!existe) {
					Usuarios user = new Usuarios();
					user.setCedula_usuario(Long.parseLong(cedula));
					user.setEmail_usuario(email);
					user.setNombre_usuario(nombre);
					user.setPassword(contrasena);
					user.setUsuario(usuario);
					int creado = UsuariosJSON.postJSON(user);
					System.out.println(creado);
					if(creado == 200) {
						request.setAttribute("validacion", 2);//Usuario Creado
						request.getRequestDispatcher("/Usuario.jsp").forward(request, response);
					}else {
						request.setAttribute("validacion", 3);//Ha habido un error
						request.getRequestDispatcher("/Usuario.jsp").forward(request, response);
					}
				}else {
					request.setAttribute("validacion", 4);//El usuario ya existe
					request.getRequestDispatcher("/Usuario.jsp").forward(request, response);
				}	
			} else {
				request.setAttribute("validacion", 1);//Ingrese todos los campos
				request.getRequestDispatcher("/Usuario.jsp").forward(request, response);
			}
		}
		if (eliminar != null) {
			if (cedula != "" && cedula != null) {
				boolean existe = false;					
				try {
					ArrayList<Usuarios> lista = UsuariosJSON.getJSON();
					for (Usuarios usuario_prueba: lista) {
						if(usuario_prueba.getCedula_usuario() == Long.parseLong(cedula)) {
							existe = true;
						}
					}
					if(!existe) {
						request.setAttribute("validacion", 8);//El usuario no existe
						request.getRequestDispatcher("/Usuario.jsp").forward(request, response);
					}else {
						int borrado = UsuariosJSON.deleteJSON(cedula);
						if(borrado == 200) {
							request.setAttribute("validacion", 5);//Usuario Borrado
							request.getRequestDispatcher("/Usuario.jsp").forward(request, response);
						}else {
							request.setAttribute("validacion", 3);//Ha habido un error
							request.getRequestDispatcher("/Usuario.jsp").forward(request, response);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					out.println("Catch :(");
					out.println(cedula);
					// TODO: handle exception
				}
			} else {
				request.setAttribute("validacion", 0);//Ingrese el campo cedula
				request.getRequestDispatcher("/Usuario.jsp").forward(request, response);
			}
		}
		if (modificar != null) {
			if (cedula != "" && nombre != "" && email != "" && usuario != "" && contrasena != "" && cedula != null && nombre != null && email != null && usuario != null && contrasena != null) {
				System.out.println("Entro If");
				boolean existe = false;
				try {
					ArrayList<Usuarios> listaid = UsuariosJSON.getforIdJSON(cedula);
					for (Usuarios usuario_prueba: listaid) {
						if(usuario_prueba.getCedula_usuario() == Long.parseLong(cedula)) {
							existe = true;
						}
					}
				} catch (Exception e) {
					out.println("Catch :(");
					out.println(cedula);
					// TODO: handle exception
				}
				if (existe) {
					Usuarios user = new Usuarios();
					user.setCedula_usuario(Long.parseLong(cedula));
					user.setEmail_usuario(email);
					user.setNombre_usuario(nombre);
					user.setPassword(contrasena);
					user.setUsuario(usuario);
					int creado = UsuariosJSON.postJSON(user);
					System.out.println(creado);
					if(creado == 200) {
						request.setAttribute("validacion", 6);//Usuario Modificado
						request.getRequestDispatcher("/Usuario.jsp").forward(request, response);
					}else {
						request.setAttribute("validacion", 3);//Ha habido un error
						request.getRequestDispatcher("/Usuario.jsp").forward(request, response);
					}
				}else {
					request.setAttribute("validacion", 7);//El usuario no existe no se puede modificar
					request.getRequestDispatcher("/Usuario.jsp").forward(request, response);
				}	
			} else {
				request.setAttribute("validacion", 9);//Ingrese todos los campos
				request.getRequestDispatcher("/Usuario.jsp").forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
