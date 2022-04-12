import artefactos.*
import capos.*
import enemigos.*

object castilloDePiedra {
	const property artefactosEnCasa = #{}
	
	method dejarArtefactos(_artefactosAgarrados) {
		artefactosEnCasa.addAll(_artefactosAgarrados)
	}
	method artefactoMasPoderosoEnCasa(duenio) {
		return artefactosEnCasa.map({artefacto => artefacto.aportaPoder(duenio)}).maxIfEmpty({0})
	}
	
}

object palacioDeMarmol {
	var property estaLibre = false
	
	method sinEnemigos() {
		estaLibre = true
	}
}

object fortalezaDeAcero {
	var property estaLibre = false
	
	method sinEnemigos() {
		estaLibre = true
	}
}

object torreDeMarfil {
	var property estaLibre = false
	
	method sinEnemigos() {
		estaLibre = true
	}
}