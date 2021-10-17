//
//  ViewController.swift
//  ViewBackground01
//
//  Created by 周哲輝 on 2021/10/04.
//

import SpriteKit
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        let scene = GameScene(size: self.view.frame.size)
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
    }


}

