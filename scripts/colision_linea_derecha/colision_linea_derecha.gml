function colision_linea_derecha(mascara) {
	var linea = floor(mascara * 3.5);
	
	var punto_x_1 = x + acos * mascara + asin * mascara;
	var punto_y_1 = y - asin * mascara + acos * mascara;
	var punto_x_2 = x + acos * mascara + asin * linea;
	var punto_y_2 = y - asin * mascara + acos * linea;
	
	if (collision_line(punto_x_1, punto_y_1, punto_x_2, punto_y_2, obj_superficie, true, true)) {
		return true;
	}

	return false;
}
