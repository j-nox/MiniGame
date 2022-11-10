import SwiftUI

struct GameScreen: View {
  
  @StateObject var viewModel: GameScreenViewModel = GameScreenViewModel()
  
  @State var yourNumber    = ""
  
  @State var youMystNumber = ""
  
  var body: some View {
    VStack {
      if viewModel.game.gameIsRunning {
        if viewModel.game.currentPlayer == .user {
          HStack {
            Text("Played \(viewModel.user.name) vs \(viewModel.comp.name)")
              .font(.system(size: 30))
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
            Text("Message: \(viewModel.game.message)")
              .font(.system(size: 20))
              .foregroundColor(.red)
          }
          Button {
            viewModel.stepComp()
          } label: {
            Text("Next step")
          }
        } else {
          HStack {
            Text("Played \(viewModel.comp.name) vs \(viewModel.user.name)")
              .font(.system(size: 30))
          }
          HStack {
            Text("Your steps \(viewModel.game.stepsUser)")
          }
          HStack {
            Text("Message \(viewModel.game.message)")
              .font(.system(size: 20))
              .foregroundColor(.red)
          }
          HStack {
            Text("Myst. \(viewModel.comp.mysteriousNumber)")
          }
          HStack {
            TextField("Your estimated number", text: $yourNumber)
              .foregroundColor(.black)
              .background(.gray)
              .padding(20)
          }
          HStack {
            Button {
              viewModel.user.estimatedNum = Int(yourNumber) ?? 1
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
        HStack {
          TextField("Enter your mysterious number", text: $youMystNumber)
            .foregroundColor(.black)
            .background(.gray)
            .padding(20)
        }
        Button {
          viewModel.user.mysteriousNum = Int(youMystNumber) ?? 1
          viewModel.start()
        } label: {
          Text("Start game")
        }
        .alert(isPresented: $viewModel.game.showEndRounde) {
          Alert(
            title: Text("Round ended")
          )
        }
      }
    }
  }
}
