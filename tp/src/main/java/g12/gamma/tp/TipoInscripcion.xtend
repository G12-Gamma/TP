package g12.gamma.tp

abstract class TipoInscripcion {
	@Property
	int prioridad
	
	def inscripcion(Inscripcion inscripcion, Partido partido) {
		if (partido.jugadores.size < Partido.MAX_JUGADORES) {
			partido.jugadores.add(inscripcion.jugador)
		}
	}

}