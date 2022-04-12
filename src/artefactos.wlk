import capos.*
import casas.*
import enemigos.*

object espadaDelDestino {

	var property cantidad = 1
	var usos = 0

	method usar() {
		usos += 1
	}

	method poder(personaje) {
		return personaje.poderBase() / if (usos == 0) {1} else {2}
	}

	method esFatal(enemigo, personaje) {
		return self.poder(personaje) + personaje.poderBase() > enemigo.poderDePelea()
	}

}

object armaduraDeAceroValyrio {

	var property cantidad = 1

	method poder(personaje) {
		return 6
	}

	method usar() {
	// no tiene efecto
	}

	method esFatal(enemigo, personaje) {
		return self.poder(personaje) + personaje.poderBase() > enemigo.poderDePelea()
	}

}

object collarDivino {

	var property cantidad = 1
	var usos = 0

	method usar() {
		usos += 1
	}

	method poder(personaje) {
		return 3 + if (personaje.poderBase() > 6) {1} else {0}
	}

	method esFatal(enemigo, personaje) {
		return self.poder(personaje) + personaje.poderBase() > enemigo.poderDePelea()
	}

}

object libroDeHechizos {

	var property cantidad = 1
	var hechizos = [ bendicion, invisibilidad, invocacion ]

	method usar() {
		hechizos = hechizos.drop(1)
	}

	method poder(personaje) {
		return if (hechizos.isEmpty()) {
			0
		} else {
			hechizos.first().poder(personaje)
		}
	}

	method esFatal(enemigo, personaje) {
		return self.poder(personaje) + personaje.poderBase() > enemigo.poderDePelea()
	}

}

object bendicion {

	method poder(personaje) {
		return 4
	}

}

object invisibilidad {

	method poder(personaje) {
		return personaje.poderBase()
	}

}

object invocacion {

	method poder(personaje) {
		return personaje.poderArtefactoMasPoderosoEnCasa()
	}

}

