package Front.servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Front.modelo.Clientes;
import Front.modelo.ClientesJSON;
import Front.modelo.Usuarios;
import Front.modelo.UsuariosJSON;
import Front.modelo.Ventas;
import Front.modelo.VentasJSON;

@WebServlet("/ControladorReportes")
public class ControladorReportes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControladorReportes() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String btnUsuarios = request.getParameter("listar_usuarios");
		String btnClientes = request.getParameter("listar_clientes");
		String btnVentas = request.getParameter("listar_ventas");
		String btnCedCliente = request.getParameter("cedula");
		
		if(btnUsuarios != null) {
			ArrayList<Usuarios> lista = new ArrayList<Usuarios>();
			try {
				ArrayList<Usuarios> listaprov = UsuariosJSON.getJSON();
				for(Usuarios user : listaprov) {
					if(!user.getUsuario().equals("admininicial")) {
						lista.add(user);
					}
				}
				if(lista.isEmpty()) {
					request.setAttribute("validacion", 0);
					request.getRequestDispatcher("Reportes.jsp").forward(request, response);
				}else {
					request.setAttribute("reporte", 0);
					request.setAttribute("lista", lista);
					request.getRequestDispatcher("Reportes.jsp").forward(request, response);
				}
			} catch (Exception e) {
				System.out.println("Catch :(");
				// TODO: handle exception
			}
		}else if (btnClientes != null) {
			try {
				ArrayList<Clientes> lista = ClientesJSON.getJSON();
				if(lista.isEmpty()) {
					request.setAttribute("validacion", 1);
					request.getRequestDispatcher("Reportes.jsp").forward(request, response);
				}else {
					request.setAttribute("reporte", 1);
					request.setAttribute("lista", lista);
					request.getRequestDispatcher("Reportes.jsp").forward(request, response);
				}
			} catch (Exception e) {
				System.out.println("Catch :(");
				// TODO: handle exception
			}
		}else if (btnVentas != null) {
			request.setAttribute("reporte", 2);
			request.getRequestDispatcher("Reportes.jsp").forward(request, response);
		}else if(btnCedCliente != null) {
			String cedula = request.getParameter("valor_cedula");
			ArrayList<Ventas> lista = new ArrayList<Ventas>();
			double acumulador = 0;
			try {
				ArrayList<Ventas> listaprov = VentasJSON.getJSON();
				for(Ventas venta : listaprov) {
					if(venta.getCedula_cliente()==Long.parseLong(cedula)) {
						lista.add(venta);
					}
				}
			} catch (Exception e) {
				System.out.println("Catch :(");
				System.out.println(e);
				// TODO: handle exception
			}
			if(lista.isEmpty()) {
				request.setAttribute("validacion", 2);
				request.getRequestDispatcher("Reportes.jsp").forward(request, response);
			}else {
				for(Ventas venta : lista) {
					acumulador += venta.getValor_total();
				}
				request.setAttribute("reporte", 2);
				request.setAttribute("lista", lista);
				request.setAttribute("acumulador", acumulador);
				request.getRequestDispatcher("Reportes.jsp").forward(request, response);
			}
		}
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
