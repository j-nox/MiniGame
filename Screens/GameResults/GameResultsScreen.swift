import SwiftUI

struct GameResultsScreen: View {
  
    @State var stepCount = 0
  
    @State var mysteriousNumber = 0
  
    @State var winner = ""
  
    var body: some View {
      Text("Game ended")
      Text("Steps count: \(stepCount)")
      Text("Mysterious integer: \(mysteriousNumber)")
    }
}
