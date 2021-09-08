//
//  BoardViewController.swift
//  Tetris IOS14
//
//  Created by Matias Rojas Zuñiga on 06/09/2021.
//

import UIKit
import SpriteKit

class BoardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = BoardScene(size: view.frame.size)
        let skView = view as! SKView
        skView.presentScene(scene)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
