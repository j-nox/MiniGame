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

//struct GameScreen: View {
//
//  @StateObject var viewModel: GameScreenViewModel = GameScreenViewModel()
//  @State var yourNumber: String = ""
//  @State var yourAnswer: String = ""
//
//  var body: some View {
//    VStack {
//      HStack {
//        if viewModel.currentPlayer == .user {
//          Text("Your step. Your number: \(viewModel.mysteriousNumber)")
//        } else {
//          Text("Computer played")
//        }
//      }
//      if viewModel.currentPlayer == .user && viewModel.gameIsRunning == false {
//        HStack {
//          TextField("Your number", text: $yourNumber)
//        }
//      }
//      if viewModel.gameIsRunning == true && viewModel.currentPlayer == .user {
//        HStack {
//          Text("Step count: \(viewModel.stepCount)")
//        }
//        HStack {
//          Text("\(viewModel.message)")
//        }
//        HStack {
//          Text("Computer said number: \(viewModel.estimatedInt)")
//        }
//      }
//      if viewModel.gameIsRunning == true && viewModel.currentPlayer == .comp {
//        HStack {
//          Text("Step count: \(viewModel.stepCount)")
//        }
//        HStack {
//          Text("Mysterious: \(viewModel.mysteriousNumber)")
//        }
//        HStack {
//          Text("Answer : \(viewModel.answerNumber)")
//        }
//        HStack {
//          Text("\(viewModel.message)")
//        }
//        HStack {
//          TextField("Your answer", text: $yourAnswer)
//        }
//      }
//      HStack {
//        Button {
//          if viewModel.gameIsRunning {
//            if viewModel.currentPlayer == .comp {
//              viewModel.answerNumber = Int(yourAnswer) ?? 1
//            }
//            viewModel.step()
//          } else {
//            if viewModel.currentPlayer == .user {
//              viewModel.mysteriousNumber = Int(yourNumber) ?? 1
//            }
//            viewModel.startGame()
//          }
//        } label: {
//          if viewModel.gameIsRunning {
//            Text("Next step")
//          } else {
//            Text("Start game")
//          }
//        }
//      }
//      .sheet(isPresented: $viewModel.showResult, onDismiss: {
//        viewModel.showResult = false
//        viewModel.changePlayer()
//        viewModel.startGame()
//      }) {
//        GameResultsScreen(stepCount: viewModel.stepCount, mysteriousNumber: viewModel.mysteriousNumber)
//      }
//    }
//  }
//}
