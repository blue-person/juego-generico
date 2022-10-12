function colision_con_suelo(mascara) {
	var punto_x = x - asin * (mascara * 2.5);
	var punto_y = y + acos * (mascara * 2.5);
	var radio = 9;
	
	if (collision_circle(punto_x, punto_y, radio, obj_superficie, true, true)) {
		return true;
	}

	return false;
}

