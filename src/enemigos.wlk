import capos.*
import artefactos.*
import casas.*

object archibaldo {
	const property poderDePelea = 16
	const property casa = palacioDeMarmol
	var property fueDerrotado = false
	
	method poderDePelea() = 16
	method derrotado() {
		fueDerrotado = true
		casa.sinEnemigos()
	}
}

object caterina {
	const property casa = fortalezaDeAcero
	var property fueDerrotado = false
	
	method poderDePelea() = 28
	
	method derrotado() {
		fueDerrotado = true
		casa.sinEnemigos()
	}
}

object astra {
	const property casa = torreDeMarfil
	var property fueDerrotado = false
	
	method poderDePelea() = 14
	
	method derrotado() {
		fueDerrotado = true
		casa.sinEnemigos()
	}
}
