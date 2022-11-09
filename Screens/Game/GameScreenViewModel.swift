import Foundation

class GameScreenViewModel: ObservableObject {
  
  @Published var game: Game = Game()
  
  @Published var user: User = User()
  
  @Published var comp: Comp = Comp()
  
  func start() {
    if game.gameIsRunning != true {
      game.gameIsRunning.toggle()
    }
    stepComp()
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
    game.stepsComp = 0
    game.stepsUser = 0
    game.gameIsRunning = false
    game.showEndRounde = true
  }
}
