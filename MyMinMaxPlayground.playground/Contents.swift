import Foundation

// 0 1 2
// 3 4 5
// 6 7 8

enum Player {
    case black
    case white
}

class Node: CustomStringConvertible {
    var depth: UInt = 0
    let player: Player
    let move: UInt
    var children: [Node] = []
    
    init(player: Player, move: UInt) {
        self.player = player
        self.move = move
    }
    
    func addChild(_ node: Node) {
        node.depth = self.depth + 1
        children.append(node)
    }
    
    var description: String {
        var description = "player: \(self.player) move: \(self.move) children: \(children.count)"
        for child in self.children {
            description += "\n"
            for _ in 0..<child.depth {
                description += "\t"
            }
            description += child.description
        }
        return description
    }
}

// A tree of alternating-turn moves to play around with...
let b4 = Node(player: .black, move: 4)
    let b4_w2 = Node(player: .white, move: 2)
    b4.addChild(b4_w2)
        let b4_w2_b8 = Node(player: .black, move: 8)
        b4_w2.addChild(b4_w2_b8)
        let b4_w2_b5 = Node(player: .black, move: 5)
        b4_w2.addChild(b4_w2_b5)
    let b4_w8 = Node(player: .white, move: 8)
    b4.addChild(b4_w8)
        let b4_w8_b2 = Node(player: .black, move: 2)
        b4_w8.addChild(b4_w8_b2)
        let b4_w8_b5 = Node(player: .black, move: 2)
        b4_w8.addChild(b4_w8_b5)
print(b4)

