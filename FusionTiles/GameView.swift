import SwiftUI

struct GameView: View {
    @ObservedObject var game = GameModel()
    
    var body: some View {
        VStack {
            Text("Fusion Tiles")
                .font(.largeTitle)
                .padding()
            Text("Score: \(game.score)")
                .font(.title)
                .padding()
            GridView(game: game)
            HStack {
                Button(action: {
                    game.move(direction: "left")
                }) {
                    Text("←")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: {
                    game.move(direction: "up")
                }) {
                    Text("↑")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: {
                    game.move(direction: "down")
                }) {
                    Text("↓")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Button(action: {
                    game.move(direction: "right")
                }) {
                    Text("→")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            Button(action: {
                game.resetGame()
            }) {
                Text("New Game")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
