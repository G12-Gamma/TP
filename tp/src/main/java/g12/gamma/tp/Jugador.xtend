package g12.gamma.tp

import java.util.Date

class Jugador {
	@Property
	String nombre
	
	@Property
	Date fechaNacimiento
	
	@Property
	Integer equipo = null
	
	def asignarEquipo(Partido partido) {
		// TODO: hacer la asignacion de equipos
		equipo = partido.jugadores.filter [ equipo != null ].size % 2 + 1
	}
	
}