package g12.gamma.tp

import g12.gamma.tp.exceptions.JugadoresInsuficientesException
import g12.gamma.tp.exceptions.SinCupoException
import java.util.ArrayList
import java.util.Date
import java.util.List

class Partido {
	public static int MAX_JUGADORES = 10
	 
	@Property
	Date fecha
	
	@Property
	String lugar
	
	@Property
	List<Inscripcion> inscriptos = new ArrayList<Inscripcion>();
	
	@Property
	List<Inscripcion> inscripcionesConfirm = new ArrayList<Inscripcion>();
	
	new(Date fecha, String lugar) {
		this.fecha = fecha
		this.lugar = lugar
	}
	
	def inscribir(Jugador jugador, TipoInscripcion tipoInscripcion) {
		// Se valida que si se llego a la cantidad maxima de jugadores de en modo estandar (prioridad 1) no permita inscribir mas jugadores
		if (inscriptos.filter [ i | i.tipoInscripcion.getPrioridad == 1 ].size < MAX_JUGADORES)
		{
			inscriptos.add(new Inscripcion(jugador, tipoInscripcion))
			notificarAmigos(jugador, this)
		}
		else
			throw new SinCupoException
	}
	
	def generarEquiposTentativos() {
		if (inscriptos.size < MAX_JUGADORES)
			throw new JugadoresInsuficientesException

		validarInscripciones()
		armarEquiposEquitativos()
	}
	
	private def validarInscripciones() {
		inscriptos.sort(new ComparadorInscripcion)
		inscriptos.forEach[ validarInscripcion(this) ]
	}

	private def armarEquiposEquitativos() {
		// Logica para armar equipos equitativos
		inscripcionesConfirm.forEach [ asignarEquipo(this) ]
	}	
	
	def notificarAdmin(String mensaje) {
		
	}
	
	def notificarAmigos(Jugador jugador, Partido partido) {
		
	}
	
	def partidoConfirmado() {
		if (inscripcionesConfirm.size == 10) notificarAdmin("Hay 10 confirmados") 
	}
}