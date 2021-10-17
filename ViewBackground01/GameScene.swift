//
//  GameScene.swift
//  ViewBackground01
//
//  Created by 周哲輝 on 2021/10/04.
//

import SpriteKit
import UIKit

class GameScene: SKScene {
    let background = SKSpriteNode(imageNamed: "background")
    let eightySix = SKSpriteNode(imageNamed: "24555_1_d2")
    let meltyBlood = SKSpriteNode(imageNamed: "capsule_616x353")
    let trails = SKSpriteNode(imageNamed: "the-legend-of-heroes-kuro-no-kiseki-680293.10")

    var meltyBloodXSpeed = 1.0
    var meltyBloodYSpeed = 1.0
    var meltyBloodOffsetPositiveX = 0.0
    var meltyBloodOffsetNegativeX = 0.0
    var meltyBloodOffsetPositiveY = 0.0
    var meltyBloodOffsetNegativeY = 0.0
    var trailsSpeed = CGPoint(x: 0.0, y: 0.0)
    var currentTouchPoint = CGPoint(x: 0.0, y: 0.0)
    
    override func didMove(to view: SKView) {
        background.position = CGPoint(x: size.width * 0.5, y: size.height * 0.5)
        background.size = CGSize(width: background.size.width * 1.2, height: background.size.height * 1.2)
        addChild(background)

        eightySix.size = CGSize(width: eightySix.size.width * 0.1, height: eightySix.size.height * 0.1)
        eightySix.position = CGPoint(x: size.width * 0.25, y: size.height * 0.25)
        addChild(eightySix)

        meltyBlood.size = CGSize(width: meltyBlood.size.width * 0.25, height: meltyBlood.size.height * 0.25)
        meltyBlood.position = CGPoint(x: size.width * 0.75, y: size.height * 0.75)
        addChild(meltyBlood)

        trails.size = CGSize(width: trails.size.width * 0.35, height: trails.size.height * 0.35)
        trails.position = CGPoint(x: size.width * 0.75, y: size.height * 0.5)
        addChild(trails)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touchPoint = touches.first {
            let touchPointLocation = touchPoint.location(in: self)
            eightySix.position = touchPointLocation
            let action = SKAction.move(to: touchPointLocation, duration: 0.5)
            trails.run(action)
        }
    }

    override func update(_ currentTime: TimeInterval) {
        meltyBlood.position.x += meltyBloodXSpeed
        meltyBlood.position.y += meltyBloodYSpeed
        meltyBloodOffsetPositiveX = meltyBlood.position.x + (meltyBlood.size.width / 2.0)
        meltyBloodOffsetNegativeX = meltyBlood.position.x - (meltyBlood.size.width / 2.0)
        meltyBloodOffsetPositiveY = meltyBlood.position.y + (meltyBlood.size.height / 2.0)
        meltyBloodOffsetNegativeY = meltyBlood.position.y - (meltyBlood.size.height / 2.0)

        if meltyBloodOffsetPositiveX > self.size.width || meltyBloodOffsetNegativeX < 0.0 {
            meltyBloodXSpeed *= -1.0
        }
        
        if meltyBloodOffsetPositiveY > self.size.height || meltyBloodOffsetNegativeY < 0.0 {
            meltyBloodYSpeed *= -1.0
        }
    }
}
