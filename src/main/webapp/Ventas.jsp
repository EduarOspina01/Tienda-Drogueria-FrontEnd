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
	<form action="ControladorVentas" method="POST">
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
          										<span class="material-icons"> perm_identity</span>
        									</span>
										</p>
										<p class = "control is-expanded">
											<button class="button is-success" name = "Buscar1" value ="Buscar_Cliente">
												Buscar
											</button>
										</p>
									</div>
								</div>
								<div class = "field is-expanded">
									<div class= "control">
										<fieldset>
											<input class="input" type="text" placeholder="Nombre Cliente" name = "salidaCleinte" value = "${cliente.getNombre_cliente()}">
										</fieldset>
									</div>
								</div>
							</div>
						</div>
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
          										 <span class="material-icons"> medical_services </span>
        									</span>
										</p>
										<p class = "control is-expanded">
											<button class="button is-success" name = "Buscar2" value ="Buscar_Producto">
												Buscar
											</button>
										</p>
									</div>
  								</div>
  								<div class="field is-expanded" >
  									<div class= "control">
										<fieldset>
											<input class="input" type="text" placeholder="Codigo Producto" name="nombre_prod" value = "${producto.getNombre_producto()}">
										</fieldset>
									</div>
  								</div>
  							</div>
						</div>
						<div class="field is-horizontal">
							<div class="field-label"></div>
							<div class="field-body">
								<div class="field is-expanded">
									<div class="field has-addons">
										<p class="control">
											<a class="button is-success" disabled>
           										 Valor
         									</a>
										</p>
										<div class="control is-expanded">
											<fieldset >
											<input class="input" type="text" placeholder="Valor" name="Valor" value = "${producto.getPrecio_compra()}">
											</fieldset>
										</div>
									</div>
								</div>
								
								<div class="field is-expanded">
									<div class="field has-addons">
										<p class="control">
											<a class="button is-success" title="Disabled button" disabled>
           										 IVA
         									</a>
										</p>
										<div class="control is-expanded">
											<fieldset>
											<input class="input" type="text" placeholder="IVA" name="IVA" value = "${producto.getIvacompra()}">
											</fieldset>
										</div>
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
											<input class="input" type="text" placeholder="Ingrese la cantidad cantidad" name = "cantidad" value ="">
										</p>
									</div>
								</div>
							</div>
						</div>				
					</div>
					<footer class="card-footer">
						<button class="button is-fullwidth is-success " name="Agregar" value = "Agregar">
							Agregar Producto
						</button>
  					</footer>
				</div>
			</div>
			<div class = "column my-6">
				<div class="card">
						<div class="card-content">
							<div class="field is-horizontal">
								<div class="field-label is-normal">
									<label class="label has-text-danger">FACTURA DE VENTA N°</label>
								</div>
								<div class="field-body">
									<div class="field">
										<div class="control is-expanded">
											<fieldset >
											<input class="input" type="text" placeholder="0" name="con_fac" value = "${numerofactura}"> 
											</fieldset>
										</div>
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
										<th>Total sin iva</th>
										<th>Iva</th>
										<th>Valor total</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="productos" items="${listaventas}">
										<tr>
											<td>${productos.getCodigo_dte()}</td>
											<td>${productos.getCod_producto()}</td>
											<td>${productos.getDescripcion()}</td>
											<td>${productos.getCantidad()}</td>
											<td>${productos.getValor_sin_iva()}</td>
											<td>${productos.getValor_iva()}</td>
											<td>${productos.getValor_total()}</td>
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
 				 					<button class="button is-primary " name="Finalizar" value = "Finalizar">
 				 						Confirmar venta
 				 					</button>
  								</p>
  								<p class="control">
  									<button class="button is-danger " name="Cancelar" value = "Cancelar">
 				 						Cancelar Venta
 				 					</button>
  								</p>
							</div>
							<div class="field is-horizontal">
								<div class="field-label is-normal">
									<label class="label has-text-danger">TOTAL:</label>
								</div>
								<div class="field-body">
									<div class="field">
										<p class="control">
											<fieldset>
												<input class="input" type="text" placeholder="0.00" value = "${totalsubtotal}">
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
											<fieldset >
												<input class="input" type="text" placeholder="0.00" value = "${totaliva}">
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
											<fieldset>
												<input class="input" type="text" placeholder="0.00" value = "${totalapagar}">
											</fieldset>
										</p>
									</div>
								</div>
							</div>
							<c:if test="${validacion == 1}">
							<div class = "box">
								<p class= "is-size-3 has-text-weight-bold has-text-centered"> Compra finalizada, asignada a la factura ${consecutivo}</p>
							</div>
							</c:if>
						</div>
				</div>
			</div>
		</div>
			<div class ="container is-max-desktop ">
  			<div class="box mt-5 has-text-centered inline inline-block has-background-light">
  				<p class="title is-3 has-text-center">MODULO GESTION DE VENTAS</p>
  				<p class="title is-5 has-text-center">Bienvenido a su drogueria</p>
			</div>
  		</div>
	</div>
	</form>
</body>
</html>