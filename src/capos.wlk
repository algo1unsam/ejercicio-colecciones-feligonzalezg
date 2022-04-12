import artefactos.*
import casas.*
import enemigos.*

object rolando {

	const casa=castilloDePiedra
	var property poderBase = 5
	var property capacidad = 2
//	var property vidas = 3
	const property artefactosEncontrados = []
	const property artefactosAgarrados = #{}
	const property enemigos = #{archibaldo,caterina,astra}
	const property enemigosDerrotados = []
	const property casasConquistadas = []

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
		return self.artefactosAgarrados()+casa.artefactosEnCasa()
	}

	method poderDePelea() {
		return self.poderBase() + artefactosAgarrados.sum({ artefacto => artefacto.aportaPoder(self) })
	}

	method batalla() {
		poderBase += 1
		artefactosAgarrados.forEach{ artefacto => artefacto.usar() }
	}

	method poderArtefactoMasPoderosoEnCasa() {
		return casa.artefactoMasPoderosoEnCasa(self)
	}
	
	method atacarTodosEnemigos() {
		enemigos.forEach{enemigo => if (!enemigo.fueDerrotado()){
			if (self.poderDePelea() > enemigo.poderDePelea()){
			self.enemigoDerrotado(enemigo)
			self.conquistarCasa(enemigo)
			}//else {vidas -= 1}
		}}
	}
	
	method atacarEnemigo(enemigo) {
		if (!enemigo.fueDerrotado()){
			if (self.poderDePelea() > enemigo.poderDePelea()){
				self.enemigoDerrotado(enemigo)
				self.conquistarCasa(enemigo)
			}//else {vidas -= 1}
		}//else {return "¡Ese enemigo ya fue derrotado anteriormente!"}
//		if (vidas == 0) {game.stop()}
	}
	
	method enemigoDerrotado(enemigo) {
		enemigosDerrotados.add(enemigo)
		enemigo.derrotado()
	}
	method conquistarCasa(enemigo) {
		casasConquistadas.add(enemigo.casa())
	}
	
	method esPoderoso() {
		return self.poderDePelea() > enemigos.map({enemigo => enemigo.poderDePelea()}).maxIfEmpty({0})
	}
	
	method artefactoFatal() {
		
	}
}

