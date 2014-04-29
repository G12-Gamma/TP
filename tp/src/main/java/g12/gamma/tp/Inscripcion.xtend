package g12.gamma.tp

import java.util.Date

class Inscripcion {
	@Property
	Jugador jugador
	
	@Property
	TipoInscripcion tipoInscripcion

	@Property
	Date fecha
		
	new(Jugador jugador, TipoInscripcion tipoInscripcion) {
		this.jugador = jugador
		this.tipoInscripcion = tipoInscripcion
		this.fecha = new Date;
	}
	
	def validarInscripcion(Partido partido) {
		tipoInscripcion.inscripcion(this, partido)
	}

}