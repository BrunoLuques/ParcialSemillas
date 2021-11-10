import plantas.*
import parcelas.*

object inta {
	var property parcelasQueContiene = []
	
	method agregarParcela(parcela){
		parcelasQueContiene.add(parcela)
	}
	
	method cantidadTotalDePlantas(){
		return parcelasQueContiene.sum({parcela => parcela.cantidadDePLantas()})
	}
	
	method cantidadDeParcelas(){
		return parcelasQueContiene.size()
	}
	
	method promedioDePlantasPorParcela(){
		return self.cantidadTotalDePlantas() / self.cantidadDeParcelas()
	}
	
	method parcelasConMasDe4Plantas(){
		return parcelasQueContiene.filter({parcela => parcela.cantidadDePLantas() > 4})
	}
	
	method parcelaMasAutosustentable(){
		return self.parcelasConMasDe4Plantas()
		// Me falta la parte de filtrar las parcelas con mayor porcentaje de plantas
		// bien asociadas, pero no lo pude resolver.
	}
}