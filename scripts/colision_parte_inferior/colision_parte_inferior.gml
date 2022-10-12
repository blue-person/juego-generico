function colision_parte_inferior(mascara) {
	var punto_x = x + asin * mascara;
	var punto_y = y + acos * mascara;
	var radio = 8;
	
	if (collision_circle(punto_x, punto_y, radio, obj_superficie, true, true)) {
		return true;
	}

	return false;
}
