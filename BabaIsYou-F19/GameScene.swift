//
//  GameScene.swift
//  BabaIsYou-F19
//
//  Created by Parrot on 2019-10-17.
//  Copyright © 2019 Parrot. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    var PLAYER_SPEED: CGFloat = 20
    //Category: 1
    var baba: SKSpriteNode!

    //Category: 2
    var flag: SKSpriteNode!

    //Category: 4
    var flagBlock: SKSpriteNode!

    //Category: 8
    var isBlock: SKSpriteNode!

    //Category: 16
    var stopBlock: SKSpriteNode!

    //Category: 32
    var winBlock: SKSpriteNode!
    
    //Category: 64
    var wallBlock: SKSpriteNode!
    
    //Category: 128
    var wall: SKSpriteNode!
    
    //Control Labels
    var upLabel: SKLabelNode!
    var downLabel: SKLabelNode!
    var leftLabel: SKLabelNode!
    var rightLabel: SKLabelNode!
    

    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        print("did Move")

        
        self.baba = self.childNode(withName: "baba") as! SKSpriteNode
        
        self.baba.physicsBody = SKPhysicsBody(rectangleOf: baba.size)
        self.baba.physicsBody?.affectedByGravity = false
        self.baba.physicsBody?.allowsRotation = false
        self.baba.physicsBody?.categoryBitMask = 1

        
        //Setup Walls
        self.enumerateChildNodes(withName: "wall") {
                   (node, stop) in
                   let stick = node as! SKSpriteNode
                   stick.physicsBody = SKPhysicsBody(rectangleOf: stick.size)
                   stick.physicsBody?.affectedByGravity = false
                   stick.physicsBody?.categoryBitMask = 128
                   stick.physicsBody?.collisionBitMask = 0
               }
        //Setup IS blocks
        self.enumerateChildNodes(withName: "isblock") {(node, stop) in
                let isBlock = node as! SKSpriteNode
                isBlock.physicsBody = SKPhysicsBody(rectangleOf: isBlock.size)
                isBlock.physicsBody?.affectedByGravity = false
                                isBlock.physicsBody?.categoryBitMask = 8
                                isBlock.physicsBody?.collisionBitMask = 0
                                isBlock.physicsBody?.contactTestBitMask = 0
            
        }
                

        //Initialize the labels
        upLabel = self.childNode(withName: "uplabel") as! SKLabelNode
        downLabel = self.childNode(withName: "downlabel") as! SKLabelNode
        rightLabel = self.childNode(withName: "rightlabel") as! SKLabelNode
        leftLabel = self.childNode(withName: "leftlabel") as! SKLabelNode
        
        //Check if the wall rule is alive
        
       
    }
//   

    func didBegin(_ contact: SKPhysicsContact) {
//        print(contact.bodyA.)
        print("Something collided!")
    }
    
    override func update(_ currentTime: TimeInterval) {
//        if(self.wallBlock.frame.intersects(self.isBlock.frame)
//            &&
//            self.isBlock.frame.intersects(self.stopBlock.frame)){
//            print("Wall Rule Alive!")
//            //                        self.baba.physicsBody?.collisionBitMask = 246
//            //                self.baba.physicsBody?.contactTestBitMask = 128
//        }
//        else {
//            //                  self.baba.physicsBody?.collisionBitMask = 118
//                }
        // Called before each frame is rendered
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
         let mouseTouch = touches.first
         if( mouseTouch == nil){
             return
         }
         let location = mouseTouch!.location(in: self)
         let nodeTouched = atPoint(location).name
        if(nodeTouched == "uplabel"){
            print("up")
           //moveUp
            print(self.baba.position.y)
            self.baba.position.y = self.baba.position.y + PLAYER_SPEED
           }
           else if(nodeTouched == "downlabel"){
            self.baba.position.y = self.baba.position.y - PLAYER_SPEED
               //move down
                   print("down")
               }
           else if(nodeTouched == "rightlabel"){
            self.baba.position.x = self.baba.position.x + PLAYER_SPEED
               //move right
            print("right")

               }
           else if(nodeTouched == "leftlabel"){
            self.baba.position.x = self.baba.position.x - PLAYER_SPEED
               // move left
            print("left")

               }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
}
