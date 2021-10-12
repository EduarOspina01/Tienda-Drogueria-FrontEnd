package Front.servlets;


import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.csvreader.CsvReader;

import Front.modelo.Clientes;
import Front.modelo.ClientesJSON;
import Front.modelo.Productos;
import Front.modelo.ProductosJSON;
import Front.modelo.Proveedores;
import Front.modelo.ProveedoresJSON;



@WebServlet("/ControladorProductos")
@MultipartConfig
public class ControladorProductos extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public ControladorProductos() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String Listar = request.getParameter("Listar");
		String codigo = request.getParameter("codigo");
		String iva = request.getParameter("iva");
		String nit = request.getParameter("NIT");
		String nombre_prod = request.getParameter("nombre_prod");
		String precio_c = request.getParameter("precio_c");
		String precio_v = request.getParameter("precio_v");
		String Agregar = request.getParameter("Agregar");
		String consultar = request.getParameter("Buscar");
		String eliminar = request.getParameter("Eliminar");
		String modificar = request.getParameter("Actualizar");
		
		if (Listar != null) {
			try {
				ArrayList<Productos> lista = ProductosJSON.getJSON();
				request.setAttribute("lista", lista);
				request.getRequestDispatcher("Productos.jsp").forward(request, response);
			} catch (Exception e) {
				out.println("Catch :(");
				// TODO: handle exception
			}
		}
		if (consultar != null) {
			if (codigo != "" && codigo != null) {
				boolean existe = false;					
				try {
					ArrayList<Productos> lista = ProductosJSON.getJSON();
					for (Productos producto_prueba: lista) {
						if(producto_prueba.getCodigo_producto() == Long.parseLong(codigo)) {
							existe = true;
						}
					}
					if(!existe) {
						request.setAttribute("validacion", 8);//El usuario no existe
						request.getRequestDispatcher("/Productos.jsp").forward(request, response);
					}else {
						ArrayList<Productos> listaid = ProductosJSON.getforIdJSON(codigo);
						for(Productos items:listaid) {
							request.setAttribute("producto", items );
							request.getRequestDispatcher("Productos.jsp").forward(request, response);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					out.println("Catch :(");
					// TODO: handle exception
				}
			}else {
				request.setAttribute("validacion", 0);//Ingrese el campo cedula
				request.getRequestDispatcher("/Productos.jsp").forward(request, response);
			}
		}
		if (Agregar != null) {
			if (codigo != "" && iva != "" && nit != "" && nombre_prod != "" && precio_c != "" && codigo != null && iva != null && nit != null && nombre_prod != null && precio_c != null && precio_v != "" && precio_v != null) {
				boolean existe = false;
				boolean existe2 = false;
				try {
					ArrayList<Productos> listaid = ProductosJSON.getforIdJSON(codigo);
					for (Productos producto_prueba: listaid) {
						if(producto_prueba.getCodigo_producto() == Long.parseLong(codigo)) {
							existe = true;
						}
					}
				} catch (Exception e) {
					out.println("Catch :(");
					// TODO: handle exception
				}
				try {
					ArrayList<Proveedores> listaprov = ProveedoresJSON.getJSON();
					for(Proveedores proveedor_prueba : listaprov) {
						if(proveedor_prueba.getNitproveedor() == Long.parseLong(nit)) {
							existe2 = true;
						}
					}
					
				} catch (Exception e) {
					// TODO: handle exception
				}
				if (!existe) {
					if(existe2) {
						Productos producto = new Productos();
						producto.setCodigo_producto(Long.parseLong(codigo));
						producto.setIvacompra(Double.parseDouble(iva));
						producto.setNitproveedor(Long.parseLong(nit));
						producto.setNombre_producto(nombre_prod);
						producto.setPrecio_compra(Double.parseDouble(precio_c));
						producto.setPrecio_venta(Double.parseDouble(precio_v));
						int creado = ProductosJSON.postJSON(producto);
						System.out.println(creado);
						if(creado == 200) {
							request.setAttribute("validacion", 2);//producto Creado
							request.getRequestDispatcher("/Productos.jsp").forward(request, response);
						}else {
							request.setAttribute("validacion", 3);//Ha habido un error
							request.getRequestDispatcher("/Productos.jsp").forward(request, response);
						}
					}else {
						request.setAttribute("validacion", 10);//El Nit no existe
						request.getRequestDispatcher("/Productos.jsp").forward(request, response);
					}
				}else {
					request.setAttribute("validacion", 4);//El producto ya existe
					request.getRequestDispatcher("/Productos.jsp").forward(request, response);
				}	
			} else {
				request.setAttribute("validacion", 1);//Ingrese todos los campos
				request.getRequestDispatcher("/Productos.jsp").forward(request, response);
			}
		}
		if (eliminar != null) {
			if (codigo != "" && codigo != null) {
				boolean existe = false;					
				try {
					ArrayList<Productos> lista = ProductosJSON.getJSON();
					for (Productos producto_prueba: lista) {
						if(producto_prueba.getCodigo_producto() == Long.parseLong(codigo)) {
							existe = true;
						}
					}
					if(!existe) {
						request.setAttribute("validacion", 8);//El usuario no existe
						request.getRequestDispatcher("/Productos.jsp").forward(request, response);
					}else {
						int borrado = ProductosJSON.deleteJSON(codigo);
						if(borrado == 200) {
							request.setAttribute("validacion", 5);//Usuario Borrado
							request.getRequestDispatcher("/Productos.jsp").forward(request, response);
						}else {
							request.setAttribute("validacion", 3);//Ha habido un error
							request.getRequestDispatcher("/Productos.jsp").forward(request, response);
						}
					}
				} catch (Exception e) {
					e.printStackTrace();
					out.println("Catch :(");
					// TODO: handle exception
				}
			} else {
				request.setAttribute("validacion", 0);//Ingrese el campo cedula
				request.getRequestDispatcher("/Productos.jsp").forward(request, response);
			}
		}
		if (modificar != null) {
			if (codigo != "" && iva != "" && nit != "" && nombre_prod != "" && precio_c != "" && codigo != null && iva != null && nit != null && nombre_prod != null && precio_c != null && precio_v != "" && precio_v != null) {
				boolean existe = false;
				boolean existe2 = false;
				try {
					ArrayList<Productos> listaid = ProductosJSON.getforIdJSON(codigo);
					for (Productos producto_prueba: listaid) {
						if(producto_prueba.getCodigo_producto() == Long.parseLong(codigo)) {
							existe = true;
						}
					}
				} catch (Exception e) {
					out.println("Catch :(");
					// TODO: handle exception
				}
				try {
					ArrayList<Proveedores> listaprov = ProveedoresJSON.getJSON();
					for(Proveedores proveedor_prueba : listaprov) {
						if(proveedor_prueba.getNitproveedor() == Long.parseLong(nit)) {
							existe2 = true;
						}
					}
					
				} catch (Exception e) {
					// TODO: handle exception
				}
				if (existe) {
					if(existe2) {
						Productos producto = new Productos();
						producto.setCodigo_producto(Long.parseLong(codigo));
						producto.setIvacompra(Double.parseDouble(iva));
						producto.setNitproveedor(Long.parseLong(nit));
						producto.setNombre_producto(nombre_prod);
						producto.setPrecio_compra(Double.parseDouble(precio_c));
						producto.setPrecio_venta(Double.parseDouble(precio_v));
						int creado = ProductosJSON.postJSON(producto);
						System.out.println(creado);
						if(creado == 200) {
							request.setAttribute("validacion", 6);//Usuario Modificado
							request.getRequestDispatcher("/Productos.jsp").forward(request, response);
						}else {
							request.setAttribute("validacion", 3);//Ha habido un error
							request.getRequestDispatcher("/Productos.jsp").forward(request, response);
						}
					}else {
						request.setAttribute("validacion", 11);//El nit no existe no se puede modificar
						request.getRequestDispatcher("/Productos.jsp").forward(request, response);
					}
				}else {
					request.setAttribute("validacion", 7);//El usuario no existe no se puede modificar
					request.getRequestDispatcher("/Productos.jsp").forward(request, response);
				}	
			} else {
				request.setAttribute("validacion", 9);//Ingrese todos los campos
				request.getRequestDispatcher("/Productos.jsp").forward(request, response);
			}
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stubs
		PrintWriter out = response.getWriter();
		System.out.println("Entro Sevlet");
		String nomb = request.getParameter("nombre");
		Part arch = request.getPart("archivo");
		String process = request.getParameter("Procesar");
		InputStream is = arch.getInputStream();
		Charset charset = Charset.forName("UTF-8");
		
		if (process != null) {
			if(is.available() ==0) {
				is.close();
				System.out.println("Entro error sin archivo");
				request.setAttribute("error", 1);//error no se ha seleccionado el archivo
				request.getRequestDispatcher("/Productos.jsp").forward(request, response);
			}else {
				if(ProductosJSON.validarCSV(nomb)) {
					try {
						String registros = "";
						boolean reg_no_cargados = false;
						CsvReader leerproducto = new CsvReader(is, charset);
						leerproducto.readHeaders();
						List<Productos> productos = new ArrayList<Productos>(); // Lista donde se guardara los datos
						while(leerproducto.readRecord()) {
							String codigo = leerproducto.get(0);
							String iva = leerproducto.get(1);
							String nit = leerproducto.get(2);
							String nombre = leerproducto.get(3);
							String compra = leerproducto.get(4);
							String venta = leerproducto.get(5);
							
							//añade lo leido a una lista tipo productios
						productos.add(new Productos(Long.parseLong(codigo), Double.parseDouble(iva), Long.parseLong(nit), nombre, Double.parseDouble(compra), Double.parseDouble(venta)));
						}
						is.close();
						System.out.println("Entro en boton");
						ArrayList<Productos> listafinal = new ArrayList<Productos>();
						try {
							
							ArrayList<Proveedores> lista = ProveedoresJSON.getJSON();
							for (Proveedores suplier:lista) {
								for(Productos item:productos) {
									if(suplier.getNitproveedor() == item.getNitproveedor()) {
										System.out.println("Entro for if");
										listafinal.add(item);
									}else {
										registros = String.valueOf(item.getNitproveedor())+",";
										reg_no_cargados =  true;
									}
								}
							}
						} catch (Exception e) {
							System.out.println("Entro catch");
							out.println("Catch :(");
							// TODO: handle exception
						}
						String registros2 = "";
						int ban= 3;
						int validacion = 0;
						for(Productos item:listafinal) {
							ArrayList<Productos> listaproductos = ProductosJSON.getJSON();
							for(Productos item2:listaproductos) {
								if(item.getCodigo_producto()!=item2.getCodigo_producto()) {
									validacion = ProductosJSON.postJSON(item);
									if(validacion==200) {
										ban = (ban * 0) + 2;
									}
								}else {
									registros2 = String.valueOf(item.getCodigo_producto())+",";
								}
							}		
						}
						if(validacion == 200) {
							System.out.println("carga existosa");
							request.setAttribute("error", 2); //carga exitosa de csv
							request.getRequestDispatcher("/Productos.jsp").forward(request, response);
						}else {
							System.out.println("los registros no se cargaron");
							request.setAttribute("error", 4); //Registros no se cargaron
							request.getRequestDispatcher("/Productos.jsp").forward(request, response);
						}
					}catch(Exception e){
						System.out.println("Entro datos invalidos");
						request.setAttribute("error", 0);//error datos leidos invalidos
						request.getRequestDispatcher("/Productos.jsp").forward(request, response);
					}finally {
						is.close();
					}
				}else {
					is.close();
					System.out.println("Entro error formato");
					request.setAttribute("error", 3);//error datos leidos invalidos
					request.getRequestDispatcher("Productos.jsp").forward(request, response);
					//request.getRequestDispatcher("/ValidacionProductos?validar=3&error=3").forward(request, response);
				}
			}		
		}
	}
			
		/*File f = new File("C:/Prueba/productos.csv");
		FileOutputStream ous = new FileOutputStream(f);
		int dato = is.read();
		while(dato != -1) {
			ous.write(dato);
			dato = is.read();
		}
		
		ous.close();
		is.close();*/

}


