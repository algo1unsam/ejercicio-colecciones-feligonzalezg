import artefactos.*
import casas.*
import enemigos.*

object erethia {

	const property enemigos = #{ archibaldo, caterina, astra }

	method enemigosVencibles(personaje) {
		return enemigos.filter({ enemigo => personaje.puedeVencer(enemigo) })
	}

	method moradasConquistables(personaje) {
		return self.enemigosVencibles(personaje).map({ enemigo => enemigo.casa() })
	}

	method esPoderoso(personaje) {
		return enemigos.all({ enemigo => personaje.puedeVencer(enemigo) })
	} // .all({}) DEVUELVE BOOLEANO SI LOS LOS ELEMENTOS CUMPLEN LA CONDICION DADA

}

object rolando {

	const casa = castilloDePiedra
	var property poderBase = 5
	var property capacidad = 2
	const property artefactosEncontrados = []
	const property artefactosAgarrados = #{}
	const property enemigosDerrotados = []

//	const property casasConquistadas = []
	method encontrar(artefacto) {
		if (artefacto.cantidad() > 0) {
			artefactosEncontrados.add(artefacto)
			artefacto.cantidad(artefacto.cantidad() - 1)
			if (artefactosAgarrados.size() < capacidad) {
				artefactosAgarrados.add(artefacto)
			}
		}
	}

	method volverACasa() {
		casa.dejarArtefactos(artefactosAgarrados)
		artefactosAgarrados.clear()
	}

	method artefactosAgarradosTotales() {
		return self.artefactosAgarrados() + casa.artefactosEnCasa()
	}

	method poderDePelea() {
		return self.poderBase() + artefactosAgarrados.sum({ artefacto => artefacto.poder(self) })
	}

	method batalla() {
		poderBase += 1
		artefactosAgarrados.forEach{ artefacto => artefacto.usar()}
	}

	method poderArtefactoMasPoderosoEnCasa() {
		return casa.artefactoMasPoderosoEnCasa(self)
	}

	method puedeVencer(enemigo) {
		return self.poderDePelea() > enemigo.poderDePelea()
	}

	method enemigosVencibles(mundo) {
		return mundo.enemigosVencibles(self)
	}

	method moradasConquistables(mundo) {
		return mundo.moradasConquistables(self)
	}

//	method atacarTodosEnemigos() {
//		erethia.enemigos().forEach{enemigo => if (!enemigo.fueDerrotado()){
//			if (self.poderDePelea() > enemigo.poderDePelea()){
//			self.enemigoDerrotado(enemigo)
//			self.conquistarCasa(enemigo)
//			}
//		}
//		}
//	}
//	
//	method atacarEnemigo(enemigo) {
//		if (!enemigo.fueDerrotado()){
//			if (self.poderDePelea() > enemigo.poderDePelea()){
//				self.enemigoDerrotado(enemigo)
//				self.conquistarCasa(enemigo)
//			}
//		}
//	}
//	
//	method enemigoDerrotado(enemigo) {
//		enemigosDerrotados.add(enemigo)
//		enemigo.derrotado()
//	}
//	method conquistarCasa(enemigo) {
//		casasConquistadas.add(enemigo.casa())
//	}
//	
	method poderoso(mundo) {
		return mundo.esPoderoso(self)
	}

//	method esPoderoso() { OPCION RESUELVE PERO NO ES LA MEJOR
//		return self.poderDePelea() > erethia.enemigos().map({enemigo => enemigo.poderDePelea()}).maxIfEmpty({0})
//	}
//	
	method artefactoFatal(enemigo) {
		return artefactosAgarrados.find({ artefacto => self.esFatal(artefacto, enemigo) })
	}

	method esFatal(artefacto, enemigo) {
		return artefacto.poder() + self.poderBase() > enemigo.poderDePelea()
	}

	method tieneArtefactoFatal(enemigo) {
		return artefactosAgarrados.any({ artefacto => self.esFatal(artefacto, enemigo) })
	}

}

