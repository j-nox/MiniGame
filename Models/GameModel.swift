import Foundation

struct Game {
  enum Players {case comp, user}
  let namesPlayers = ["User", "Computer"]
  var currentPlayer: Players = .user
  var gameIsRunning: Bool = false
  var message: String = ""
  let messages: [String] = ["Myst. number is greater", "Myst. number is less", "Guessed!", "Draw"]
  var showResult: Bool = false
  var scoreUser: Int = 0
  var scoreComp: Int = 0
  var stepsUser: Int = 0
  var stepsComp: Int = 0
}
