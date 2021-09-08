//
//  TetrominoNode.swift
//  Tetris IOS14
//
//  Created by Matias Rojas Zuñiga on 07/09/2021.
//

import SpriteKit

enum Orientation: UInt32 {
    case up = 1
    case right = 2
    case down = 4
    case left = 8
}

class TetrominoNode: SKSpriteNode {
    let type: TetrominoType
    let orientation: UInt32 = Orientation.up.rawValue
    
    init(type: TetrominoType, startPosition: CGPoint, xOffset: CGFloat) {
        self.type = type
        
        let texture = SKTexture(imageNamed: type.name)
        super.init(texture: texture, color: .white, size: texture.size())
        
        physicsBody = SKPhysicsBody(texture: texture, size: texture.size())
        physicsBody?.categoryBitMask = Orientation.up.rawValue
        physicsBody?.collisionBitMask = Orientation.up.rawValue | Orientation.right.rawValue | Orientation.down.rawValue | Orientation.left.rawValue
        physicsBody?.contactTestBitMask = Orientation.up.rawValue | Orientation.right.rawValue | Orientation.down.rawValue | Orientation.left.rawValue
        name = "tetromino"
        position = CGPoint(x: startPosition.x - xOffset, y: startPosition.y)
        
        configureMovement()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureMovement() {
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: 0, y: 10000))
        
        let movement = SKAction.follow(path.cgPath, asOffset: true, orientToPath: true, speed: 200)
        let sequence = SKAction.sequence([movement, .removeFromParent()])

        run(sequence)
    }
}
