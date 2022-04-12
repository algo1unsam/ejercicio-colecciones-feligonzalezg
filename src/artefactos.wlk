import capos.*
import casas.*
import enemigos.*

object espadaDelDestino {

	var property cantidad = 1
	var usos = 0

	method usar() {
		usos += 1
	}

	method aportaPoder(personaje) {
		return personaje.poderBase() / if (usos == 0) {1} else {2}
	}

}

object armaduraDeAceroValyrio {

	var property cantidad = 1

	method aportaPoder(personaje) {
		return 6
	}
	
	method usar() {
		//no tiene efecto
	}
	
}

object collarDivino {

	var property cantidad = 1
	var usos = 0

	method usar() {
		usos += 1
	}

	method aportaPoder(personaje) {
		return 3 + if (personaje.poderBase() > 6) {1} else {0}
	}

}

object libroDeHechizos {

	var property cantidad = 1
	var hechizos = [bendicion,invisibilidad,invocacion]
	
	method usar() {
		hechizos = hechizos.drop(1)
	}
	
	method aportaPoder(personaje) {
		return if (hechizos.isEmpty()) {0} else {hechizos.first().aportaPoder(personaje)}
	}
	
}

object bendicion {
	method aportaPoder(personaje) {
		return 4
	}
}

object invisibilidad {
	method aportaPoder(personaje) {
		return personaje.poderBase()
	}
}

object invocacion {
	method aportaPoder(personaje) {
		return personaje.poderArtefactoMasPoderosoEnCasa()
	}
}
