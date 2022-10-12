if (window_get_fullscreen()) {
	window_set_fullscreen(false);
	window_set_size(global.ancho * zoom, global.altura * zoom);
} else {
	window_set_fullscreen(true);
}