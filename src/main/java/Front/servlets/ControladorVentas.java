package Front.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Front.modelo.Clientes;
import Front.modelo.ClientesJSON;
import Front.modelo.Productos;
import Front.modelo.ProductosJSON;


@WebServlet("/ControladorVentas")
public class ControladorVentas extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ControladorVentas() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		PrintWriter out = response.getWriter();
		HttpSession misession= request.getSession(true);
		HttpSession ventasession= request.getSession(true);
		
		//Campos de texto
		String ced_cliente = request.getParameter("txtCedula");
		String cod_prod = request.getParameter("txtCod");
		
		//Botones
		String buscar_cliente = request.getParameter("Buscar1");
		String buscar_producto = request.getParameter("Buscar2");
		String agregar = request.getParameter("Agregar");
		String agr_cant = request.getParameter("OK");
		String borrar = request.getParameter("Borrar");
		String finalizar = request.getParameter("Finalizar Compra");
		String cancelar = request.getParameter("Cancelar Compra");
		
		if(buscar_cliente!= null) {
			if (ced_cliente != "" && ced_cliente!= null) {
				Clientes clientef = new Clientes();
				try {
					ArrayList<Clientes> listaC = new ArrayList<Clientes>();
					listaC = ClientesJSON.getJSON();
					for(Clientes cliente: listaC) {
						if(cliente.getCedula_cliente() == Long.parseLong(ced_cliente)) {
							clientef = cliente;
						}
					}
				}catch (Exception e) {
					out.println("Entro catch");
					// TODO: handle exception
				}
				if(clientef.getNombre_cliente() != null) {
					misession.setAttribute("cliente", clientef);
					request.getRequestDispatcher("Ventas.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("Cliente.jsp").forward(request, response);
				}
			}else {
				out.println(" Digite todos los campos");
			}
		}
		
		if(buscar_producto!= null) {
			if (cod_prod != "" && cod_prod!= null) {
				Productos itemf = new Productos();
				try {
					ArrayList<Productos> listaP = new ArrayList<Productos>();
					listaP = ProductosJSON.getJSON();
					for(Productos item : listaP) {
						if(item.getCodigo_producto() == Long.parseLong(cod_prod)){
							itemf = item;
						}
					}
				} catch (Exception e) {
					// TODO: handle exception
				}
				if(itemf.getNombre_producto() != null) {
					misession.setAttribute("producto", itemf);
					request.getRequestDispatcher("Ventas.jsp").forward(request, response);
				}else {
					request.getRequestDispatcher("Productos.jsp").forward(request, response);
				}
			}else {
				out.println(" Digite todos los campos");
			}
		}
		
		if(agregar != null) {
			misession.invalidate();
			request.getRequestDispatcher("Ventas.jsp").forward(request, response);
		}
		
		
	}

}
