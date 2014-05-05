package g12.gamma.tp

import java.util.Date

class Infraccion {
	@Property
	String motivo
	
	@Property
	Date fecha
	
	new(Date unaFecha, String unMotivo) {
		this.fecha = unaFecha
		this.motivo = unMotivo
	}
}