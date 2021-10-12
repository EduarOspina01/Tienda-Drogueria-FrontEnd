<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<title>Proveedor</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script src="js/navbar.js"></script>
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
      						<p class = "is-size-1 has-text-centered has-text-weight-bold">MÓDULO DE GESTIÓN DE PROVEEDORES</p>
      						<p></p>
    					</div>
  					</div>
				</div>
			</div>
			<div class="column my-6">
				<div class="card mr-3">
					<header class="card-header ">
						<p class="card-header-title has-background-success has-text-justified"> 
							Ingrese los datos del proveedor
						</p>
					</header>
					<form action="ControladorProveedores" method="GET">
					<div class="card-content has-background-light">
						<div class="content ">
							
							<!-- VALIDACIONES -->
							<c:if test="${validacion == 0}">
							<div class = "box has-background-danger">
								<p class= "is-size-3 has-text-weight-bold has-text-centered"> Por favor digite el campo NIT </p>
							</div>
							</c:if>
							<c:if test="${validacion == 1}">
							<div class = "box has-background-danger">
								<p class= "is-size-3 has-text-weight-bold has-text-centered"> Por favor digite todos los campos para agregar el proveedor </p>
							</div>
							</c:if>
							<c:if test="${validacion == 2}">
							<div class = "box has-background-success">
								<p class= "is-size-3 has-text-weight-bold has-text-centered"> Proveedor creado </p>
							</div>
							</c:if>
							<c:if test="${validacion == 3}">
							<div class = "box has-background-danger">
								<p class= "is-size-3 has-text-weight-bold has-text-centered"> Ha habido un error :( </p>
							</div>
							</c:if>
							<c:if test="${validacion == 4}">
							<div class = "box has-background-danger">
								<p class= "is-size-3 has-text-weight-bold has-text-centered"> El proveedor ya existe</p>
							</div>
							</c:if>
							<c:if test="${validacion == 5}">
							<div class = "box has-background-warning">
								<p class= "is-size-3 has-text-weight-bold has-text-centered"> Proveedor eliminado </p>
							</div>
							</c:if>
							<c:if test="${validacion == 6}">
							<div class = "box has-background-success">
								<p class= "is-size-3 has-text-weight-bold has-text-centered"> Proveedor Modificado </p>
							</div>
							</c:if>
							<c:if test="${validacion == 7}">
							<div class = "box has-background-danger">
								<p class= "is-size-3 has-text-weight-bold has-text-centered"> El Proveedor no existe no se puede modificar </p>
							</div>
							</c:if>
							<c:if test="${validacion == 8}">
							<div class = "box has-background-danger">
								<p class= "is-size-3 has-text-weight-bold has-text-centered"> El proveedor no existe </p>
							</div>
							</c:if>
							<c:if test="${validacion == 9}">
							<div class = "box has-background-danger">
								<p class= "is-size-3 has-text-weight-bold has-text-centered"> Por favor digite todos los campos para actualizar el proveedor </p>
							</div>
							</c:if>
							<!-- fin validaciones -->
							<div class="control is-expanded has-icons-left">
								<label class="label">NIT</label>
								<p class="control has-icons-left">
    							<input class="input" name="NIT" type="number" placeholder="Digite NIT" value = "${proveedor.getNitproveedor()}">
    							<span class="icon is-small is-left"> 
											<span class="material-icons"> person_search</span>
										</span>
								</p>
    							<label class="label">Nombre del proveedor</label>
    							<p class="control has-icons-left">
    							<input class="input" name="nombreproveedor" type="text" placeholder="Digite Nombre del proveedor" value = "${proveedor.getNombre_provedor()}">
    							<span class="icon is-small is-left"> 
											<span class="material-icons">business</span>
										</span>
								</p>
    							<label class="label">Ciudad</label>
    							<p class="control has-icons-left">
    							<input class="input" name="ciudad" type="text" placeholder="Digite ciudad" value = "${proveedor.getCiudad_proveedor()}">
    							<span class="icon is-small is-left"> 
											<span class="material-icons"> location_city</span>
										</span>
								</p>
    							<label class="label">Direccion</label>
    							<p class="control has-icons-left">
    							<input class="input" name="Direcion" type="text" placeholder="Digite la Direccion " value = "${proveedor.getDireccion_proveedor()}">
    							<span class="icon is-small is-left"> 
											<span class="material-icons">location_on</span>
										</span>
								</p>
    							<label class="label">Teléfono</label>
    							<p class="control has-icons-left">
    							<input class="input" name="Tel" type="number" placeholder="Digite el Telefono"  value = "${proveedor.getTelefono_proveedor()}">
  							    <span class="icon is-small is-left"> 
											<span class="material-icons">phone</span>
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
				</div>
			</div>
		</div>
	</div>
</body>
</html>