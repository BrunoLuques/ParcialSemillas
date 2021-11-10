class Planta {
	const property anioDeObtencion
	const property altura
	
	method horasDeSolQueTolera()
	method esFuerte(){return self.horasDeSolQueTolera() > 10}
	method daNuevasSemillas(){return self.esFuerte()}
	method espacioQueOcupa()
	method parcelaIdeal(parcela)
}


class Menta inherits Planta{
	override method horasDeSolQueTolera(){return 6}
	
	override method daNuevasSemillas(){
		return super() or altura > 0.4
	}
	
	override method espacioQueOcupa(){return altura * 3}
	
	override method parcelaIdeal(parcela){
		return parcela.superficie() > 6
	}
}


class Soja inherits Planta{
	override method horasDeSolQueTolera(){
		return if(altura < 0.5){
			6
		}
		else if(altura >= 0.5 and altura <= 1){
			7
		}
		else{
			9
		}
	}
	
	override method daNuevasSemillas(){
		return super() and anioDeObtencion > 2007 and altura > 1
	}
	
	override method parcelaIdeal(parcela){
		return parcela.horasDeSolPorDia() == self.horasDeSolQueTolera()
	}
	
	override method espacioQueOcupa(){return altura / 2}
}


class Quinoa inherits Planta{
	var property horasDeSolToleradas
	
	override method espacioQueOcupa(){return 0.5}
	
	override method daNuevasSemillas(){
		return super() and anioDeObtencion < 2005
	}
	
	override method parcelaIdeal(parcela){
		return parcela.plantasQueTiene().all({planta => planta.altura() < 1.5})
	}
	
	override method horasDeSolQueTolera(){return horasDeSolToleradas} 
}


class SojaTransgenica inherits Soja{
	override method daNuevasSemillas(){return false}
	
	override method parcelaIdeal(parcela){
		return parcela.cantidadDePLantas() <= 1
	}
}


class HierbaBuena inherits Menta{
	override method espacioQueOcupa(){return super() * 2}
}