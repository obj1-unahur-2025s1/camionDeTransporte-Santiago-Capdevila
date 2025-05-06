object knightRider {
    method peso() {
      return 500
    }

    method peligrosidad() {
        return 10
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
}

object residuosRadioactivos {
    var property peso = 0

    method peligrosidad() {
      return 200
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
}

