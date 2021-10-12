<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta charset="utf-8">
<title>Login DROGUERIA</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bulma@0.9.3/css/bulma.min.css">
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
</head>
<body>
	<!-- div con el fondo de la pagina -->
	<div id="background-image"></div>
	<!-- div para centrar el contenido en la pagina -->
	<div id="login-form-container">
		<!-- Clase card de bulma e inicio del login -->
		<div class="card" style="width: 600px;">
			<div class="card-image">
				<figure class="image ">
					<img src="img/logo2.png" alt="Placeholder image">
				</figure>
			</div>
			<div class="card-content">
				<div class="media">
					<p class="is-size-2 has-text-justified">Bienvenidos a DROGUERIA</p>
				</div>
				
				<c:set var = "inicio" value = "2"/> <!-- Probar este codigo -->
				<c:if test="${validacion == 0}">
					<c:set var = "inicio" value = "0"/>
				</c:if>
				<c:if test="${validacion == 1}">
					<c:set var = "inicio" value = "0"/>
				</c:if>
				<form action="Controlador" method="GET">
				<div class="content">
				
				<!-- Validaciones -->
				<c:if test="${inicio == 2}">
					<div class="field">
						<p class="control has-icons-left">
							<input class="input is-primary" type="text" placeholder="Ingrese su Usuario" name="txtUsuario"> 
								<span class="icon is-small is-left"> 
									<span class="material-icons"> account_circle </span>
								</span>
							
						</p>
					</div>
					<div class="field">
						<p class="control has-icons-left">
							<input class="input is-primary" type="password" placeholder="Ingrese su Contraseña" name="txtContrasena">
							<span class="icon is-small is-left"> 
								<span class="material-icons"> lock </span>
							</span>
						</p>
					</div>
				</c:if>
				
				<c:if test="${validacion == 0}">
					<div class="field">
						<p class="control has-icons-left">
							<input class="input is-danger" type="text" placeholder="Usuario o contraseña incorrecta" name="txtUsuario"> 
								<span class="icon is-small is-left"> 
									<span class="material-icons"> account_circle </span>
								</span>
							
						</p>
					</div>
					<div class="field">
						<p class="control has-icons-left">
							<input class="input is-danger" type="password" placeholder="Usuario o contraseña incorrecta" name="txtContrasena">
							<span class="icon is-small is-left"> 
								<span class="material-icons"> lock </span>
							</span>
						</p>
					</div>
				</c:if>
				
				<c:if test="${validacion == 1}">
					<div class="field">
						<p class="control has-icons-left">
							<input class="input is-danger" type="text" placeholder="Por favor llene todos los campos" name="txtUsuario"> 
								<span class="icon is-small is-left"> 
									<span class="material-icons"> account_circle </span>
								</span>
							
						</p>
					</div>
					<div class="field">
						<p class="control has-icons-left">
							<input class="input is-danger" type="password" placeholder="Por favor llene todos los campos" name="txtContrasena">
							<span class="icon is-small is-left"> 
								<span class="material-icons"> lock </span>
							</span>
						</p>
					</div>
				</c:if>
					<div class="field">
						<button class="button is-fullwidth is-success is-active" name = "accion" value = "Ingresar">
							<span class="material-icons"> login </span>
							<strong>Ingresar</strong> 
						 </button>
						<!--  <input class="button is-fullwidth is-light is-active" type = "submit" name = "action" value = "Ingresar">-->
					</div>
				</div>
				</form>
				
			</div>
		</div>
	</div>
</body>
</html>