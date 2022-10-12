// Crear vista
view_enabled = true;
view_visible[0] = true;
view_xport[0] = 0;
view_yport[0] = 0;
view_wport[0] = global.ancho;
view_hport[0] = global.altura;
view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, noone, -1, -1, 32, 32);

// Crear camara
camara = camera_create();
var posicion_minima = 1;
var posicion_maxima = 10000;

camera_set_view_mat(camara, matrix_build_lookat(x, y, -10, x, y, 0, 0, 1, 0));
camera_set_proj_mat(camara, matrix_build_projection_ortho(global.ancho, global.altura, posicion_minima, posicion_maxima));
view_camera[0] = camara;

// Determinar ubicacion inicial de la camara
posicion_x = x;
posicion_y = y;

// Determinar enfoque de la camara
if (instance_exists(obj_jugador)) {
	objeto_enfoque = obj_jugador;
} else {
	objeto_enfoque = noone;
}

// Valores del efecto de Smooth Camera
valor_retraso = 5;

// Sacudir camara
permitir_sacudir_camara = false;
duracion_sacudida = 0;
magnitud_sacudida = 0;
sacudida_restante = 0;

// Mirar hacia arriba o hacia abajo
cronometro = 0;
tiempo_requerido = room_speed * 1.5;