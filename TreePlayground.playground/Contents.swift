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
    var stack: Array<Node> = [node]
    
    while stack.count > 0 {
        let currentNode = stack.remove(at: 0)
        print("\(currentNode.value)")
        if let right = currentNode.right {
            stack.insert(right, at: 0)
        }
        if let left = currentNode.left {
            stack.insert(left, at: 0)
        }
    }
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
