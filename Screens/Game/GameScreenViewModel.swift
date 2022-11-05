import Foundation

class GameScreenViewModel: ObservableObject {
  
  @Published var        currentPlayer: Players
  
  @Published var     currentPlayerName: String
  
  @Published var            stepCount: Int
  
  @Published var        userStepCount: Int
  
  @Published var        compStepCount: Int
  
  @Published var         estimatedInt: Int
  
  @Published var             firstInt: Int
  
  @Published var              lastInt: Int
  
  @Published var    estimatedFirstInt: Int
  
  @Published var     estimatedLastInt: Int
  
  @Published var     mysteriousNumber: Int
  
  @Published var        gameIsRunning: Bool
  
  @Published var              message: String
  
  @Published var               winner: String
  
  @Published var           showResult: Bool
  
  @Published var            userScore: Int

  @Published var            compScore: Int
  
  enum Players {case comp, user}
  
  var namesPlayers = ["You", "Computer"]
  
  let messages: [String]
  
  init() {
    self.messages             = ["That number is greater", "That number is less", "You Won!"]
    self.message              = ""
    self.currentPlayer        = Players.comp
    self.currentPlayerName    = namesPlayers[1]
    self.stepCount            = 0
    self.userStepCount        = 0
    self.compStepCount        = 0
    self.userScore            = 0
    self.compScore            = 0
    self.estimatedInt         = 0
    self.firstInt             = 0
    self.lastInt              = 100
    self.estimatedFirstInt    = 0
    self.estimatedLastInt     = 100
    self.mysteriousNumber     = 1
    self.gameIsRunning        = false
    self.showResult           = false
    self.winner               = ""
  }
  
  func startGame() {
    if gameIsRunning == false {
      gameIsRunning = true
      mysteriousNumber = newInt(firstInt, lastInt)
      step()
    } else {
      step()
    }
  }
  
  func endGame() {
    showResult = true
  }
  
  func step() {
    stepCount += 1
    if currentPlayer == .comp {
      compStepCount += 1
    } else if currentPlayer == .user {
      userStepCount += 1
    }
    
    if estimatedInt == mysteriousNumber {
      message = messages[2]
      gameIsRunning = false
      endGame()
      return
    }
    estimatedInt = newInt(estimatedFirstInt, estimatedLastInt)
    if estimatedInt < mysteriousNumber {
      message = messages[0]
      estimatedFirstInt = estimatedInt
    } else {
      message = messages[1]
      estimatedLastInt = estimatedInt
    }
  }
    
  func newInt(_ firstInt: Int, _ lastInt: Int) -> Int {
    return (firstInt..<lastInt).randomElement() ?? 0
  }
  
}
