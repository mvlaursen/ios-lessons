import Foundation

class Node {
    let value: Int
    let left: Node?
    let right: Node?
    
    init(value: Int, left: Node?, right: Node?) {
        self.value = value
        self.left = left
        self.right = right
    }
}

func printTree(_ node: Node) {
    var stack: Array<(node: Node, depth: Int)> = [(node: node, depth: 0)]
    
    while stack.count > 0 {
        let current = stack.remove(at: 0)
        let tabs = String(repeating: "\t", count: current.depth)
        print(tabs + "\(current.node.value)")
        if let right = current.node.right {
            stack.insert((node: right, depth: current.depth + 1), at: 0)
        }
        if let left = current.node.left {
            stack.insert((node: left, depth: current.depth + 1), at: 0)
        }
    }
}

func reverseTree(_ node: Node) -> Node {
    var reversedLeft: Node? = nil
    var reversedRight: Node? = nil
    
    if let left = node.left {
        reversedLeft = reverseTree(left)
    }
    if let right = node.right {
        reversedRight = reverseTree(right)
    }
    return Node(value: node.value, left: reversedRight, right: reversedLeft)
}

// 0
//    1
//        4
//        5
//    2
//        6
let na_1_4 = Node(value: 4, left: nil, right: nil)
let na_1_5 = Node(value: 5, left: nil, right: nil)
let na_1 = Node(value: 1, left: na_1_4, right: na_1_5)
let na_2_6 = Node(value: 6, left: nil, right: nil)
let na_2 = Node(value: 2, left: na_2_6, right: nil)
let na = Node(value: 0, left: na_1, right: na_2)
printTree(na)
let nr = reverseTree(na)
printTree(nr)
