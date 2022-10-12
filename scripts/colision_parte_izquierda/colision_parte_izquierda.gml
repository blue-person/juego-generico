function colision_parte_izquierda(mascara) {
	var punto_x = x - acos * mascara - asin * 2;
	var punto_y = y + asin * mascara - acos * 2;
	var radio = 3;
	
	if (collision_circle(punto_x, punto_y, radio, obj_superficie, true, true)) {
		return true;
	}
	
	return false;
}
