package g12.gamma.tp

abstract class TipoInscripcion {
	@Property
	int prioridad
	
	def inscripcion(Inscripcion inscripcion, Partido partido) {
		if (partido.inscripcionesConfirm.size < Partido.MAX_JUGADORES) {
			partido.inscripcionesConfirm.add(inscripcion)
		}
	}

}