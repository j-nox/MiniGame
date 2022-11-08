import Foundation

class GameScreenViewModel: ObservableObject {
  
  @Published var game: Game = Game()
  @Published var user: User = User()
  @Published var comp: Comp = Comp()
  
  func start() {
    if game.gameIsRunning == false {game.gameIsRunning.toggle()}
  }
  
  func stepComp() {
    game.stepsComp += 1
    comp.estimatedNum = newInt(comp.estimatedFirstNum, comp.estimatedLastNum)
    if comp.estimatedNum < user.mysteriousNum {
      game.message = game.messages[0]
      comp.estimatedFirstNum = comp.estimatedNum
    } else if comp.estimatedNum > user.mysteriousNum {
      game.message = game.messages[1]
      comp.estimatedLastNum = comp.estimatedNum
    } else {
      game.message = game.messages[2]
      resetStep()
    }
  }
  
  func stepUser() {
    game.stepsUser += 1
    if user.estimatedNum < comp.mysteriousNumber {
      game.message = game.messages[0]
    } else if user.estimatedNum > comp.mysteriousNumber {
      game.message = game.messages[1]
    } else {
      game.message = game.messages[2]
      resetStep()
      resetRound()
    }
  }
  
  func newInt(_ firstNum: Int, _ lastNum: Int) -> Int {
    return (firstNum..<lastNum).randomElement() ?? 0
  }
  
  func resetStep() {
    user = User()
    comp = Comp()
    if game.currentPlayer == .user {
      game.currentPlayer = .comp
    } else if game.currentPlayer == .comp {
      game.currentPlayer = .user
    }
  }
  
  func resetRound() {
    if game.stepsUser < game.stepsComp {
      game.scoreUser += 1
    } else if game.stepsUser > game.stepsComp {
      game.scoreComp += 1
    } else {
      game.message = game.messages[3]
    }
    game.gameIsRunning = false
  }
}

//class GameScreenViewModel: ObservableObject {
//
//  @Published var        currentPlayer: Players
//
//  @Published var     currentPlayerName: String
//
//  @Published var            stepCount: Int
//
//  @Published var        userStepCount: Int
//
//  @Published var        compStepCount: Int
//
//  @Published var         estimatedInt: Int
//
//  @Published var             firstInt: Int
//
//  @Published var              lastInt: Int
//
//  @Published var    estimatedFirstInt: Int
//
//  @Published var     estimatedLastInt: Int
//
//  @Published var     mysteriousNumber: Int
//
//  @Published var         answerNumber: Int
//
//  @Published var        gameIsRunning: Bool
//
//  @Published var              message: String
//
//  @Published var               winner: String
//
//  @Published var           showResult: Bool
//
//  @Published var            userScore: Int
//
//  @Published var            compScore: Int
//
//  enum Players {case comp, user}
//
//  var namesPlayers = ["User", "Computer"]
//
//  let messages: [String]
//
//  init() {
//    self.messages             = ["That number is greater", "That number is less", "You Won!"]
//    self.message              = ""
//    self.currentPlayer        = Players.user
//    self.currentPlayerName    = namesPlayers[1]
//    self.stepCount            = 0
//    self.userStepCount        = 0
//    self.compStepCount        = 0
//    self.userScore            = 0
//    self.compScore            = 0
//    self.estimatedInt         = 0
//    self.firstInt             = 0
//    self.lastInt              = 100
//    self.estimatedFirstInt    = 0
//    self.estimatedLastInt     = 100
//    self.mysteriousNumber     = 0
//    self.answerNumber         = 0
//    self.gameIsRunning        = false
//    self.showResult           = false
//    self.winner               = ""
//  }
//
//  func startGame() {
//    if gameIsRunning == false {
//      resetGame()
//    }
////    if currentPlayer == .comp {step()}
//    step()
//  }
//
//  func endGame() {
//    if userStepCount < compStepCount {
//      self.winner = namesPlayers[0]
//    } else {
//      self.winner = namesPlayers[1]
//    }
//    self.gameIsRunning = false
//    showResult = true
//  }
//
//  func step() {
//    stepCount += 1
//    if currentPlayer == .comp {
//      compStepCount += 1
//    } else if currentPlayer == .user {
//      userStepCount += 1
//    }
//
//    if estimatedInt == mysteriousNumber {
//      message = messages[2]
//      gameIsRunning = false
//      endGame()
//      return
//    }
//    if currentPlayer == .user {
//      estimatedInt = newInt(estimatedFirstInt, estimatedLastInt)
//    }
//    if currentPlayer == .comp {
//      estimatedInt = answerNumber
//    }
//    if estimatedInt < mysteriousNumber {
//      message = messages[0]
//      estimatedFirstInt = estimatedInt
//    } else {
//      message = messages[1]
//      estimatedLastInt = estimatedInt
//    }
//  }
//
//  func resetGame() {
//    stepCount            = 0
//    userStepCount        = 0
//    compStepCount        = 0
//    estimatedInt         = 0
//    estimatedFirstInt    = 0
//    estimatedLastInt     = 100
//    winner               = ""
//    gameIsRunning        = true
//    if currentPlayer == .comp {
//      mysteriousNumber     = newInt(firstInt, lastInt)
//    }
//  }
//
//  func changePlayer() {
//    if currentPlayer == .comp {
//      currentPlayer = .user
//      currentPlayerName = namesPlayers[0]
//    } else {
//      currentPlayer = .comp
//      currentPlayerName = namesPlayers[1]
//    }
//  }
//
//  func newInt(_ firstInt: Int, _ lastInt: Int) -> Int {
//    return (firstInt..<lastInt).randomElement() ?? 0
//  }
//
//}
