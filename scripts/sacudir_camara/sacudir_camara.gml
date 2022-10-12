function sacudir_camara(magnitud, duracion) {
	with (obj_camara) {
		permitir_sacudir_camara = true;
		
		if (magnitud > sacudida_restante) {
			magnitud_sacudida = magnitud;
			sacudida_restante = magnitud;
			duracion_sacudida = duracion;
		}
	}
}