import SwiftUI

struct GameScreen: View {
  
  @StateObject var viewModel: GameScreenViewModel = GameScreenViewModel()
  
  @State var yourNumber = ""
  
  var body: some View {
    VStack {
      if viewModel.game.gameIsRunning {
        if viewModel.game.currentPlayer == .user {
          HStack {
            Text("Played \(viewModel.user.name) vs \(viewModel.comp.name)")
          }
          HStack {
            Text("Your Myst. number \(viewModel.user.mysteriousNum)")
          }
          HStack {
            Text("Steps \(viewModel.game.stepsComp)")
          }
          HStack {
            Text("\(viewModel.comp.name) said \(viewModel.comp.estimatedNum)")
          }
          HStack {
            Text("Message \(viewModel.game.message)")
          }
          Button {
            viewModel.stepComp()
          } label: {
            Text("Next step")
          }
        } else {
          HStack {
            Text("Played \(viewModel.comp.name) vs \(viewModel.user.name)")
          }
          HStack {
            Text("Your steps \(viewModel.game.stepsUser)")
          }
          HStack {
            Text("Message \(viewModel.game.message)")
          }
          HStack {
            Text("Myst. \(viewModel.comp.mysteriousNumber)")
          }
          HStack {
            TextField("Your estimated number", text: $yourNumber)
          }
          HStack {
            Button {
              viewModel.user.estimatedNum = Int(yourNumber) ?? 0
              viewModel.stepUser()
            } label: {
              Text("Next step")
            }
          }
        }
      } else {
        HStack {
          Text("User score: \(viewModel.game.scoreUser)")
          Text("Comp score: \(viewModel.game.scoreComp)")
        }
        Button {
          viewModel.start()
        } label: {
          Text("Start game")
        }
      }
    }
  }
}
