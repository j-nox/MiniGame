import SwiftUI

struct GameScreen: View {
  
  @StateObject var viewModel: GameScreenViewModel = GameScreenViewModel()
  
  var body: some View {
    VStack {
      HStack {
        Text("Step \(viewModel.currentPlayerName)")
      }
      HStack {
        Text("\(viewModel.message)")
        Button {
          if viewModel.gameIsRunning {
            viewModel.step()
          } else {
            viewModel.startGame()
          }
        } label: {
          if viewModel.gameIsRunning {
            Text("Next step")
          } else {
            Text("Start game")
          }
        }
      }
      .sheet(isPresented: $viewModel.showResult, onDismiss: {
        viewModel.showResult = false
      }) {
        GameResultsScreen(stepCount: viewModel.stepCount, mysteriousNumber: viewModel.mysteriousNumber)
      }
    }
  }
}
