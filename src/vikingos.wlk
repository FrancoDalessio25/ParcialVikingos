// HOLA

class Vikingo{
	var property tipoCasta = karl
	var property tieneArma = true
	
	
	method cumpleRequisitos(expedicion) = self.esProductivo() && tipoCasta.puedeIrExpedicion(self,expedicion)
	
	method esProductivo() 
	
	
}

class Soldado inherits Vikingo{
	const vidasCobradas
	
	
	override method esProductivo() = (vidasCobradas > 20) && tieneArma
	
	
	
}
class Granjero inherits Vikingo{
	var cantHijos 
	var hectareas  

	override method esProductivo() = (hectareas/cantHijos) >= 2
	
	override method tieneArma() = false
}

class Casta{
	
	method puedeIrExpedicion(vikingo,expedicion) = true 
	
}

object karl inherits Casta{
	
}
object jarl inherits Casta{
	
	override method puedeIrExpedicion(vikingo,expedicion) = not vikingo.tieneArma()
}
object thrall inherits Casta{

}

class Expedicion{
	
	const vikingos = []
	const invasiones = []
	
	
	method irAExpedicion(vikingo) { 
		
		if (not vikingo.cumpleRequisitos(self)){
		
			throw new DomainException (message = "No puede hacer la expedicion")
		}
		else {vikingos.add(vikingo)}
	}
	
	
	
	
	method valeLaPenaExpedicion() = invasiones.all{ expedicion => expedicion.valeLaPena(vikingos.size())}  
	
	
	
	method valeLaPena(numero)
	
	
	
	
	
}

class Lugar {
	
	method serInvadidoPor(expedicion) {
		expedicion.repartirBotin(self.botin(expedicion.cantidadIntegrantes()))
		self.destruirse(expedicion.cantidadIntegrantes())

	}
	method destruirse(cantInvasores)
	method botin(cantInvasores)
}

class Aldea inherits Lugar{
	
	var cantidadDeCrucifijos
	
	 method valeLaPena(numero) = cantidadDeCrucifijos >= 15
	

}



class Amurallada inherits Aldea{
	
	var cantidadVikingosComitiva
 	override method valeLaPena(numero) = super(numero) && numero >= cantidadVikingosComitiva
 	
 	
}

class Capital inherits Lugar{
	var property defensores 
	var riqueza

	method valeLaPenaPara(cantInvasores) =
		cantInvasores <= self.botin(cantInvasores) / 3

	override method botin(cantInvasores) =
		 self.defensoresDerrotados(cantInvasores) * riqueza
	
	override method destruirse(cantInvasores){
		defensores -= self.defensoresDerrotados(cantInvasores)
	}
	override method serInvadidoPor(expedicion){
		expedicion.aumentarVidasCobradasEn(self.defensoresDerrotados(expedicion.cantidadIntegrantes()))
		super(expedicion)
	}
	method defensoresDerrotados(cantInvasores) = defensores.min(cantInvasores)

}

























