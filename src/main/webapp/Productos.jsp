<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<title>Productos</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script src="js/navbar.js"></script>
<script type="text/javascript" src="js/Codigos.js"></script>
<body>
	<!-- Inicio Navbar -->
	<nav class="navbar is-light" role="navigation"
		aria-label="main navigation">
		<div class="navbar-brand">
			<a class="navbar-item" href="Controlador?accion=Menu&menu=Principal">
				<span class="material-icons"> add_circle_outline </span> <strong>Drogueria</strong>
			</a> <a role="button" class="navbar-burger" aria-label="menu"
				aria-expanded="false" data-target="navbarBasicExample"> <span
				aria-hidden="true"> </span> <span aria-hidden="true"> </span> <span
				aria-hidden="true"></span>
			</a>
		</div>

		<div id="navbarBasicExample" class="navbar-menu">
			<div class="navbar-start">
				<a class="navbar-item" href="Controlador?accion=Menu&menu=Principal">
					<span class="material-icons"> home </span> <strong> Inicio
				</strong>
				</a> <a class="navbar-item" href="Controlador?accion=Menu&menu=Usuario">
					<span class="material-icons"> face </span> <strong> Modulo
						Usuarios </strong>
				</a> <a class="navbar-item" href="Controlador?accion=Menu&menu=Cliente">
					<span class="material-icons"> groups </span> <strong>
						Modulo Clientes </strong>
				</a> <a class="navbar-item"
					href="Controlador?accion=Menu&menu=Proveedor"> <span
					class="material-icons"> local_shipping </span> <strong>
						Modulo Proveedores </strong>
				</a> <a class="navbar-item"
					href="Controlador?accion=Menu&menu=Productos"> <span
					class="material-icons"> medical_services </span> <strong>
						Modulo Productos </strong>
				</a> <a class="navbar-item" href="Controlador?accion=Menu&menu=Ventas">
					<span class="material-icons"> local_grocery_store </span> <strong>
						Modulo Ventas </strong>
				</a> <a class="navbar-item" href="Controlador?accion=Menu&menu=Reportes">
					<span class="material-icons"> feed </span> <strong> Modulo
						Reportes </strong>
				</a>
			</div>

			<div class="navbar-end">
				<div class="navbar-item">
					<div class="buttons">
						<button class="button is-static" name = "sesion" value="${sesion.getNombre_usuario()}">${sesion.getNombre_usuario()}</button>
						<a class="button is-success"
							href="Controlador?accion=Menu&menu=Salir"> <strong>Salir</strong>
						</a>
					</div>
				</div>
			</div>
		</div>
	</nav>
	<!-- Fin Navbar -->

	<div id="background-image2">
		<div class="columns">
			<div class="column is-half my-6">
				<div class="card">
 					<div class="card-image ">
    					<figure class="image">
      						<img src="img/Logo+.png" alt="Placeholder image">
    					</figure>
  					</div>
  					<div class="card-content">
    					<div class="content">
      						<p class = "is-size-1 has-text-centered has-text-weight-bold">MÓDULO DE GESTIÓN DE PRODUCTOS</p>
      						<p></p>
    					</div>
  					</div>
				</div>
				<!-- VALIDACIONES INGRESO PRODUCTO POR PRODUCTO -->
				<c:if test="${validacion == 0}">
					<div class = "box has-background-danger">
						<p class= "is-size-3 has-text-weight-bold has-text-centered"> Por favor digite el campo del codigo producto </p>
					</div>
					</c:if>
				<c:if test="${validacion == 1}">
					<div class = "box has-background-danger">
						<p class= "is-size-3 has-text-weight-bold has-text-centered"> Por favor digite todos los campos para agregar el producto </p>
					</div>
				</c:if>
				<c:if test="${validacion == 2}">
					<div class = "box has-background-success">
						<p class= "is-size-3 has-text-weight-bold has-text-centered"> Producto creado </p>
					</div>
				</c:if>
				<c:if test="${validacion == 3}">
					<div class = "box has-background-danger">
						<p class= "is-size-3 has-text-weight-bold has-text-centered"> Ha habido un error :( </p>
					</div>
				</c:if>
				<c:if test="${validacion == 4}">
					<div class = "box has-background-danger">
						<p class= "is-size-3 has-text-weight-bold has-text-centered"> El Producto ya existe</p>
					</div>
				</c:if>
				<c:if test="${validacion == 5}">
					<div class = "box has-background-warning">
						<p class= "is-size-3 has-text-weight-bold has-text-centered"> Producto eliminado </p>
					</div>
				</c:if>
				<c:if test="${validacion == 6}">
					<div class = "box has-background-success">
						<p class= "is-size-3 has-text-weight-bold has-text-centered"> Producto Modificado </p>
					</div>
				</c:if>
				<c:if test="${validacion == 7}">
					<div class = "box has-background-danger">
						<p class= "is-size-3 has-text-weight-bold has-text-centered"> El producto no existe no se puede modificar </p>
					</div>
				</c:if>
				<c:if test="${validacion == 8}">
					<div class = "box has-background-danger">
						<p class= "is-size-3 has-text-weight-bold has-text-centered"> El Producto no existe </p>
					</div>
				</c:if>
				<c:if test="${validacion == 9}">
					<div class = "box has-background-danger">
						<p class= "is-size-3 has-text-weight-bold has-text-centered"> Por favor digite todos los campos para actualizar el producto </p>
					</div>
				</c:if>
				<c:if test="${validacion == 10}">
					<div class = "box has-background-danger">
						<p class= "is-size-3 has-text-weight-bold has-text-centered"> El NIT NO EXISTE por favor ingresar primero el proveedor e intentar nuevamente </p>
					</div>
				</c:if>
				<c:if test="${validacion == 11}">
					<div class = "box has-background-danger">
						<p class= "is-size-3 has-text-weight-bold has-text-centered"> El NIT NO EXISTE por favor ingresar primero el proveedor e intentar nuevamente </p>
					</div>
				</c:if>
				<c:if test="${validacion == 12}">
					<div class = "box has-background-danger">
						<p class= "is-size-3 has-text-weight-bold has-text-centered"> Producto no se encuentra registrado en base de datos </p>
						<p class= "is-size-3 has-text-weight-bold has-text-centered"> Guarde primero el producto </p>
					</div>
				</c:if>
				<!-- fin validaciones -->
							
				<!-- VALIDACIONES POR CARGUE MASIVO -->
				<c:choose>
					<c:when test="${error == 0}">
						<div class = "box has-background-danger">
							<p class= "is-size-3 has-text-weight-bold has-text-centered"> Error: datos inválidos, Revise archivo plano </p>
						</div>
					</c:when>
					<c:when test="${error == 1}">
						<div class = "box has-background-danger">
							<p class= "is-size-3 has-text-weight-bold has-text-centered"> Error: no se seleccionó archivo para cargar </p>
						</div>
					</c:when>
					<c:when test="${error == 2}">
						<div class = "box has-background-success">
							<p class= "is-size-3 has-text-weight-bold has-text-centered"> Archivo Cargado Exitosamente </p>
						</div>
					</c:when>
					<c:when test="${error == 3}">
						<div class = "box has-background-danger">
							<p class= "is-size-3 has-text-weight-bold has-text-centered"> Error: formato de archivo inválido </p>
						</div>
					</c:when>
					<c:when test="${error == 4}">
						<div class = "box has-background-danger">
							<p class= "is-size-3 has-text-weight-bold has-text-centered"> Algunos registros no se cargaron: por favor revise si añadio el nit en modulo proveedores </p>
						</div>
					</c:when>
					<c:when test="${error == 5}">
						<div class = "box has-background-danger">
							<p class= "is-size-3 has-text-weight-bold has-text-centered"> Algunos registros no se han cargado</p>
						</div>
							<!--  
							<h5 class=text-center>Algunos registros no se han cargado</h5>
							<h5 class=text-center>Los medicamentos se han cargado</h5>
							<c:if test="${registros2 != '' }">
								<h5 class=text-center>,los medicamentos con los codigos: "${registros2}" ya existen en la base de datos</h5>
							</c:if>
							<c:if test="${registros == ''}">
								<h5 class=text-center>,los demas registros se cargaron correctamente</h5>
							</c:if>
							<c:if test="${registros != ''}">
								<h5 class=text-center>,hay registros donde el proveedor no existe en base de datos porfavor verifique el modulo proveedores</h5>
								<h5 class=text-center>el proveedor ${registros} no existe</h5>
							</c:if>
							-->
					</c:when>
				</c:choose>		
				<!-- FIN VALIDACIONES POR CARGUE MASIVO -->	
			</div>
			<div class="column my-6">
				<div class="card mr-3">
					<header class="card-header ">
						<p class="card-header-title has-background-success has-text-justified"> 
							Ingrese los datos del producto
						</p>
					</header>
					<form action="ControladorProductos" method="GET">
					<div class="card-content has-background-light">
						<div class="content ">
							
							<div class="control is-expanded has-icons-left">
								<label class="label">Codigo del producto</label>
								<p class="control has-icons-left">
    								<input class="input" name="codigo" type="number" placeholder="Digite codigo del producto" value = "${producto.getCodigo_producto()}">
    								<span class="icon is-small is-left"> 
											<span class="material-icons"> pin</span>
										</span>
								</p>
    							<label class="label">IVA del producto</label>
    							<p class="control has-icons-left">
    								<input class="input" name="iva" type="number" placeholder="Digite el IVA" value = "${producto.getIvacompra()}">
    							    <span class="icon is-small is-left"> 
											<span class="material-icons"> money</span>
										</span>
								</p>
    							<label class="label">NIT</label>
    							<p class="control has-icons-left">
    								<input class="input" name="NIT" type="number" placeholder="Digite el NIT del proveedor, debe estar registrado con anterioridad" value = "${producto.getNitproveedor()}">
    							    <span class="icon is-small is-left"> 
											<span class="material-icons"> person_search</span>
										</span>
								</p>
    							<label class="label">Nombre del Producto</label>
    							<p class="control has-icons-left">
    								<input class="input" name="nombre_prod" type="text" placeholder="Digite el nombre del producto" value = "${producto.getNombre_producto()}">
    							    <span class="icon is-small is-left"> 
											<span class="material-icons"> medical_services</span>
										</span>
								</p>
    							<label class="label">Precio de compra</label>
    							<p class="control has-icons-left">
    								<input class="input" name="precio_c" type="number" placeholder="Digite el precio de compra"  value = "${producto.getPrecio_compra()}">
    							    <span class="icon is-small is-left"> 
											<span class="material-icons"> sell</span>
										</span>
								</p>	
    							<label class="label">Precio de venta</label>
    							<p class="control has-icons-left">
    								<input class="input" name="precio_v" type="number" placeholder="Digite el precio de venta"  value = "${producto.getPrecio_venta()}">
  							        <span class="icon is-small is-left"> 
											<span class="material-icons"> sell</span>
										</span>
								</p>
  							</div>
						</div>
					</div>
					<footer class="card-footer">
						<button class="button is-primary is-light is-fullwidth " name="Agregar" value = "Agregar">Agregar</button>
						<button class="button is-warning is-light is-fullwidth " name="Actualizar" value = "Actualizar">Actualizar</button>
						<button class="button is-danger is-light is-fullwidth " name="Eliminar" value = "Eliminar">Eliminar</button>
						<button class="button is-info is-light is-fullwidth" name="Buscar" value = "Consultar">Buscar</button>
					</footer>
					</form>
					
					<header class="card-header ">
						<p class="card-header-title has-background-success has-text-justified"> 
							Cargue de productos por CSV
						</p>
					</header>
					<form method="POST" name="formulario" enctype="multipart/form-data">
					<div class="card-content has-background-light">
						<div class="content ">
							<div>
								<div class = "box">
									<p class= "is-size-5 has-text-centered">
										Suba un archivo en formato .CSV para cargar los productos
									</p>
								</div>
							</div>
							<div class="control is-expanded has-icons-left">
								<div class="file has-name is-right is-success">
									<div class="file is-boxed">
										<label class="file-label">
    									<input class="file-input" name="archivo" id="archivo" type="file">
    									<span class="file-cta">
      									<span class="file-icon">
											<span class="material-icons"> upload_file</span>
      									</span>
      									<span class="file-label">
        									Seleccione un archivo
      									</span>
    								</span>
  									</label>
									</div>
								</div>
  							</div>
						</div>
					</div>
					<footer class="card-footer">
						<button class="button is-success is-fullwidth " name="Procesar" value = "Procesar" onclick="cargarArchivo(archivo)">Procesar</button>
						<input type="hidden" name="nombre" value="">
						<input type="hidden" name="nombre2" value="">
					</footer>
					</form>
				</div>
			</div>
		</div>
	</div>
	<iframe name="null" style="display: none;"></iframe>
</body>
</html>