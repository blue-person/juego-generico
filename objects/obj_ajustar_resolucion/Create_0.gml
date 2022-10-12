// Declarar variables
permitir_pantalla_completa = true;
zoom = 1;
room_speed = 60;

// Ajustar la resolucion y el tamaño
display_set_gui_size(global.ancho, global.altura);
surface_resize(application_surface, global.ancho, global.altura);
window_set_size(global.ancho, global.altura);
window_center();
window_set_fullscreen(permitir_pantalla_completa);