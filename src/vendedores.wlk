class Vendedor {
	var property certificaciones = #{}
	
	method esVersatil() {
		return certificaciones.size() >= 3 && certificaciones.any{c => c.esSobreProductos()}
			&& certificaciones.any{c => not c.esSobreProductos()}
	}
	
	method esFirme() {
		return certificaciones.sum{c => c.puntos()} >= 30
	}
	
	method puedeTrabajarEn(ciudad)
	method esInfluyente()
}

class VendedorFijo inherits Vendedor {
	var property ciudadDondeVive
	
	override method puedeTrabajarEn(ciudad) {
		return ciudadDondeVive == ciudad
	}
	override method esInfluyente() = false
}

class Viajante inherits Vendedor {
	var property provinciasHabilitadas = #{}
	const property poblacionNecesaria = 10000000
	
	override method puedeTrabajarEn(ciudad) {
		return provinciasHabilitadas.contains(ciudad.provincia())
	}
	
	override method esInfluyente() {
		return provinciasHabilitadas.sum{p => p.poblacion()} >= poblacionNecesaria
	}
} 

class ComercioCorresponsal inherits Vendedor {
	var property tieneSucursalEn = []
	
	override method puedeTrabajarEn(ciudad) {
		return tieneSucursalEn.contains(ciudad)
	}
	
	override method esInfluyente() {
		return tieneSucursalEn.size() >= 5 or tieneSucursalEn.map{c => c.provincia()}.asSet().size() >= 3
	}
}
