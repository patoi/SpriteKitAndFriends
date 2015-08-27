//
//  TestViewController.swift
//  SpriteKitTankTalk
//
//  Created by Francesco Frison on 27/08/2015.
//  Copyright (c) 2015 frison. All rights reserved.
//

import UIKit
import SpriteKit

class TestViewController: UIViewController {
    
    // SKScene and SKNode
    
    override func viewDidAppear(animated: Bool) {
        
        let scene = SKScene(size: self.view.bounds.size)
        
        let node = SKSpriteNode(color: UIColor.redColor(), size: CGSize(width: 50.0, height: 50.0))
        node.position = CGPoint(x: 100.0, y: 100.0)
        
        scene.addChild(node)
        
        let skView = self.view as! SKView
        skView.presentScene(scene)

    }
    
    // SKAction
    
    func addActionToNode(node: SKSpriteNode) {
        let position = CGPoint(x: 50.0, y: 40.0)
        let move = SKAction.moveTo(position, duration: 1.0)
    }
    
    // Sprite textures
    
    func addSpritesToNode(node: SKSpriteNode) {
        var textures = [SKTexture]()
        for i in 1...10 {
            let name = NSString(format: "slice%.2d", i) as String
            let texture = SKTexture(imageNamed: name)
            textures.append(texture)
        }
        
        let spriteAction = SKAction.animateWithTextures(textures, timePerFrame: 0.05)
        node.runAction(SKAction.repeatActionForever(spriteAction), withKey: "spriteActionKey")
    }
    
    // Physics
    
    func addPhysicsToNode(node: SKSpriteNode)  {
        let physics = SKPhysicsBody(circleOfRadius: (node.size.width / 2.0))
        physics.dynamic = false
        physics.friction = 0.2
        physics.restitution = 0.2
        physics.mass = 10.0
        physics.density = 1.0
        
        node.physicsBody = physics
    }
    
    // Gravity
    
    func addGravity(scene: SKScene, node: SKSpriteNode)  {
        scene.physicsWorld.gravity = CGVector(dx: 0.0, dy: -1.0)
        
        let physics = SKPhysicsBody(circleOfRadius: (node.size.width / 2.0))
        //...
        
        physics.affectedByGravity = true
        physics.dynamic = true
    }
    
    // Path Finding
    
    func setupPathFinding(scene: SKScene, node: SKSpriteNode)  {
        
    }

    // MaxminStrategist
    
    func setupStrategist()  {
        
    }
    
}

