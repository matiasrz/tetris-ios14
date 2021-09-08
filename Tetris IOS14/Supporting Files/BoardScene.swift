//
//  BoardScene.swift
//  Tetris IOS14
//
//  Created by Matias Rojas Zuñiga on 06/09/2021.
//

import UIKit
import SpriteKit

class BoardScene: SKScene {
    
    let tetrominoTypes = Bundle.main.decode([TetrominoType].self, from: "tetromino-types.json")
    let waves = Bundle.main.decode([Wave].self, from: "waves.json")
    
    var waveNumber = 0
    let positions = Array(stride(from: 480, to: -480, by: -80))
    
//    override func didMove(to view: SKView) {
//        let label = SKLabelNode(text: "Hello SpriteKit!")
//        let centerWidth = view.frame.width / 2
//        label.position = CGPoint(x: centerWidth, y: view.frame.height / 2)
//
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: 0, y: view.frame.height))
//        path.addLine(to: CGPoint(x: 0, y: -1000))
//
//        let move = SKAction.follow(path.cgPath, asOffset: true, orientToPath: true, speed: 200)
//        let moveReversed = move.reversed()
//        let moveActions = [move, moveReversed]
//        let sequence = SKAction.sequence(moveActions)
//        let infiniteSequence = SKAction.repeatForever(sequence)
//
//        addChild(label)
//
//        label.run(infiniteSequence)
//    }

    override func update(_ currentTime: TimeInterval) {
        for child in children {
            if child.frame.maxY < 0 {
                if !frame.intersects(child.frame) {
                    child.removeFromParent()
                }
            }
        }
        
        let activePieces = children.compactMap { $0 as? TetrominoNode }
        if activePieces.isEmpty {
            createWave()
        }
    }
    
    func createWave() {
        waveNumber = waveNumber == waves.count ? 0 : waveNumber
   
        let pieceOffsetX: CGFloat = 100
        let pieceStartX = 150
//        let unwrappedView: SKView = view!
//        let height = unwrappedView.frame.height as CGFloat
        for piece in waves {
            let node = TetrominoNode(type: tetrominoTypes[0], startPosition: CGPoint(x: pieceStartX, y: positions[piece.position]), xOffset: pieceOffsetX * piece.xOffset)
            addChild(node)
        }
    }
}
