package g12.gamma.tp.exceptions

import g12.gamma.tp.exceptions.BusinessException

class SinCupoException extends BusinessException {
	
	new() {
		super("No hay mas cupo para este partido")
	}
	
}