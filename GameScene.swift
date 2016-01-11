//
//  GameScene.swift
//  KickBalliOS
//
//  Created by 陈昆涛 on 15/11/2.
//  Copyright (c) 2015年 陈昆涛. All rights reserved.
//

import SpriteKit

let MASK_EDGE:UInt32=0b1
let MASK_ball:UInt32=0b10
let MASK_FLAG:UInt32=0b100


class GameScene: SKScene ,SKPhysicsContactDelegate{
    
    var gameStarted: Bool!
    var ball:SKSpriteNode!
    var startGameLable:SKLabelNode!
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        self.physicsBody=SKPhysicsBody(edgeLoopFromRect: self.frame)
        physicsBody?.contactTestBitMask=MASK_EDGE
        physicsWorld.contactDelegate=self
        ball=childNodeWithName("ball") as! SKSpriteNode
        startGameLable=childNodeWithName("startGameLable") as! SKLabelNode
        
        
        
        }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if (gameStarted != nil) {
            //add flag
            let flag=SKSpriteNode(imageNamed: "flag3")
            addChild(flag)
            flag.physicsBody=SKPhysicsBody(rectangleOfSize: flag.frame.size)
            flag.position=(touches as NSSet).anyObject()!.locationInNode(self)
            flag.physicsBody?.contactTestBitMask=MASK_FLAG
            flag.physicsBody?.velocity=CGVector(dx: 0,dy: 500)
            
            
        }else{
            gameStarted = true
            ball.physicsBody=SKPhysicsBody(circleOfRadius:
                ball.frame.size.width/2)
            ball.physicsBody?.contactTestBitMask=MASK_ball
            startGameLable.hidden=true
        }
        }
    func didBeginContact(contact: SKPhysicsContact)
    {
        let maskCode=contact.bodyA.contactTestBitMask|contact.bodyB.contactTestBitMask
        if contact.bodyA.contactTestBitMask==MASK_FLAG{
            contact.bodyA.node?.removeFromParent()
        }
        if contact.bodyB.contactTestBitMask==MASK_FLAG{
            contact.bodyB.node?.removeFromParent()
        }else if maskCode==MASK_EDGE|MASK_ball{
            //print("GameOver")
            self.view?.presentScene(GameOverScene(size:self.frame.size))
            
        }

    }

    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
