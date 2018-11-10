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
    let squares: Array<Player>
    
    init(squares: Array<Player>) {
        self.squares = squares
    }
    
    func describe(withIndentLevel level: Int) -> String {
        let tabs = String(repeating: "\t", count: level)
        var description = tabs
        description += "\(squares[0].description) \(squares[1].description) \(squares[2].description)\n"
        description += tabs
        description += "\(squares[3].description) \(squares[4].description) \(squares[5].description)\n"
        description += tabs
        description += "\(squares[6].description) \(squares[7].description) \(squares[8].description)\n"
        description += "\n"
        return description
    }
    
    // The score is always positive for the player at the top of the tree.
    func score(node: Node) -> Int {
        return 0
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
        var description = self.board.describe(withIndentLevel: self.depth)
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
    let b4_w8 = Node(board: Board(squares: [Player.empty, Player.empty, Player.empty, Player.empty, Player.black, Player.empty, Player.empty, Player.empty, Player.white]))
    b4.addChild(b4_w8)
        let b4_w8_b2 = Node(board: Board(squares: [Player.empty, Player.empty, Player.black, Player.empty, Player.black, Player.empty, Player.empty, Player.empty, Player.white]))
        b4_w8.addChild(b4_w8_b2)
        let b4_w8_b5 = Node(board: Board(squares: [Player.empty, Player.empty, Player.empty, Player.empty, Player.black, Player.black, Player.empty, Player.empty, Player.white]))
        b4_w8.addChild(b4_w8_b5)
print(b4)

