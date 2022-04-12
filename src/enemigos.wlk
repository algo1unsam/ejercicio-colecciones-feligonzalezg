import capos.*
import artefactos.*
import casas.*

object archibaldo {
	const property poderDePelea = 16
	const property casa = palacioDeMarmol
	var property fueDerrotado = false
	
	method derrotado() {
		fueDerrotado = true
		casa.sinEnemigos()
	}
}

object caterina {
	const property poderDePelea = 28
	const property casa = fortalezaDeAcero
	var property fueDerrotado = false
	
	method derrotado() {
		fueDerrotado = true
		casa.sinEnemigos()
	}
}

object astra {
	const property poderDePelea = 14
	const property casa = torreDeMarfil
	var property fueDerrotado = false
	
	method derrotado() {
		fueDerrotado = true
		casa.sinEnemigos()
	}
}
