function movimiento_jugador() {
    // Determinar direccion
    if (accion == 0) {
        if (obj_controles.boton_izquierda and !obj_controles.boton_derecha) {
            direccion_horizontal = -1;
        } else if (obj_controles.boton_derecha and !obj_controles.boton_izquierda) {
            direccion_horizontal = 1;
        }
    }

    // Manejar movimiento
    if ((accion == 0) or (accion == 1)) {
        if (tocando_suelo) {
            if (obj_controles.boton_derecha) {
                if (velocidad_horizontal > 0) {
                    velocidad_horizontal += aceleracion;
                } else {
                    velocidad_horizontal += desaceleracion;
                }
            }
            if (obj_controles.boton_izquierda) {
                if (velocidad_horizontal < 0) {
                    velocidad_horizontal -= aceleracion;
                } else {
                    velocidad_horizontal -= desaceleracion;
                }
            }

            if (!obj_controles.boton_derecha and !obj_controles.boton_izquierda) {
                if (velocidad_horizontal > 0) {
                    velocidad_horizontal -= friccion;
                }

                if (velocidad_horizontal < 0) {
                    velocidad_horizontal += friccion;
                }

                if (velocidad_horizontal <= friccion and velocidad_horizontal >= -friccion) {
                    velocidad_horizontal = 0;
                }
            }

            if (obj_controles.boton_derecha and obj_controles.boton_izquierda) {
                if (abs(velocidad_horizontal) <= desaceleracion) {
                    velocidad_horizontal = 0;
                }
            }
        } else {
            if (accion == 0) {
                if (obj_controles.boton_derecha) {
                    if (velocidad_horizontal > 0) {
                        velocidad_horizontal += aceleracion;
                    } else {
                        velocidad_horizontal += desaceleracion;
                    }
                }

                if (obj_controles.boton_izquierda) {
                    if (velocidad_horizontal < 0) {
                        velocidad_horizontal -= aceleracion;
                    } else {
                        velocidad_horizontal -= desaceleracion;
                    }
                }

                if (!obj_controles.boton_derecha and !obj_controles.boton_izquierda) {
                    if (velocidad_horizontal > 0) {
                        velocidad_horizontal -= friccion;
                    }

                    if (velocidad_horizontal < 0) {
                        velocidad_horizontal += friccion;
                    }

                    if (velocidad_horizontal <= friccion and velocidad_horizontal >= -friccion) {
                        velocidad_horizontal = 0;
                    }
                }

                if (obj_controles.boton_derecha and obj_controles.boton_izquierda) {
                    if (abs(velocidad_horizontal) <= desaceleracion) {
                        velocidad_horizontal = 0;
                    }
                }
            } else if (accion == 1) {
                if (obj_controles.boton_derecha) {
                    if (velocidad_horizontal > 0) {
                        velocidad_horizontal += aceleracion;
                    } else {
                        velocidad_horizontal += desaceleracion;
                    }
                }

                if (obj_controles.boton_izquierda) {
                    if (velocidad_horizontal < 0) {
                        velocidad_horizontal -= aceleracion;
                    } else {
                        velocidad_horizontal -= desaceleracion;
                    }
                }

                if (!obj_controles.boton_derecha and !obj_controles.boton_izquierda) {
                    if (velocidad_horizontal > 0) {
                        velocidad_horizontal -= friccion;
                    }

                    if (velocidad_horizontal < 0) {
                        velocidad_horizontal += friccion;
                    }

                    if (velocidad_horizontal <= friccion and velocidad_horizontal >= -friccion) {
                        velocidad_horizontal = 0;
                    }
                }

                if (obj_controles.boton_derecha and obj_controles.boton_izquierda) {
                    if (abs(velocidad_horizontal) <= desaceleracion) {
                        velocidad_horizontal = 0;
                    }
                }
            }
        }
    }

    // Manejo del salto
    if (obj_controles.boton_saltar and tocando_suelo and (accion == 0)) {
        accion = 1;
		tocando_suelo = false;
        velocidad_vertical = acos * altura_salto + (-asin * velocidad_horizontal) / 1.5;
        velocidad_horizontal = velocidad_horizontal * acos + asin * altura_salto;

        angulo = 0;
        acos = 1;
        asin = 0;
    }

    // Manejo de la altura minima del salto
    if (obj_controles.soltar_boton_saltar and (velocidad_vertical < altura_salto_minima) and (accion == 1)) {
        velocidad_vertical = altura_salto_minima;
    }

    if ((accion == 1) and !tocando_suelo) {
        if (obj_controles.boton_derecha) {
            if (velocidad_horizontal >= 0) {
                velocidad_horizontal += aceleracion / 2;
            } else {
                velocidad_horizontal += desaceleracion / 2;
            }
        }

        if (obj_controles.boton_izquierda) {
            if (velocidad_horizontal <= 0) {
                if (velocidad_horizontal > -limite_velocidad_horizontal) {
                    velocidad_horizontal -= aceleracion / 2;
                } else {
                    velocidad_horizontal -= desaceleracion / 2;
                }
            }

            if (!obj_controles.boton_derecha and !obj_controles.boton_izquierda) {
                if (velocidad_horizontal > 0) {
                    velocidad_horizontal -= friccion;
                }

                if (velocidad_horizontal < 0) {
                    velocidad_horizontal += friccion;
                }

                if ((velocidad_horizontal <= friccion) and (velocidad_horizontal >= -friccion)) {
                    velocidad_horizontal = 0;
                }
            }
        }
    }

    if (tocando_suelo and (accion == 1)) {
        accion = 0;
    }
}