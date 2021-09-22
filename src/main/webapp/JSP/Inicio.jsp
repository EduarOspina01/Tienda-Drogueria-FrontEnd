<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<title>Login DRUGSTORE</title>
<!-- Link que carga todas las librerias de bootstrap5 -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style type="text/css">
body {
	background:
		url(https://image.freepik.com/vector-gratis/asistencia-sanitaria-medica-color-azul_1017-26800.jpg);
}
.bg {
	background-image: url(imagenes/logo2.png);
	background-position: center;
	background-size: cover;
}
</style>

</head>
<body>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-/bQdsTh/da6pkI1MST/rWKFNjaCP5gBSY4sEBT38Q/9RBh9AH40zEOg7Hlq2THRZ"
		crossorigin="anonymous"></script>

	<!-- Se crea un div con la clase container de bootstrap para centrar la pagina -->
	<div = class="container w-75 bg-primary mt-5 rounded shadow">
		<!-- Se crean un div con la clase row para encapsular todo el codigo HTML y CSS-->
		<div = class="row align-items-stretch">
			<div
				= class="col bg bg-white d-none d-lg-block col-md-5 col-lg-5 col-xl-6 rounded">
				<!-- Responsive -->
			</div>
			<div = class="col bg-white p-5 rounded-end">
				<!-- clase que crea una columna o marco invisible -->
				<div class="text-end">
					<!-- clase que alinea el texto al final de la columna -->
					<img alt="" src="imagenes/logo.jpg" width="48">
					<!-- Se carga el logoy se alinea al final como se explica anteriormente -->
				</div>
				<h2 class="fw-bold text-center pt-5 mb-5">Bienvenidos a
					DRUGSTRORE</h2>
				<!-- la clase fw-bold da negrilla text center centra y pt y mb da volumen al texto -->
				<!-- LOGIN -->

				<form action="Sesion" method="POST">
					<!-- formulario -->
					<div class="mb-4">
						<!-- margen al texto -->
						<label class="form-label">Usuario</label> <input type="text"
							class="form-control" name="txtUsuario">
						<!-- Input Usuario -->
					</div>
					<div class="mb-4">
						<label for="password" class="form-label">Contrase�a</label> <input
							type="password" class="form-control" name="txtContrase�a">
						<!-- Input Contrase�a -->
					</div>

					<div class="text-center">
						<!-- una cuadricula para que el boton quede releno en toda la columna -->
						<button type="submit" name="accion" class="btn btn-success my-1"
							value="Ingresar">Ingresar</button>
						<!-- Boton de ingreso -->
					</div>
				</form>
			</div>

		</div>
	</div>

	<%
	String  accion = request.getParameter("accion");
	if (accion != null){
		accion = request.getParameter("accion");
		//Al hacer click en el bot�n ingresar
		if (accion.equalsIgnoreCase("Ingresar")) {
			//Crea dos strings, una para el user y otra para el password.
			String username = request.getParameter("txtUsuario");
			String password = request.getParameter("txtContrase�a");
			//Si alguna de las dos son nulas
			if (username == "" || password == "") {
				//Muestra un mensaje javascript se�alando que faltan campos por llenar
				out.println("<script>alert('Por favor llene todos los campos');</script>");
			}
			//Si no...
			else {
				//Muestra un mensaje javascript se�alando que hay daros err�neos
				out.println("<script>alert('Usuario o contrase�a incorrecta');</script>");
			}
		}
	}							
	
	%>
</body>
</html>