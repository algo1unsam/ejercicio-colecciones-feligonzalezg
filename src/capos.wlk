import artefactos.*

object rolando {

	var property objetosEncontrados = []
	var objetosAgarrados = #{}
	var objetosEnCastillo = #{}
	
	method encontreObjeto(objeto) {
		if (objeto.cantidad() > 0){
			objetosEncontrados.add(objeto)
			objeto.cantidad(objeto.cantidad()-1)
			if (objetosAgarrados.size() < 2) {
				objetosAgarrados.add(objeto)
			}
		}
	}
	
	method volverAlCastilloDePiedra() {
		objetosEnCastillo.addAll(objetosAgarrados)
		objetosAgarrados.clear()
	}

}

