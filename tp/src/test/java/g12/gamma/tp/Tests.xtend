package g12.gamma.tp

import g12.gamma.tp.exceptions.JugadoresInsuficientesException
import java.util.Date
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import g12.gamma.tp.exceptions.SinCupoException

class Tests {

	Partido partido
	Jugador jugador1
	Jugador jugador2
	Jugador jugador3
	Jugador jugador4
	Jugador jugador5
	Jugador jugador6
	Jugador jugador7
	Jugador jugador8
	Jugador jugador9
	Jugador jugador10
	Jugador jugador11
	Jugador jugador12
	Jugador jugador13
	Jugador jugador14
	Jugador jugador15
	TipoInscripcion estandar
	TipoInscripcion solidario
	TipoInscripcion condicional
	
	@Before
	def void creacionObjetos()
	{
		partido = new Partido(new Date(10,4,2014, 20,0,0), "cancha1")
		
		jugador1 = new Jugador()
		jugador2 = new Jugador()
		jugador3 = new Jugador()
		jugador4 = new Jugador()
		jugador5 = new Jugador()
		jugador6 = new Jugador()
		jugador7 = new Jugador()
		jugador8 = new Jugador()
		jugador9 = new Jugador()
		jugador10 = new Jugador()
		jugador11 = new Jugador()
		jugador12 = new Jugador()
		jugador13 = new Jugador()
		jugador14 = new Jugador()
		jugador15 = new Jugador()
		
		estandar = new Estandar()
		solidario = new Solidario()
		condicional = new Condicional() 
	}
	
	@Test
	def testEquipo()
	{
		partido.inscribir(jugador1, estandar)
		partido.inscribir(jugador2, solidario)
		partido.inscribir(jugador3, condicional)
		partido.inscribir(jugador4, estandar)
		partido.inscribir(jugador5, solidario)
		partido.inscribir(jugador6, condicional)
		partido.inscribir(jugador7, estandar)
		partido.inscribir(jugador8, solidario)
		partido.inscribir(jugador9, condicional)
		partido.inscribir(jugador10, estandar)
		partido.inscribir(jugador11, solidario)
		partido.inscribir(jugador12, condicional)
		partido.inscribir(jugador13, estandar)
		partido.inscribir(jugador14, solidario)
		partido.inscribir(jugador15, condicional)
		
		Assert.assertEquals(partido.inscriptos.size, 15)
		
		partido.generarEquiposTentativos()
		
		Assert.assertEquals(partido.jugadores.size, 10)

		// Se prueba que esten incluidos todos los estandar
		Assert.assertTrue(partido.jugadores.contains(jugador1))
		Assert.assertTrue(partido.jugadores.contains(jugador4))
		Assert.assertTrue(partido.jugadores.contains(jugador7))
		Assert.assertTrue(partido.jugadores.contains(jugador10))
		Assert.assertTrue(partido.jugadores.contains(jugador13))
		
		// Se prueba que esten incluidos todos los solidario
		Assert.assertTrue(partido.jugadores.contains(jugador2))
		Assert.assertTrue(partido.jugadores.contains(jugador5))
		Assert.assertTrue(partido.jugadores.contains(jugador8))
		Assert.assertTrue(partido.jugadores.contains(jugador11))
		Assert.assertTrue(partido.jugadores.contains(jugador14))
		
		// Se prueba que no esten incluidos todos los condicionales (fueron desplazados por el resto)
		Assert.assertTrue(!partido.jugadores.contains(jugador3))
		Assert.assertTrue(!partido.jugadores.contains(jugador6))
		Assert.assertTrue(!partido.jugadores.contains(jugador9))
		Assert.assertTrue(!partido.jugadores.contains(jugador12))
		Assert.assertTrue(!partido.jugadores.contains(jugador15))
	}
	
	@Test(expected = typeof(JugadoresInsuficientesException))
	def testJugadoresInsuficientes()
	{
		partido.inscribir(jugador1, estandar)
		partido.inscribir(jugador2, solidario)
		
		partido.generarEquiposTentativos()
	}
	
	@Test(expected = typeof(SinCupoException))
	def testEquipoEstandarCompleto()
	{
		partido.inscribir(jugador1, estandar)
		partido.inscribir(jugador2, estandar)
		partido.inscribir(jugador3, estandar)
		partido.inscribir(jugador4, estandar)
		partido.inscribir(jugador5, estandar)
		partido.inscribir(jugador6, estandar)
		partido.inscribir(jugador7, estandar)
		partido.inscribir(jugador8, estandar)
		partido.inscribir(jugador9, estandar)
		partido.inscribir(jugador10, estandar)
		partido.inscribir(jugador11, estandar)
	}
	
}