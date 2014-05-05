package g12.gamma.tp

import g12.gamma.tp.exceptions.JugadoresInsuficientesException
import java.util.Date
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import g12.gamma.tp.exceptions.SinCupoException

class Tests {

	Partido partido
	Jugador jugadorEstandar1
	Jugador jugadorEstandar2
	Jugador jugadorEstandar3
	Jugador jugadorEstandar4
	Jugador jugadorEstandar5
	Jugador jugadorEstandar6
	Jugador jugadorEstandar7
	Jugador jugadorEstandar8
	Jugador jugadorEstandar9
	Jugador jugadorEstandar10
	Jugador jugadorEstandar11
	Jugador jugadorSolidario1
	Jugador jugadorSolidario2
	Jugador jugadorSolidario3
	Jugador jugadorSolidario4
	Jugador jugadorSolidario5
	Jugador jugadorCondicional1
	Jugador jugadorCondicional2
	Jugador jugadorCondicional3
	Jugador jugadorCondicional4
	Jugador jugadorCondicional5
	TipoInscripcion estandar
	TipoInscripcion solidario
	TipoInscripcion condicional
	
	@Before
	def void creacionObjetos()
	{
		partido = new Partido(new Date(10,4,2014, 20,0,0), "cancha1")
		
		jugadorEstandar1 = new Jugador()
		jugadorEstandar2 = new Jugador()
		jugadorEstandar3 = new Jugador()
		jugadorEstandar4 = new Jugador()
		jugadorEstandar6 = new Jugador()
		jugadorEstandar7 = new Jugador()
		jugadorEstandar8 = new Jugador()
		jugadorEstandar9 = new Jugador()
		jugadorEstandar10 = new Jugador()
		jugadorEstandar11 = new Jugador()
		jugadorSolidario1 = new Jugador()
		jugadorSolidario2 = new Jugador()
		jugadorSolidario3 = new Jugador()
		jugadorSolidario4 = new Jugador()
		jugadorSolidario5 = new Jugador()
		jugadorCondicional1 = new Jugador()
		jugadorCondicional2 = new Jugador()
		jugadorCondicional3 = new Jugador()
		jugadorCondicional4 = new Jugador()
		jugadorCondicional5 = new Jugador()
		
		estandar = new Estandar()
		solidario = new Solidario()
		condicional = new Condicional() 
	}
	
	@Test
	def void testEquipo()
	{
		partido.inscribir(jugadorEstandar1, estandar)
		partido.inscribir(jugadorSolidario1, solidario)
		partido.inscribir(jugadorCondicional1, condicional)
		partido.inscribir(jugadorEstandar2, estandar)
		partido.inscribir(jugadorSolidario2, solidario)
		partido.inscribir(jugadorCondicional2, condicional)
		partido.inscribir(jugadorEstandar3, estandar)
		partido.inscribir(jugadorSolidario3, solidario)
		partido.inscribir(jugadorCondicional3, condicional)
		partido.inscribir(jugadorEstandar4, estandar)
		partido.inscribir(jugadorSolidario4, solidario)
		partido.inscribir(jugadorCondicional4, condicional)
		partido.inscribir(jugadorEstandar5, estandar)
		partido.inscribir(jugadorSolidario5, solidario)
		partido.inscribir(jugadorCondicional5, condicional)
		
		Assert.assertEquals(partido.inscriptos.size, 15)
		
		partido.generarEquiposTentativos()
		
		Assert.assertEquals(partido.inscripcionesConfirm.size, 10)

		// Se prueba que esten incluidos todos los estandar
		Assert.assertTrue(partido.inscripcionesConfirm.contains(jugadorEstandar1))
		Assert.assertTrue(partido.inscripcionesConfirm.contains(jugadorEstandar2))
		Assert.assertTrue(partido.inscripcionesConfirm.contains(jugadorEstandar3))
		Assert.assertTrue(partido.inscripcionesConfirm.contains(jugadorEstandar4))
		Assert.assertTrue(partido.inscripcionesConfirm.contains(jugadorEstandar5))
		
		// Se prueba que esten incluidos todos los solidario
		Assert.assertFalse(partido.inscripcionesConfirm.contains(jugadorSolidario1))
		Assert.assertFalse(partido.inscripcionesConfirm.contains(jugadorSolidario2))
		Assert.assertFalse(partido.inscripcionesConfirm.contains(jugadorSolidario3))
		Assert.assertFalse(partido.inscripcionesConfirm.contains(jugadorSolidario4))
		Assert.assertFalse(partido.inscripcionesConfirm.contains(jugadorSolidario5))
		
		// Se prueba que no esten incluidos todos los condicionales (fueron desplazados por el resto)
		Assert.assertFalse(!partido.inscripcionesConfirm.contains(jugadorCondicional1))
		Assert.assertFalse(!partido.inscripcionesConfirm.contains(jugadorCondicional2))
		Assert.assertFalse(!partido.inscripcionesConfirm.contains(jugadorCondicional3))
		Assert.assertFalse(!partido.inscripcionesConfirm.contains(jugadorCondicional4))
		Assert.assertFalse(!partido.inscripcionesConfirm.contains(jugadorCondicional5))
	}
	
	@Test(expected = typeof(JugadoresInsuficientesException))
	def void testJugadoresInsuficientes()
	{
		partido.inscribir(jugadorEstandar1, estandar)
		partido.inscribir(jugadorSolidario1, solidario)
		
		partido.generarEquiposTentativos()
	}
	
	@Test(expected = typeof(SinCupoException))
	def void testEquipoEstandarCompleto()
	{
		partido.inscribir(jugadorEstandar1, estandar)
		partido.inscribir(jugadorEstandar2, estandar)
		partido.inscribir(jugadorEstandar3, estandar)
		partido.inscribir(jugadorEstandar4, estandar)
		partido.inscribir(jugadorEstandar5, estandar)
		partido.inscribir(jugadorEstandar6, estandar)
		partido.inscribir(jugadorEstandar7, estandar)
		partido.inscribir(jugadorEstandar8, estandar)
		partido.inscribir(jugadorEstandar9, estandar)
		partido.inscribir(jugadorEstandar10, estandar)
		partido.inscribir(jugadorEstandar11, estandar)
	}
	
}