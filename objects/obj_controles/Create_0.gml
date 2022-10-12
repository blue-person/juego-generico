switch (global.tipo_controles) {
    case "teclado":
		tecla_w = ord("W");
		tecla_a = ord("A");
		tecla_s = ord("S");
		tecla_d = ord("D");
		tecla_z = ord("Z");
		tecla_x = ord("X");
		tecla_w = ord("W");
        break;
    case "gamepad":
        sensibilidad = 0.5;
		tiempo_alarma = room_speed / 30;
		gamepad_set_axis_deadzone(0, sensibilidad);
	
		boton_a = gp_face1;
		boton_b = gp_face2;
		boton_x = gp_face3;
		boton_y = gp_face4;
		
		boton_derecha = false;
		soltar_boton_derecha = false;
		
		boton_izquierda = false;
		soltar_boton_izquierda = false;
		
		boton_arriba = false;
		pulsar_boton_arriba = false;
		soltar_boton_arriba = false;
		
		boton_abajo = false;
		pulsar_boton_abajo = false;
		soltar_boton_abajo = false;
        break;
}