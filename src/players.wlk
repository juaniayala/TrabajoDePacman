import wollok.game.*
object pacman {
	const property image = "pacman.png"
	var property position = game.origin()
	var vidas = 3
	
	method vidas() = vidas
	
	method perderVida() {
		vidas-=1
		position = game.origin()	
	}
	
	method chocarCon(rival) {
		self.perderVida()
		rival.position(game.center())
	}
	
}

object fantasma {
	var property image = "rival1.png"
	var property position = game.at(5, 3)
	
	method acercarseA(personaje) {
		var posPacman = personaje.position
		var newX = position.x() + if (posPacman.x() > position.x()) {1} else if (posPacman.x() == position.x()) {0} else {-1}
		var newY = position.y() + if (posPacman.y() > position.y()) {1} else if (posPacman.y() == position.y()) {0} else {-1}
		
		position = game.at(newX, newY)
	}
}
