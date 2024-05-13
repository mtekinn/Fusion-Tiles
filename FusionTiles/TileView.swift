import SwiftUI

struct TileView: View {
    var tile: TileModel
    
    var body: some View {
        Text(tile.value == 0 ? "" : "\(tile.value)")
            .font(.largeTitle)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(tile.color)
            .cornerRadius(10)
    }
}

struct TileView_Previews: PreviewProvider {
    static var previews: some View {
        TileView(tile: TileModel(id: 0, value: 2))
    }
}
