package g12.gamma.tp

import java.util.Date

class Inscripcion {
	@Property
	Jugador jugador
	
	@Property
	TipoInscripcion tipoInscripcion

	@Property
	Date fecha
	
	@Property
	Integer equipo = null
	
	@Property
	Boolean confirmado = false
	
	@Property
	Jugador reemplazo = null
	
	
	new(Jugador jugador, TipoInscripcion tipoInscripcion) {
		this.jugador = jugador
		this.tipoInscripcion = tipoInscripcion
		this.fecha = new Date;
	}
	
	def asignarEquipo(Partido partido) {
		// TODO: hacer la asignacion de equipos
		equipo = partido.inscripcionesConfirm.filter [ equipo != null ].size % 2 + 1
	}
	
	def validarInscripcion(Partido partido) {
		tipoInscripcion.inscripcion(this, partido)
	}
}