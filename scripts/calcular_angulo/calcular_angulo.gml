function calcular_angulo(angulo, valor_para_precision, verificacion_angulo_final) {
	var direccion = floor(angulo);
	var acos = dcos(direccion);
	var asin = dsin(direccion);

	var punto_x_1 = round(x - acos * valor_para_precision);
	var punto_y_1 = round(y + asin * valor_para_precision);
	var punto_x_2 = round(x + acos * valor_para_precision);
	var punto_y_2 = round(y - asin * valor_para_precision);

	var primer_subconjunto = false;
	var segundo_subconjunto = false;

	while (verificacion_angulo_final > 0) {
		if (!primer_subconjunto) {
			if (collision_point(punto_x_1, punto_y_1, obj_superficie, true, true)) {
				primer_subconjunto = true;
			}

			punto_x_1 += asin;
			punto_y_1 += acos;
		}

		if (!segundo_subconjunto) {
			if (collision_point(punto_x_2, punto_y_2, obj_superficie, true, true)) {
				segundo_subconjunto = true;
			}

			punto_x_2 += asin;
			punto_y_2 += acos;
		}

		if (primer_subconjunto and segundo_subconjunto) {
			break;
		}
		else {
			--verificacion_angulo_final;
		}
	}

	return round(point_direction(punto_x_1, punto_y_1, punto_x_2, punto_y_2));
}