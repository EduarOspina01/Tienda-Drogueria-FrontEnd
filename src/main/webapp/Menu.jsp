<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<title>Menu Principal</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<script src="js/navbar.js"></script>
</head>
<body>
	<!--  <div id="background-image"></div> -->
	<nav class="navbar is-light" role="navigation"
		aria-label="main navigation">
		<div class="navbar-brand">
			<a class="navbar-item" href="Controlador?accion=Menu&menu=Principal">
				<span class="material-icons"> add_circle_outline </span> <strong>Drogueria</strong>
			</a> 
			
			<a role="button" class="navbar-burger" aria-label="menu"
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
	<div id="background-image">
		<section class="hero is-medium is-link">
			<div class="hero-body">
				<p class="title">BIENVENIDO A SU DROGUERIA</p>
				<p class="subtitle">Modulo de gestion de una drogueria</p>
			</div>
		</section>
	</div>


</body>
</html>