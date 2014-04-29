package g12.gamma.tp

import java.util.ArrayList
import java.util.List

class Condicional extends TipoInscripcion {
	
	private List<Condicion> condiciones = new ArrayList<Condicion>
	
	new() {
		prioridad = 3
	}

	override inscripcion(Inscripcion inscripcion, Partido partido) {
		validarCondiciones()
		super.inscripcion(inscripcion, partido)
	}

	private def validarCondiciones() {
		condiciones.forEach[ validar ]
	}
	
}