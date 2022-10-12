// Tamaño de pantalla
global.ancho = 456;
global.altura = 256;

// Determinar el tipo de controles
if (gamepad_is_connected(0)) {
	global.tipo_controles = "gamepad";
} else {
	global.tipo_controles = "teclado";
}