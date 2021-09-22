<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="UTF-8">
<title>Menu DRUGSTORE</title>
<script>
	function redireccion() {
		location.href = 'Usuario.jsp'
	}
</script>
<!-- Link que carga todas las librerias de bootstrap5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style>
body {
	background-image:
		url('https://image.freepik.com/vector-gratis/asistencia-sanitaria-medica-color-azul_1017-26800.jpg');
}
h3, p {
	color: blue;
}
</style>
</head>
<body>
	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-success">
		<div class="collapse navbar-collapse" id="navbar">
			<ul class="navbar-nav">
				<li class="nav-item active"><a
					style="margin-left: 10px; border: none"
					class="btn btn-outline-light" href="Controlador?menu=Principal">Inicio</a></li><!-- Boton Navbar Inicio  -->
				<li class="nav-item"><a style="margin-left: 10px; border: none"
					class="btn btn-outline-light" href="Controlador?menu=Usuario&accion=Listar">Usuarios</a></li><!-- Boton Navbar Usuario  -->
				<li class="nav-item"><a style="margin-left: 10px; border: none"
					class="btn btn-outline-light" href="Controlador?menu=Cliente">Clientes</a></li><!-- Boton Navbar Cliente  -->
				<li class="nav-item"><a style="margin-left: 10px; border: none"
					class="btn btn-outline-light" href="Controlador?menun=Proveedor">Proveedores</a></li><!-- Boton Navbar Proveedor  -->
				<li class="nav-item"><a style="margin-left: 10px; border: none"
					class="btn btn-outline-light" href="Controlador?menu=Producto">Productos</a></li><!-- Boton Navbar Productos  -->
				<li class="nav-item"><a style="margin-left: 10px; border: none"
					class="btn btn-outline-light" href="Controlador?menu=Ventas">Ventas</a></li><!-- Boton Navbar Ventas  -->
				<li class="nav-item"><a style="margin-left: 10px; border: none"
					class="btn btn-outline-light" href="Controlador?menu=Reporte">Reportes</a></li><!-- Boton Navbar Reportes  -->
			</ul>
		</div>
		<!-- Dropdown boton de sesion y fin de sesion  -->
		<div class="dropdown">
			<button style="border: none" class="btn btn-light dropdown-toggle"
				type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
				aria-expanded="true">${usuario.getNombre()}</button>
			<div class="dropdown-menu text-center"
				aria-labelledby="dropdownMenuButton1">
				<a class="dropdown-item" href="#"> <img src="img/user.png"
					alt="60" width="60">
				</a> <a class="dropdown-item" href="#">${usuario.getUsuario()}</a> <a
					class="dropdown-item" href="#">${usuario.getEmail()}</a>
				<div class="dropdown-divider"></div>
				<form action="Sesion" method="post">
					<button name="accion" value="Salir" class="dropdown-item" href="#">
						Salir</button>
				</form>
			</div>
		</div>
	</nav>
	<!-- Fin Navbar -->

	<!-- iframe comienzo de cargar paginas nuevas-->

	<!-- <div class = "m-4" style = "height: 1000px;">
		<iframe name="miCuadro" style ="heigth: 100%; width:100%";>
		</iframe>
	</div> -->

	<!-- FALTA CUADRAR PARA QUE SE VISUALIZEN LAS PAGINAS -->
	
	<!-- Container donde se encuentra el logo y el texto de bienvenida  -->
	<div class = "container">
		<div class = "row">
			<div class = "col text-center d-none d-lg-block col-md-12 col-lg-12 col-xl-12 rounded">
				<img alt="" src="imagenes/logo.jpg" width="480">
			</div>
			<div class = "col-12 text-center" >
				<h1>Bienvenidos a DRUGSTORE</h1>
			</div>
		</div>
	</div>
	
	<!-- Scrip de Bootstrap5  -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous">
		
	</script>
	</body>
</html>