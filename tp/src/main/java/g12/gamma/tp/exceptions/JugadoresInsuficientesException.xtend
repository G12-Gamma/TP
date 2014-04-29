package g12.gamma.tp.exceptions

import g12.gamma.tp.exceptions.BusinessException

class JugadoresInsuficientesException extends BusinessException {
	
	new() {
		super("Cantidad de jugadores insuficientes")
	}
	
}