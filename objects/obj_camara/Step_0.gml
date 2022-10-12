// Calculo principal para el efecto de Smooth Camera
x += (posicion_x - x) / valor_retraso;
y += (posicion_y - y) / valor_retraso;

// Establecer el enfoque de la camara
if (objeto_enfoque != noone) {
	posicion_x = objeto_enfoque.x;
	posicion_y = objeto_enfoque.y;
} 

// Sacudir camara
if (permitir_sacudir_camara) {
	x += random_range(-sacudida_restante, sacudida_restante);
	y += random_range(-sacudida_restante, sacudida_restante);
	
	if (sacudida_restante == 0) {
		permitir_sacudir_camara = false;
	} else {
		var calculo_sacudida = sacudida_restante - ((1 / duracion_sacudida) * magnitud_sacudida)
		sacudida_restante = max(0, calculo_sacudida);
	}
}

// Hacer que la camara no se salga de los bordes del nivel
var mitad_ancho = global.ancho / 2;
var mitad_altura = global.altura / 2;
x = clamp(x, mitad_ancho, room_width - mitad_ancho);
y = clamp(y, mitad_altura, room_height - mitad_altura);

// Establecer la vista de la camara, esto se hace en modo de matriz
camera_set_view_mat(camara, matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0));