import capos.*
import enemigos.*

object espadaDelDestino {

	var property cantidad = 1
	var usos = 0
	var property poderDePelea

	method aumentaUso() {
		usos += 1
	}

	method aportaPoder(poderBase) {
		if (usos == 0) {
			poderDePelea = poderBase
			return poderDePelea
		} else {
			poderDePelea = poderBase / 2
			return poderDePelea
		}
	}

}

object armaduraDeAceroValyrio {

	var property cantidad = 1
	const property poderDePelea = 6

	method aportaPoder(poderBase) {
		return poderDePelea
	}

}

object collarDivino {

	var property cantidad = 1
	var usos = 0
	var  property poderDePelea = 3

	method aumentaUso() {
		usos += 1
	}

	method aportaPoder(poderBase) {
		if (poderBase > 6) {
			poderDePelea += usos
			return poderDePelea
		} else {
			return poderDePelea
		}
	}

}

object libroDeHechizos {

	var property cantidad = 1

}

