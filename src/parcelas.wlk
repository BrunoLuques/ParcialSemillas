import plantas.*

class Parcela {
	var property ancho
	var property largo
	var property horasDeSolPorDia
	const property plantasQueTiene = []
		
	method agregar(planta){plantasQueTiene.add(planta)}
	
	method superficie(){return largo * ancho}
	
	method cantidadMaximaDePlantas(){
		return if (ancho > largo){self.superficie() / 5} else {self.superficie() / 3 + largo}
	}
	
	method tieneComplicaciones(){
		return plantasQueTiene.all({planta => planta.horasDeSolQueTolera() > horasDeSolPorDia})
	}
	
	method cantidadDePLantas(){return plantasQueTiene.size()}	
	
	method tieneLugar(){
		return self.cantidadMaximaDePlantas() < self.cantidadDePLantas() + 1
	}
	
	method esMuchoSolPara(planta){
		return self.horasDeSolPorDia() > planta.horasDeSolQueTolera() + 2 
	}
	
	method sePuedePlantar(planta){
		if(self.tieneLugar() and not self.esMuchoSolPara(planta)){
			plantasQueTiene.add(planta)}
		else{ self.error("No se puede plantar")}
	}
}


class ParcelaEcologica inherits Parcela{
	method seAsociaBien(planta){
		return not self.tieneComplicaciones() and planta.parcelaIdeal(self)
	}
}


class ParcelaIndustrial inherits Parcela{
	method seAsociaBien(planta){
		return self.cantidadDePLantas() - 1 < 2 and planta.esFuerte()
	}
}