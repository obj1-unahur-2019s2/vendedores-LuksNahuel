class CentroDistribucion {
	var property ciudad
	var property vendedores = #{}
	
	method agregarVendedor(vendedor) {
		if(vendedores.contains(vendedor)) {
			self.error("El vendedor ya está registrado")
		}
		vendedores.add(vendedor)
	}
}