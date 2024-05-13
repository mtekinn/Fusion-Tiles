import SwiftUI

struct TileModel: Identifiable {
    let id: Int
    var value: Int
    
    var color: Color {
        switch value {
        case 2:
            return .blue
        case 4:
            return .green
        case 8:
            return .orange
        case 16:
            return .red
        case 32:
            return .purple
        case 64:
            return .pink
        case 128:
            return .yellow
        case 256:
            return .cyan
        case 512:
            return .teal
        case 1024:
            return .indigo
        case 2048:
            return .black
        default:
            return .gray
        }
    }
}
