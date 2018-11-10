import Foundation

enum Player: CustomStringConvertible {
    case empty
    case black
    case white
    
    var description: String {
        switch self {
        case .empty:
            return "."
        case .black:
            return "B"
        case .white:
            return "W"
        }
    }
}

// 0 1 2
// 3 4 5
// 6 7 8
struct Board {
    static let runIndicesList: [[Int]] = [[0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 4, 8], [2, 4, 6], [0, 3, 6], [1, 4, 7], [2, 5, 8]]
    
    let squares: Array<Player>
    
    init(squares: Array<Player>) {
        self.squares = squares
    }
    
    func describe(indentLevel level: Int) -> String {
        let tabs = String(repeating: "\t", count: level)
        var description = tabs
        description += "\(squares[0].description) \(squares[1].description) \(squares[2].description)\n"
        description += tabs
        description += "\(squares[3].description) \(squares[4].description) \(squares[5].description)\n"
        description += tabs
        description += "\(squares[6].description) \(squares[7].description) \(squares[8].description)\n"
        description += tabs
        description += "score: \(self.score())\n"
        return description
    }
    
    func scoreRun(runIndices: [Int]) -> Int {
        let run = runIndices.map { (index) -> Player in
            self.squares[index]
        }
        let score = run.reduce(0) { (total, player) -> Int in
            switch player {
            case .empty: return total
            case .black: return total + 1
            case .white: return total - 1
            }
        }
        return score
    }
    
    // Positive is a good move for Player.black.
    func score() -> Int {
        var score = 0
        for runIndices in Board.runIndicesList {
            score += scoreRun(runIndices: runIndices)
        }
        return score
    }
}

class Node: CustomStringConvertible {
    let board: Board
    var depth: Int = 0
    var children: [Node] = []
    
    init(board: Board) {
        self.board = board
    }
    
    func addChild(_ node: Node) {
        node.depth = self.depth + 1
        children.append(node)
    }

    var description: String {
        var description = self.board.describe(indentLevel: self.depth)
        for child in children {
            description += child.description
        }
        return description
    }
}

// A tree of alternating-turn moves to play around with...
let b4 = Node(board: Board(squares: [Player.empty, Player.empty, Player.empty, Player.empty, Player.black, Player.empty, Player.empty, Player.empty, Player.empty]))
    let b4_w2 = Node(board: Board(squares: [Player.empty, Player.empty, Player.white, Player.empty, Player.black, Player.empty, Player.empty, Player.empty, Player.empty]))
    b4.addChild(b4_w2)
        let b4_w2_b8 = Node(board: Board(squares: [Player.empty, Player.empty, Player.white, Player.empty, Player.black, Player.empty, Player.empty, Player.empty, Player.black]))
        b4_w2.addChild(b4_w2_b8)
        let b4_w2_b5 = Node(board: Board(squares: [Player.empty, Player.empty, Player.white, Player.empty, Player.black, Player.black, Player.empty, Player.empty, Player.empty]))
        b4_w2.addChild(b4_w2_b5)
    let b4_w5 = Node(board: Board(squares: [Player.empty, Player.empty, Player.empty, Player.empty, Player.black, Player.white, Player.empty, Player.empty, Player.empty]))
    b4.addChild(b4_w5)
        let b4_w5_b2 = Node(board: Board(squares: [Player.empty, Player.empty, Player.black, Player.empty, Player.black, Player.white, Player.empty, Player.empty, Player.white]))
        b4_w5.addChild(b4_w5_b2)
        let b4_w5_b7 = Node(board: Board(squares: [Player.empty, Player.empty, Player.empty, Player.empty, Player.black, Player.white, Player.black, Player.empty, Player.white]))
        b4_w5.addChild(b4_w5_b7)
print(b4)

