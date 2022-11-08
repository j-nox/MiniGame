import Foundation

struct Comp {
  var name: String = "Computer"
  var stepCount: Int = 0
  var estimatedFirstNum: Int = 0
  var estimatedLastNum: Int = 100
  var estimatedNum: Int = 0
  var firstNum: Int = 0
  var lastNum: Int = 100
  var mysteriousNumber: Int = 0
  
  init() {
    self.mysteriousNumber = newInt(firstNum, lastNum)
  }
  
  func newInt(_ firstNum: Int, _ lastNum: Int) -> Int {
    return (firstNum..<lastNum).randomElement() ?? 0
  }
}
