if (global.tipo_controles = "teclado") {
    boton_derecha = keyboard_check(vk_right);
    soltar_boton_derecha = keyboard_check_released(vk_right);

    boton_izquierda = keyboard_check(vk_left);
    soltar_boton_izquierda = keyboard_check_released(vk_left);

    boton_abajo = keyboard_check(vk_down);
    pulsar_boton_abajo = keyboard_check_pressed(vk_down);
    soltar_boton_abajo = keyboard_check_released(vk_down);

    boton_arriba = keyboard_check(vk_up);
    pulsar_boton_arriba = keyboard_check_pressed(vk_up);
    soltar_boton_arriba = keyboard_check_released(vk_up);

    boton_saltar = keyboard_check_pressed(vk_space);
    soltar_boton_saltar = keyboard_check_released(vk_space);

    boton_atacar = keyboard_check(tecla_z);
    pulsar_boton_atacar = keyboard_check_pressed(tecla_z);

    tocar_boton_boost = keyboard_check(tecla_x);
    boton_boost = keyboard_check_pressed(tecla_x);
    soltar_boton_boost = keyboard_check_released(tecla_x);

    boton_especial = keyboard_check_pressed(tecla_w);
    boton_enter = keyboard_check_pressed(vk_enter);
} else {
	var comprobacion;
    var stick_horizontal = gamepad_axis_value(0, gp_axislh);
    var stick_vertical = gamepad_axis_value(0, gp_axislv);
	
	// Derecha
	comprobacion = stick_horizontal >= sensibilidad;
    if (!boton_derecha and comprobacion) {
        boton_derecha = true;
        soltar_boton_derecha = false;
        alarm[0] = tiempo_alarma;
    } else if (boton_derecha and !comprobacion) {
        boton_derecha = false;
        soltar_boton_derecha = true;
        alarm[0] = tiempo_alarma;
    }
	
	// Izquierda
	comprobacion = stick_horizontal <= -sensibilidad;
	if (!boton_izquierda and comprobacion) {
        boton_izquierda = true;
        soltar_boton_izquierda = false;
        alarm[0] = tiempo_alarma;
    } else if (boton_izquierda and !comprobacion) {
        boton_izquierda = false;
        soltar_boton_izquierda = true;
        alarm[0] = tiempo_alarma;
    }
	
	// Abajo
	comprobacion = stick_vertical >= sensibilidad;
    if (!boton_abajo and comprobacion) {
        boton_abajo = true;
        pulsar_boton_abajo = true;
        soltar_boton_abajo = false;
        alarm[0] = tiempo_alarma;
    } else if (boton_abajo and !comprobacion) {
        boton_abajo = false;
        pulsar_boton_abajo = false;
        soltar_boton_abajo = true;
        alarm[0] = tiempo_alarma;
    }
	
	// Arriba
	comprobacion = stick_vertical <= -sensibilidad;
    if (!boton_arriba and comprobacion) {
        boton_arriba = true;
        pulsar_boton_arriba = true;
        soltar_boton_arriba = false;
        alarm[0] = tiempo_alarma;
    } else if (boton_arriba and !comprobacion) {
        boton_arriba = false;
        pulsar_boton_arriba = false;
        soltar_boton_arriba = true;
        alarm[0] = tiempo_alarma;
    }
	
    boton_saltar = gamepad_button_check_pressed(0, boton_a);
    soltar_boton_saltar = gamepad_button_check_released(0, boton_a);

    boton_atacar = gamepad_button_check(0, boton_b);
    pulsar_boton_atacar = gamepad_button_check_pressed(0, boton_b);

    tocar_boton_boost = gamepad_button_check(0, boton_x);
    boton_boost = gamepad_button_check_pressed(0, boton_x);
    soltar_boton_boost = gamepad_button_check_released(0, boton_x);

    boton_especial = gamepad_button_check_pressed(0, boton_y);
    boton_enter = gamepad_button_check_pressed(0, gp_start);
}