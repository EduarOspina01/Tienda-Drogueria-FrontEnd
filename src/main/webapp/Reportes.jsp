<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<title>Reportes</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script src="js/navbar.js"></script>
</head>
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
	
	<div id="background-image">
		<form action="ControladorReportes" method="GET">
		<div class="columns is-centered">
  			<div class="column">
  				<div class ="container is-max-desktop ">
  					<div class="box mt-5 has-text-centered inline inline-block has-background-light">
  						<p class="title is-2 has-text-center">MODULO GESTION DE REPORTES</p>
  						<p class="title is-3 has-text-center">Seleccione el reporte a mostrar</p>
						<button class="button is-info " name ="listar_usuarios">Listado de Usuarios</button>
						<button class="button is-info" name ="listar_clientes">Listado de Clientes</button>
						<button class="button is-info" name ="listar_ventas">Ventas por Cliente</button>
					</div>
  				</div> 
  			</div>
  		</div>
  		</form>
  		<div class = "columns is-centered">
  			<div class="column">
  				<!-- Validaciones -->
  				<c:if test="${validacion == 0}">
  					<div class = "box has-background-danger">
						<p class= "is-size-3 has-text-weight-bold has-text-centered"> No existen usuarios en la base de datos</p>
					</div>
  				</c:if>
  				
  				<c:if test="${validacion == 1}">
  					<div class = "box has-background-danger">
						<p class= "is-size-3 has-text-weight-bold has-text-centered"> No existen clientes en la base de datos</p>
					</div>
  				</c:if>
  				
  				<c:if test="${validacion == 2}">
  					<div class = "box has-background-danger">
						<p class= "is-size-3 has-text-weight-bold has-text-centered"> No existen registros de ventas para este cliente en la base de datos</p>
					</div>
  				</c:if>
  				<!-- TABLA USUARIOS -->
  				<c:if test="${reporte == 0}">
  					<div class="container is-fullhd">
  				 		<div class="box has-background-primary">
  				 			<h1 class ="title is-5 has-text-centered">Listado de Usuarios</h1>
  				 			<table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth is-centered">
  				 				<thead>
  				 					<tr>
      									<th>Cedula</th>
      									<th>Nombre</th>
      									<th>Correo Electronico</th>
     									<th>Usuario</th>
      									<th>Contraseña</th>
  				 					</tr>
  				 				</thead>
  				 				<tbody>
  				 					<c:forEach var="usuarios" items="${lista}">
  				 						<tr>
  				 							<td>${usuarios.getCedula_usuario()}</td>
											<td>${usuarios.getEmail_usuario()}</td>
											<td>${usuarios.getNombre_usuario()}</td>
											<td>${usuarios.getUsuario()}</td>
											<td>${usuarios.getPassword()}</td>
										</tr>
  				 					</c:forEach>
  				 				</tbody>
  				 			</table>
  				 		</div>
  				 	</div>
  				</c:if>
  				<!-- TABLA CLIENTES -->
  				<c:if test="${reporte == 1}">
  					<div class="container is-fullhd">
  				 		<div class="box has-background-primary">
  				 			<h1 class ="title is-5 has-text-centered">Listado de Clientes</h1>
  				 			<table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth is-centered">
  				 				<thead>
  				 					<tr>
      									<th>Cedula</th>
      									<th>Dirección</th>
      									<th>Correo Electronico</th>
     									<th>Nombre</th>
      									<th>Telefono</th>
  				 					</tr>
  				 				</thead>
  				 				<tbody>
  				 					<c:forEach var="clientes" items="${lista}">
  				 						<tr>
  				 							<td>${clientes.getCedula_cliente()}</td>
											<td>${clientes.getDireccion_cliente()}</td>
											<td>${clientes.getEmail_cliente()}</td>
											<td>${clientes.getNombre_cliente()}</td>
											<td>${clientes.getTelefono_cliente()}</td>
										</tr>
  				 					</c:forEach>
  				 				</tbody>
  				 			</table>
  				 		</div>
  				 	</div>
  				</c:if>
  				<!-- TABLA VENTAS -->
  				<c:if test="${reporte == 2}">
  					<div class="container is-fullhd">
  						<form action="ControladorReportes" method="GET">
  							<div class="field has-addons">
  								<div class="field-label is-normal">
    								<label class ="label">Digite la cedula del cliente</label>
								</div>
  								<div class="control">
    								<input class ="input" type="number" name = "valor_cedula">
  								</div>
  								<div class="control">
  									<button class ="button is-info" name = "cedula">Consultar</button>
  								</div>
							</div>
  						</form>
  				 		<div class="box has-background-primary">
  				 			<h1 class ="title is-5 has-text-centered">Listado de Ventas por clientes</h1>
  				 			<table class="table is-bordered is-striped is-narrow is-hoverable is-fullwidth is-centered">
  				 				<thead>
  				 					<tr>
      									<th>Numero Factura</th>
      									<th>Cedula Usuario que realizo la venta</th>
      									<th>Cedula Cliente</th>
     									<th>Valor Venta</th>
  				 					</tr>
  				 				</thead>
  				 				<tbody>
  				 					<c:forEach var="ventas" items="${lista}">
  				 						<tr>
  				 							<td>${ventas.getCodigo_venta()}</td>
											<td>${ventas.getCedula_usuario()}</td>
											<td>${ventas.getCedula_cliente()}</td>
											<td>${ventas.getValor_total()}</td>
										</tr>
  				 					</c:forEach>
  				 				</tbody>
  				 			</table>
  				 			<label class ="label">Valor total compras hechas por este cliente</label>
  				 			<input class ="input" type="number" name = "valor" value = "${acumulador}">
  				 		</div>
  				 	</div>
  				</c:if>
  			</div>
  		</div>
 	</div>
  
</body>
</html>