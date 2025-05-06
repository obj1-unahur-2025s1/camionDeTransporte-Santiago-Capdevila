object camion {
    const carga = []

    method cargar(unaCosa) {
        carga.add(unaCosa)
    } 

    method descargar(unaCosa) {
        carga.remove(unaCosa)
    }

    method pesoTotal() {
        return 1000 + self.cargaTotal()
    }

    method cargaTotal() {
        return carga.sum({cosa => cosa.peso()})
    }

    method todoPesoPar() {
        return carga.all({cosa => cosa.peso().even()})
    }

    method algoQuePesa(unValor) {
        return carga.any({cosa => cosa.peso() == unValor})
    }

    method cosaConPeligrosidad(unNivel) {
        return carga.find({cosa => cosa.peligrosidad() == unNivel})
    }

    method cosasQueSuperanPeligrosidad2(unNivel) {
        return carga.filter({cosa => cosa.peligrosidad() > unNivel})
    }

    method cosasQueSuperanPeligrosidad(unaCosa) {
        return carga.filter({cosa => cosa.peligrosidad() > unaCosa.peligrosidad()})
    }

    method cosasMasPeligrosas(unaCosa) {
        return self.cosasQueSuperanPeligrosidad(unaCosa.peligrosidad())
    }

    method estaExedidoDePeso() {
        return self.pesoTotal() > 2500
    }

    method puedeCircular(unNivel) {
        return self.estaExedidoDePeso() && self.cosasQueSuperanPeligrosidad(unNivel).isEmpty()
    }

    method tieneAlgoQuePesa(min, max) {
        return carga.any({cosa => cosa.peso().between(min, max)})
    } 

    method cosaMasPesada() {
        return carga.max({cosa => cosa.peso()})
    }
}

