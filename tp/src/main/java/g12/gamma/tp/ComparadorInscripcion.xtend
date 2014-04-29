package g12.gamma.tp

import java.util.Comparator

public class ComparadorInscripcion implements Comparator<Inscripcion> {
	
	override compare(Inscripcion insc1, Inscripcion insc2) {
		if (insc1.tipoInscripcion.prioridad < insc2.tipoInscripcion.prioridad) {
			return -1
		}
		else if (insc1.tipoInscripcion.prioridad > insc2.tipoInscripcion.prioridad) {
		 	return 1
	 	}
		else if (insc1.tipoInscripcion.prioridad == insc2.tipoInscripcion.prioridad)
		{
			return insc1.fecha.compareTo(insc2.fecha)
		}

		throw new RuntimeException("Comparacion no definida")
	}

}