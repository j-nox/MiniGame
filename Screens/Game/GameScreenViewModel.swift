import Foundation

class GameScreenViewModel: ObservableObject {
  
  @Published var        currentPlayer: Players
  
  @Published var            stepCount: Int
  
  @Published var         estimatedInt: Int
  
  @Published var             firstInt: Int
  
  @Published var              lastInt: Int
  
  @Published var    estimatedFirstInt: Int
  
  @Published var     estimatedLastInt: Int
  
  @Published var     mysteriousNumber: Int
  
  @Published var        gameIsRunning: Bool
  
  @Published var              message: String
  
  enum Players {case comp, user}
  
  let messages: [String]
  
  init() {
    self.messages             = ["That number is greater", "That number is less", "You Won!"]
    self.message              = ""
    self.currentPlayer        = Players.comp
    self.stepCount            = 0
    self.estimatedInt         = 0
    self.firstInt             = 0
    self.lastInt              = 100
    self.estimatedFirstInt    = 0
    self.estimatedLastInt     = 100
    self.mysteriousNumber     = 1
    self.gameIsRunning        = false
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
  
  func step() {
    stepCount += 1
    if estimatedInt == mysteriousNumber {
      message = messages[2]
      gameIsRunning = false
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
