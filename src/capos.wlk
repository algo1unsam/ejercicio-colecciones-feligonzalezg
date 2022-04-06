import artefactos.*
import enemigos.*

object rolando {

	var property poderBase = 5
	var property poderDePelea = poderBase
	var property capacidad = 2
	var property objetosEncontrados = []
	const property objetosAgarrados = #{}
	const property objetosEnCastillo = #{}

	method encontreObjeto(objeto) {
		if (objeto.cantidad() > 0) {
			objetosEncontrados.add(objeto)
			objeto.cantidad(objeto.cantidad() - 1)
			if (objetosAgarrados.size() < capacidad) {
				objetosAgarrados.add(objeto)
				poderDePelea += objeto.aportaPoder(poderBase)
			}
		}
	}

	method volverAlCastilloDePiedra() {
		objetosEnCastillo.addAll(objetosAgarrados)
		objetosAgarrados.clear()
		self.poderDePelea(poderBase)
	}

	method objetosAgarradosTotales() {
		return self.objetosAgarrados()+self.objetosEnCastillo()
	}

	method batalla() {
		poderBase += 1
		objetosAgarrados.forEach{ objeto => objeto.aumentaUso()}
		poderDePelea = poderBase
		poderDePelea += objetosAgarrados.forEach{ objeto => objeto.aportaPoder(poderBase) }
	}

}

