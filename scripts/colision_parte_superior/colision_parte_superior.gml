function colision_parte_superior(mascara) {
	var punto_x = x - asin * mascara;
	var punto_y = y - acos * mascara;
	var radio = 3;
	
	if (collision_circle(punto_x, punto_y, radio, obj_superficie, true, true)) {
		return true;
	}

	return false;
}
