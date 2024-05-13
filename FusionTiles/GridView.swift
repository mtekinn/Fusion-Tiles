import SwiftUI

struct GridView: View {
    @ObservedObject var game: GameModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(game.tiles) { tile in
                TileView(tile: tile)
                    .frame(height: 100)
                    .background(Color.gray)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(game: GameModel())
    }
}
