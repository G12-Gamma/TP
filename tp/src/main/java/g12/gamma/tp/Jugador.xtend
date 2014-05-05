package g12.gamma.tp

import java.util.Date
import java.util.ArrayList
import java.util.List

class Jugador {
	@Property
	String nombre
	
	@Property
	Date fechaNacimiento
	
	@Property
	List<Infraccion> infracciones = new ArrayList<Infraccion>()
	
	def confirmarParticipacion(Inscripcion inscripcion) {
		inscripcion.confirmado = true
	}
	
	def bajarseEquipo(Inscripcion inscripcion, Jugador jugadorReemplazo, Partido partido) {
		inscripcion.confirmado = false
		if (jugadorReemplazo != null) inscripcion.reemplazo = jugadorReemplazo
		else infraccionar(inscripcion)
		if (partido.inscripcionesConfirm.size == 10) partido.notificarAdmin("Se bajó uno, hay menos de 10 confirmados")
		partido.inscripcionesConfirm.remove(inscripcion)
	}
	
	def infraccionar(Inscripcion inscripcion) {
		inscripcion.jugador.infracciones.add(new Infraccion(inscripcion.fecha, "Se bajó sin tener reemplazo"))
	}
}