import SwiftUI

class GameModel: ObservableObject {
    @Published var tiles: [TileModel]
    @Published var score: Int
    
    init() {
        tiles = Array(repeating: TileModel(id: 0, value: 0), count: 16)
        score = 0
        resetGame()
    }
    
    func resetGame() {
        for i in 0..<tiles.count {
            tiles[i] = TileModel(id: i, value: 0)
        }
        score = 0
        addNewTile()
        addNewTile()
    }
    
    func addNewTile() {
        let emptyTiles = tiles.filter { $0.value == 0 }
        if let randomTile = emptyTiles.randomElement() {
            if let index = tiles.firstIndex(where: { $0.id == randomTile.id }) {
                tiles[index].value = [2, 4].randomElement()!
            }
        }
    }
    
    func slideLeft() {
        for i in 0..<4 {
            var row = tiles[(i*4)..<((i*4)+4)].map { $0.value }
            row = combine(row: row)
            for j in 0..<4 {
                tiles[(i*4)+j].value = row[j]
            }
        }
    }
    
    func combine(row: [Int]) -> [Int] {
        var newRow = row.filter { $0 != 0 }
        var combinedRow = Array(repeating: 0, count: 4)
        var index = 0
        
        while newRow.count > 1 {
            if newRow[0] == newRow[1] {
                combinedRow[index] = newRow[0] * 2
                score += combinedRow[index]
                newRow.remove(at: 0)
                newRow.remove(at: 0)
            } else {
                combinedRow[index] = newRow[0]
                newRow.remove(at: 0)
            }
            index += 1
        }
        
        if newRow.count == 1 {
            combinedRow[index] = newRow[0]
        }
        
        return combinedRow
    }
    
    func slideRight() {
        for i in 0..<4 {
            var row = tiles[(i*4)..<((i*4)+4)].map { $0.value }
            row = combine(row: row.reversed()).reversed()
            for j in 0..<4 {
                tiles[(i*4)+j].value = row[j]
            }
        }
    }
    
    func slideUp() {
        for i in 0..<4 {
            var column = [tiles[i].value, tiles[i+4].value, tiles[i+8].value, tiles[i+12].value]
            column = combine(row: column)
            for j in 0..<4 {
                tiles[i+(j*4)].value = column[j]
            }
        }
    }
    
    func slideDown() {
        for i in 0..<4 {
            var column = [tiles[i].value, tiles[i+4].value, tiles[i+8].value, tiles[i+12].value]
            column = combine(row: column.reversed()).reversed()
            for j in 0..<4 {
                tiles[i+(j*4)].value = column[j]
            }
        }
    }
    
    func move(direction: String) {
        switch direction {
        case "left":
            slideLeft()
        case "right":
            slideRight()
        case "up":
            slideUp()
        case "down":
            slideDown()
        default:
            break
        }
        addNewTile()
        if isGameOver() {
            print("Game Over!")
        }
    }
    
    func isGameOver() -> Bool {
        if tiles.contains(where: { $0.value == 0 }) {
            return false
        }
        for i in 0..<4 {
            for j in 0..<4 {
                let current = tiles[i * 4 + j].value
                if (j < 3 && current == tiles[i * 4 + j + 1].value) || (i < 3 && current == tiles[(i + 1) * 4 + j].value) {
                    return false
                }
            }
        }
        return true
    }
}
