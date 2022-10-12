function colision_parte_principal(mascara) {
	if (collision_circle(x, y, mascara, obj_superficie, true, true)) {
		return true;
	}

	return false;
}
