import Foundation

// 0 1 2
// 3 4 5
// 6 7 8

enum Player {
    case black
    case white
}

class Node: CustomStringConvertible {
    let player: Player
    let move: UInt
    var children: [Node] = []
    
    init(player: Player, move: UInt) {
        self.player = player
        self.move = move
    }
    
    func addChild(_ node: Node) {
        children.append(node)
    }
    
    var description: String {
        var description = "player: \(self.player) move: \(self.move) children: \(children.count)"
        for child in self.children {
            description += "\n\tplayer: \(child.player) move: \(child.move)"
        }
        return description
    }
}

let rootNode = Node(player: .black, move: 4)
print(rootNode)
rootNode.addChild(Node(player: .white, move: 2))
rootNode.addChild(Node(player: .white, move: 8))
print(rootNode)
