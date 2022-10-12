function fisicas_jugador() {
    // Establecer los limites de velocidad del movimiento del jugador
    if (velocidad_horizontal > limite_velocidad_horizontal) then velocidad_horizontal = limite_velocidad_horizontal;
    if (velocidad_horizontal < -limite_velocidad_horizontal) then velocidad_horizontal = -limite_velocidad_horizontal;
    if (velocidad_vertical > limite_velocidad_vertical) then velocidad_vertical = limite_velocidad_vertical;
    if (velocidad_vertical < -limite_velocidad_vertical) then velocidad_vertical = -limite_velocidad_vertical;

    // Velocidad horizontal
    if (velocidad_horizontal > 0) {
        for (var n = 0; (n < velocidad_horizontal) and !colision_parte_derecha(16); ++n) {
            x += acos;
            y -= asin;
        }
    }

    if (velocidad_horizontal < 0) {
        for (var n = 0; (n > velocidad_horizontal) and !colision_parte_izquierda(16); --n) {
            x -= acos;
            y += asin;
        }
    }

    // Velocidad vertical
    if (velocidad_vertical > 0) {
        for (var n = 0; (n < velocidad_vertical) and !colision_parte_inferior(16); ++n) {
            y += 1;
        }
    }

    if (velocidad_vertical < 0) {
        for (var n = 0; (n > velocidad_vertical) and !colision_parte_superior(16); --n) {
            y -= 1;
        }
    }

    // Aterrizar en el suelo
    if ((velocidad_vertical >= 0) and !tocando_suelo and colision_parte_inferior(16) and (colision_linea_izquierda(16) or colision_linea_derecha(16))) {
        angulo = calcular_angulo(angulo, 16, 16);
        acos = dcos(angulo);
        asin = dsin(angulo);

        velocidad_horizontal -= (asin * velocidad_vertical * 2);
        velocidad_vertical = 0;
        tocando_suelo = true;
    }

    // Mantener en el suelo
    if (tocando_suelo) {
        while (colision_parte_principal(16)) {
            x -= asin;
            y -= acos;
        }

        while (!colision_parte_principal(16) and colision_con_suelo(16)) {
            x += asin;
            y += acos;
        }

        var punto_x = x + asin * 16;
        var punto_y = y + acos * 16;
        if (!collision_point(punto_x, punto_y, obj_superficie, true, true)) {
            x += asin;
            y += acos;
        } else {
            x -= asin;
            y -= acos;
        }
    }

    // Dejar de estar en el suelo
    if ((!colision_linea_izquierda(16) or !colision_linea_derecha(16)) and !colision_parte_inferior(16) and tocando_suelo and !collision_line(x, y, x + (16 + 4) * asin, y + (16 + 4) * acos, obj_superficie, true, true)) {
        velocidad_vertical = -asin * velocidad_horizontal;
        velocidad_horizontal = acos * velocidad_horizontal;

        angulo = 0;
        asin = 0;
        acos = 1;
        tocando_suelo = false;
    }

    // Colisionar con las paredes
    while (colision_parte_derecha(16)) {
        x -= acos;
        y += asin;
        velocidad_horizontal = 0;
    }

    while (colision_parte_izquierda(16)) {
        x += acos;
        y -= asin;
        velocidad_horizontal = 0;
    }

    // Establecer gravedad
    if (!tocando_suelo) {
        velocidad_vertical += gravedad;
    }

    // Velocidad segun el angulo con el suelo
    if ((angulo > 70) and (angulo < 290) and (abs(velocidad_horizontal) < 1.5) and (accion != 11)) {
        x -= asin * 5;
        y -= acos * 5;
        angulo = 0;

        velocidad_vertical = -asin * velocidad_horizontal;
        velocidad_horizontal = acos * velocidad_horizontal;
        tocando_suelo = false;
    }

    // Pendiente del suelo
    if (accion == 0) {
        pendiente = 0.125;
    }

    if (accion == 2) {
        if (sign(velocidad_horizontal) == sign(asin)) {
            pendiente = 0.078125;
        } else {
            pendiente = 0.3125;
        }
    }

    if ((accion >= 0) and ((velocidad_horizontal < limite_velocidad_horizontal) and (velocidad_horizontal > -limite_velocidad_horizontal))) {
        velocidad_horizontal -= pendiente * asin;
    }

    if (tocando_suelo and (colision_linea_izquierda(16) and colision_linea_derecha(16))) {
        angulo = calcular_angulo(angulo, 16, 25);
    }

    if (!tocando_suelo and colision_parte_superior(16) and velocidad_vertical < 0) {
        var verificar_angulo = calcular_angulo(180, 16, 25);

        if ((verificar_angulo >= 125) and (verificar_angulo <= 170)) {
            velocidad_horizontal = -velocidad_vertical;
            velocidad_vertical = 0;

            angulo = verificar_angulo;
            accion = 0;
        } else if ((verificar_angulo >= 190) and (verificar_angulo <= 235)) {
            velocidad_horizontal = velocidad_vertical;
            velocidad_vertical = 0;

            angulo = verificar_angulo;
            accion = 0;
        } else {
            velocidad_vertical = 0;
            angulo = 0;
        }
    }

    acos = dcos(angulo);
    asin = dsin(angulo);
}