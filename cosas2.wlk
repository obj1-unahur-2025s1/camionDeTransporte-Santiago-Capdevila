object knightRider {
    method peso() {
      return 500
    }

    method peligrosidad() {
        return 10
    }

    method bultos() {
        return 1
    }

    method consecuenciaDeLaCarga() {
        // No hace nada
    }
}

object bumblebee {
    var estaComoRobot = false

    method peso() {
        return 800
    }

    method estaComoRobot() {
        return estaComoRobot
    }

    method transformarceEnAuto() {
        estaComoRobot = false
    }

    method transformarceEnRobot() {
        estaComoRobot = true
    }

    method peligrosidad() {
        if (estaComoRobot) {
            return 30
        } else {
            return 5
        }
    }

    method bultos() {
        return 2
    }

    method concecuenciaDeLaCarga() {
        self.transformarceEnRobot()
    }
}

object ladrillos {
    var cantidad = 0

    method cantidad(unaCantidad) {
        cantidad = unaCantidad
    }

    method peso() {
        return 2 * cantidad
    }

    method peligrosidad() {
        return 2
    }

    method bultos() {
        if (cantidad <= 100) {
            return 1
        } else if (cantidad.between(101, 300)) {
            return 2
        } else {
            return 3
        }
    }

     method concecuenciaDeLaCarga() {
        self.cantidad(12)
    }

    // method bultosSinIF() {
    //     return (2.min(1.max(cantidad - 99))).max(3.min(cantidad - 298))
    // }
}

object arena {
    var property peso = 0

    // method peso(unPeso) {
    //   peso = unPeso
    // }

    // method peso() {
    //   return peso
    // }

    method peligrosidad() {
      return 1
    }

    method bultos() {
        return 1
    }

     method concecuenciaDeLaCarga() {
        peso = 0.max(peso - 10)
    }
}

object bateriaAntiaerea {
    var estaConMisiles = false

    method cargarMisiles() {
        estaConMisiles = true
    }

    method descargarMisiles() {
        estaConMisiles = false
    }

    method peso() {
        if (estaConMisiles) {
            return 300
        } else {
            return 200
        }
    }

    method peligrosidad() {
        if (estaConMisiles) {
            return 100
        } else {
            return 0
        }
    }

    method bultos() {
        if (estaConMisiles) {
            return 2
        } else {
            return 1
        }

    }

     method concecuenciaDeLaCarga() {
        self.cargarMisiles()
    }
}

object contenedorPortuario {
    const cosas = []

    method agregarCosa(unaCosa) {
        cosas.add(unaCosa)
    }

    method quitarCosa(unaCosa) {
        cosas.remove(unaCosa)
    }

    method agregarVariasCosas(unaListaDeCosas) {
        cosas.addAll(unaListaDeCosas)
    }

    method peso() {
        return 100 + self.pesoDeLasCosas()
    }

    method pesoDeLasCosas() {
        return cosas.sum({cosa => cosa.peso()})
    }

    method peligrosidad() {
        if (cosas.isEmpty()) {
            return 0
        } else {
            return cosas.max({cosa => cosa.peligrosidad()}).peligrosidad()
        }
    }

    method bultos() {
        return 1 + cosas.sum({cosa => cosa.bultos()})
    }

     method concecuenciaDeLaCarga() {
        cosas.forEach({cosa => cosa.consecuenciaDeLaCarga()})
    }
}

object residuosRadioactivos {
    var property peso = 0

    method peligrosidad() {
      return 200
    }

    method bultos() {
      return 1
    }

     method concecuenciaDeLaCarga() {
        peso = peso + 15
    }
}

object embalaje {
    var property cosaEmbuelta = arena

    method peso() {
        return cosaEmbuelta.peso()
    }

    method peligrosidad() {
        return cosaEmbuelta.peligrosidad() / 2
    }

    method bultos() {
        return 2
    }

     method concecuenciaDeLaCarga() {
        // No hace nada
    }
}