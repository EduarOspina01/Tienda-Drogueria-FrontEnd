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

import Front.modelo.Clientes;
import Front.modelo.ClientesJSON;
import Front.modelo.DteVentas;
import Front.modelo.DteVentasJSON;
import Front.modelo.Productos;
import Front.modelo.ProductosJSON;
import Front.modelo.Usuarios;
import Front.modelo.Ventas;
import Front.modelo.VentasJSON;


@WebServlet("/ControladorVentas")
public class ControladorVentas extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	double subtotal=0, totalapagar=0;
	long codProducto=0;
	double precio=0, valor_iva=0, iva=0, subtotaliva=0, acusubtotal=0, totaldis=0;
	long numfac=0;
	int cantidad=0, item=0;
	String descripcion, cedulaCliente;
	List<DteVentas> listaVentas= new ArrayList<>();
	Usuarios usuarios= new Usuarios();
	DteVentas detalle_venta = new DteVentas();
	Usuarios sesion;

    public ControladorVentas() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void buscarCliente(Long id, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	boolean bandera = false;
    	try {
			ArrayList<Clientes> listac= ClientesJSON.getJSON();
			for(Clientes clientes:listac) {
				if (clientes.getCedula_cliente()==(id)) {
					request.setAttribute("cliente", clientes);
					bandera = true;
				}
			}	
		} catch (Exception e) {
				e.printStackTrace();
		}
    	if(!bandera) {
			request.setAttribute("validacion", 10);
			request.getRequestDispatcher("/Cliente.jsp").forward(request, response);
		}
    }
    
    protected void buscarProducto(Long cod_prod, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	boolean bandera = false;
    	try {
			ArrayList<Productos> listap= ProductosJSON.getJSON();
			for(Productos productos:listap) {
				if (productos.getCodigo_producto()==(cod_prod)) {					
					request.setAttribute("producto", productos);
					bandera = true;
				}
			}
		} catch (Exception e) {
				e.printStackTrace();
		}
    	if(!bandera) {
			request.setAttribute("validacion", 12);
			request.getRequestDispatcher("/Productos.jsp").forward(request, response);
		}
    }
    
    protected void grabarDetalle(Long numFact, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String codigo_detalle;
    	for(int i=0; i<listaVentas.size();i++) {
			detalle_venta = new DteVentas();
			codigo_detalle = (String.valueOf(numFact)+(i+1));
			detalle_venta.setCodigo_dte(Long.parseLong(codigo_detalle));
			detalle_venta.setCod_venta(numFact);
			detalle_venta.setCod_producto(listaVentas.get(i).getCod_producto());
			detalle_venta.setCantidad(listaVentas.get(i).getCantidad());
			detalle_venta.setValor_sin_iva(listaVentas.get(i).getValor_sin_iva());
			detalle_venta.setValor_total(listaVentas.get(i).getValor_total());
			detalle_venta.setValor_iva(listaVentas.get(i).getValor_iva());
			
			int respuesta =0;
			try {
				respuesta= DteVentasJSON.postJSON(detalle_venta);
				//PrintWriter write= response.getWriter();
				if (respuesta==200) {
					System.out.println("Registros Grabados detalle ventas");
				}else {
					System.out.println("Error Detall venta" +respuesta);
				}
				//write.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
    }
    
    public void buscarFactura(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	try {
    		long contador = 0;
    		ArrayList<Ventas> listfactura = VentasJSON.getJSON();
    		if(listfactura.isEmpty() || listfactura == null) {
    			Long numfac = 1L;
    			request.setAttribute("numerofactura", numfac);
    		}else {
    			for(Ventas venta: listfactura) {
    				if(venta.getCodigo_venta() > contador) {
    					contador = venta.getCodigo_venta();
    				}
    			}
    			if(contador > 0 ) {
    				request.setAttribute("numerofactura", contador+1);
    			}else {
    				Long numfac = 1L;
        			request.setAttribute("numerofactura", numfac);
    			}		
    		}
    		
		} catch (Exception e) {
			// TODO: handle exception
		}
    	
		
	}
    public void limparCampos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
    	System.out.println("entro en cancelar");
		subtotal=0; totalapagar=0;
		codProducto=0;
		precio=0; valor_iva=0; iva=0; subtotaliva=0; acusubtotal=0; totaldis=0;
		numfac=0;
		cantidad=0; item=0;
		descripcion = ""; cedulaCliente = "";
		listaVentas.clear();
		usuarios= new Usuarios();
		detalle_venta = new DteVentas();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		if(sesion == null) {
			HttpSession sesionuser = (HttpSession) request.getSession();
			sesion = (Usuarios) sesionuser.getAttribute("sesion");
			System.out.println(sesion.getNombre_usuario());
		}
		
		//request.setAttribute("numfac",numfac);
		
		//Botones
		String buscar_cliente = request.getParameter("Buscar1");
		String buscar_producto = request.getParameter("Buscar2");
		String agregar = request.getParameter("Agregar");
		String finalizar = request.getParameter("Finalizar");
		String cancelar = request.getParameter("Cancelar");
		
		if(buscar_cliente!=null) {
			String ced_cliente = request.getParameter("txtCedula");//como esta en ventas
			if(ced_cliente == "" || ced_cliente == null) {
				String datosvacios = "Ingrese primero este campo";
				Clientes clientes = new Clientes();
				clientes.setNombre_cliente(datosvacios);
				request.setAttribute("cliente", clientes);
			}else {
				this.buscarCliente(Long.parseLong(ced_cliente), request, response);
			}
		}else if(buscar_producto!=null) {
			String ced_cliente = request.getParameter("txtCedula");//como esta en ventas
			if(ced_cliente == "" || ced_cliente == null) {
				String datosvacios = "Primero escriba la cedula del cliente";
				Clientes clientes = new Clientes();
				clientes.setNombre_cliente(datosvacios);
				request.setAttribute("cliente", clientes);
			}else {
				this.buscarCliente(Long.parseLong(ced_cliente), request, response);
				
				String cod_prod = request.getParameter("txtCod");;//como esta en ventas
				if(cod_prod == "" || cod_prod == null) {
					String datosvacios = "Primero escriba el codigo del producto";
					Productos producto = new Productos();
					producto.setNombre_producto(datosvacios);
					request.setAttribute("producto", producto);
				}else {
				this.buscarProducto(Long.parseLong(cod_prod), request, response);
				}
			}				
		}else if(agregar!=null) {
			
			String ced_cliente = request.getParameter("txtCedula");
			this.buscarCliente(Long.parseLong(ced_cliente), request, response);
			
			detalle_venta= new DteVentas(); 
			item++; //contador
			acusubtotal=0;
			subtotaliva=0;
			totalapagar=0;
			totaldis=0;
			codProducto=Long.parseLong(request.getParameter("txtCod")); 
			descripcion=request.getParameter("nombre_prod");
			precio=Double.parseDouble(request.getParameter("Valor"));
			cantidad=Integer.parseInt(request.getParameter("cantidad"));
			iva=Double.parseDouble(request.getParameter("IVA"));
			if(cantidad < 1) {
				String datosvacios = "Cantidad invalida";
				Productos producto = new Productos();
				producto.setNombre_producto(datosvacios);
				request.setAttribute("producto", producto);
			}else {
				subtotal = precio*cantidad;
				valor_iva=subtotal*iva/100;
				totaldis = subtotal+valor_iva;
				//almacena temporalmente cada producto
				detalle_venta.setCodigo_dte(item);
				detalle_venta.setCod_producto(codProducto);
				detalle_venta.setDescripcion(descripcion);
				detalle_venta.setValor_sin_iva(subtotal);
				detalle_venta.setCantidad(cantidad);
				detalle_venta.setCod_venta(numfac);
				detalle_venta.setValor_iva(valor_iva);
				detalle_venta.setValor_total(totaldis);
				listaVentas.add(detalle_venta);
				
				for(int i=0; i<listaVentas.size();i++) {
					acusubtotal += listaVentas.get(i).getValor_sin_iva();
					subtotaliva += listaVentas.get(i).getValor_iva();
				}
				totalapagar = acusubtotal + subtotaliva;
				//detalle_venta.setValor_total(totalapagar);
				//una vez hecho todos los calculos ahora hacemos el envio de la info al formulario ventas seccion2
				request.setAttribute("listaventas", listaVentas);
				request.setAttribute("totalsubtotal", acusubtotal);
				request.setAttribute("totaliva", subtotaliva);
				request.setAttribute("totalapagar", totalapagar);
				this.buscarFactura(request, response);
			}
		}else if(finalizar!=null) {
			String cedulaCliente= request.getParameter("txtCedula");
			String numFact=request.getParameter("con_fac");
			Ventas ventas =new Ventas();
			ventas.setCodigo_venta(Long.parseLong(numFact));
			ventas.setCedula_cliente(Long.parseLong(cedulaCliente));
			ventas.setCedula_usuario(sesion.getCedula_usuario());
			ventas.setIvaventa(subtotaliva);
			ventas.setValor_total(acusubtotal);
			ventas.setTotal_venta(totalapagar);
			
			int respuesta=0;
			try {
				respuesta=VentasJSON.postJSON(ventas);
				//PrintWriter write=response.getWriter();
				if(respuesta==200) {
					System.out.println("Grabacion Exitosa " + respuesta);
					this.grabarDetalle(ventas.getCodigo_venta(), request, response);
				}else {
					System.out.println("error ventas");
				}
				//write.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			String consecutivo = request.getParameter("con_fac");
			request.setAttribute("validacion", 1);
			request.setAttribute("consecutivo",consecutivo);
			System.out.println("entro en final de finalizar");
			this.limparCampos(request, response);
			//request.getRequestDispatcher("/Ventas.jsp").forward(request, response);
		}else if(cancelar != null) {
			this.limparCampos(request, response);
			//request.getRequestDispatcher("/Ventas.jsp").forward(request, response);
		}
		
		request.getRequestDispatcher("/Ventas.jsp").forward(request, response);
	}

}
