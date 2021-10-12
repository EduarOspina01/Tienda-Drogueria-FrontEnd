function cargarArchivo(elemento){
	var file = elemento.files[0];
	var objHidden = document.formulario.nombre;
	objHidden.value = file.name;
	document.formulario.action = "ControladorProductos";
	document.formulario.submit();
	alert("se proceso");
}
