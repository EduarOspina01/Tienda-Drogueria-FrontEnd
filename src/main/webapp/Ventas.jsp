<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<title>Ventas</title>
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
					<header class="card-header ">
						<p class="card-header-title has-background-success has-text-justified"> 
							Infromacion de la venta
						</p>
					</header>
					
					<div class="card-content">
						<form action="ControladorVentas" method="POST">
						<div class="field is-horizontal">
							<div class="field-label is-normal">
								<label class="label">Cedula</label>
							</div>
							<div class="field-body">
								<div class = "field is-expanded">
									<div class="field has-addons">
										<p class = "control is-expanded has-icons-left">
											<input class="input" type="number" name ="txtCedula" placeholder="Ingrese la cedula del cliente" value = "${cliente.getCedula_cliente()}">
											<span class="icon is-small is-left">
          										<i class="fas fa-envelope"></i>
        									</span>
										</p>
										<p class = "control is-expanded">
											<button class="button is-success" name = "Buscar1" value ="Buscar Cliente">
												Buscar
											</button>
										</p>
									</div>
								</div>
								<div class = "field is-expanded">
									<p class= "control">
										<fieldset disabled>
											<input class="input" type="text" placeholder="Nombre Cliente" name = "salidaCleinte" value = "${cliente.getNombre_cliente()}">
										</fieldset>
									</p>
								</div>
							</div>
						</div>
						</form>
						<form action="ControladorVentas" method="POST">
						<div class="field is-horizontal">
							<div class="field-label is-normal">
   								<label class="label">Producto</label>
  							</div>
  							<div class="field-body">
  								<div class="field">
  									<div class="field has-addons">
										<p class = "control is-expanded has-icons-left">
											<input class="input" type="text" placeholder="Ingrese el codigo del producto" name ="txtCod" value = "${producto.getCodigo_producto()}">
											<span class="icon is-small is-left">
          										<i class="fas fa-envelope"></i>
        									</span>
										</p>
										<p class = "control is-expanded">
											<button class="button is-success" name = "Buscar2" value ="Buscar Producto">
												Buscar
											</button>
										</p>
									</div>
  								</div>
  								<div class="field is-expanded" >
  									<p class= "control">
										<fieldset disabled>
											<input class="input" type="text" placeholder="Codigo Producto" name="nombre_prod" value = "${producto.getNombre_producto()}">
										</fieldset>
									</p>
  								</div>
  							</div>
						</div>
						<div class="field is-horizontal">
							<div class="field-label"></div>
							<div class="field-body">
								<div class="field is-expanded">
									<div class="field has-addons">
										<p class="control">
											<a class="button is-success" title="Disabled button" disabled>
           										 Valor
         									</a>
										</p>
										<p class="control is-expanded">
											<fieldset disabled>
											<input class="input" type="text" placeholder="Valor" name="valor" value = "${producto.getPrecio_venta()}">
											</fieldset>
										</p>
									</div>
								</div>
								
								<div class="field is-expanded">
									<div class="field has-addons">
										<p class="control">
											<a class="button is-success" title="Disabled button" disabled>
           										 IVA
         									</a>
										</p>
										<p class="control is-expanded">
											<fieldset disabled>
											<input class="input" type="text" placeholder="IVA" name="IVA" value = "${producto.getIvacompra()}">
											</fieldset>
										</p>
									</div>
								</div>
								
								<div class="field is-expanded">
									<div class="field has-addons">
										<p class="control">
											<a class="button is-success" title="Disabled button" disabled>
           										 Cantidad
         									</a>
										</p>
										<p class="control is-expanded">
											<input class="input" type="text" placeholder="cantidad" name = "Agregar" value ="Agregar Producto">
										</p>
									</div>
								</div>
							</div>
						</div>
						</form>
					</div>
					<footer class="card-footer">
    					<p class="card-footer-item">
     						<a href="#">Agregar Producto</a>
    					</p>
  					</footer>
				</div>
			</div>
			<div class = "column my-6">
				<div class="card">
					<form action="ControladorVentas" method="POST">
						<div class="card-content">
							<div class="field is-horizontal">
								<div class="field-label is-normal">
									<label class="label has-text-danger">FACTURA DE VENTA N°</label>
								</div>
								<div class="field-body">
									<div class="field">
										<p class="control is-expanded">
											<fieldset disabled>
											<input class="input" type="text" placeholder="000000" name="con_fac">
											</fieldset>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="card-content">
							<table class="table is-fullwidth">
								<thead>
									<tr>
										<th>Item</th>
										<th>COD</th>
										<th>Producto</th>
										<th>Cantidad</th>
										<th>Total</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="usuarios" items="${lista}">
										<tr>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div>
						</div>
						<div class="card-content">
							<div class="field is-grouped is-grouped-centered">
 				 				<p class="control">
    								<a class="button is-primary">
      									Confirmar venta
    								</a>
  								</p>
  								<p class="control">
    								<a class="button is-danger">
      									Cancelar Venta
    								</a>
  								</p>
							</div>
							<div class="field is-horizontal">
								<div class="field-label is-normal">
									<label class="label has-text-danger">TOTAL VENTA:</label>
								</div>
								<div class="field-body">
									<div class="field">
										<p class="control">
											<fieldset disabled>
												<input class="input" type="text" placeholder="0.00">
											</fieldset>
										</p>
									</div>
								</div>
								
								<div class="field-label is-normal">
									<label class="label has-text-danger">TOTAL IVA:</label>
								</div>
								<div class="field-body">
									<div class="field">
										<p class="control">
											<fieldset disabled>
												<input class="input" type="text" placeholder="0.00">
											</fieldset>
										</p>
									</div>
								</div>
								
								<div class="field-label is-normal">
									<label class="label has-text-danger">TOTAL CON IVA:</label>
								</div>
								<div class="field-body">
									<div class="field">
										<p class="control">
											<fieldset disabled>
												<input class="input" type="text" placeholder="0.00">
											</fieldset>
										</p>
									</div>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>