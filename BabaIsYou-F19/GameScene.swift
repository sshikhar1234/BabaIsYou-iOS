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
    var WALL_IS:Bool = false
       var IS_STOP:Bool = false

       var FLAG_IS:Bool = false
       var IS_WIN:Bool = false


    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        print("did Move")

        
        //Setup BABA
            self.baba = self.childNode(withName: "baba") as! SKSpriteNode
            self.baba.physicsBody = SKPhysicsBody(rectangleOf: baba.size)
            self.baba.physicsBody?.affectedByGravity = false
            self.baba.physicsBody?.allowsRotation = false

        //Setup FLAG
                self.flag = self.childNode(withName: "flag") as! SKSpriteNode
                self.flag.physicsBody = SKPhysicsBody(rectangleOf: flag.size)
                self.flag.physicsBody?.affectedByGravity = false
                self.flag.physicsBody?.allowsRotation = false
                self.flag.physicsBody?.categoryBitMask = 2
                
        //Setup Flag Block
               
               self.flagBlock = self.childNode(withName: "flagblock") as! SKSpriteNode
               self.flagBlock.physicsBody = SKPhysicsBody(rectangleOf: flagBlock.size)
               self.flagBlock.physicsBody?.affectedByGravity = false
               self.flagBlock.physicsBody?.allowsRotation = false
               self.flagBlock.physicsBody?.categoryBitMask = 4
               self.flagBlock.physicsBody?.contactTestBitMask = 9


        //Setup IS blocks
        self.enumerateChildNodes(withName: "isblock") {(node, stop) in
            self.isBlock = node as! SKSpriteNode
                self.isBlock.physicsBody = SKPhysicsBody(rectangleOf: self.isBlock.size)
                self.isBlock.physicsBody?.affectedByGravity = false
                                self.isBlock.physicsBody?.categoryBitMask = 8
                                self.isBlock.physicsBody?.collisionBitMask = 0
                                self.isBlock.physicsBody?.contactTestBitMask = 117
            
        }
        
        //Setup Stop Block
                      
                      self.stopBlock = self.childNode(withName: "stopblock") as! SKSpriteNode
                      self.stopBlock.physicsBody = SKPhysicsBody(rectangleOf: stopBlock.size)
                      self.stopBlock.physicsBody?.affectedByGravity = false
                      self.stopBlock.physicsBody?.allowsRotation = false
                      self.stopBlock.physicsBody?.categoryBitMask = 16

        //Setup Win Block
        
        self.winBlock = self.childNode(withName: "winblock") as! SKSpriteNode
        self.winBlock.physicsBody = SKPhysicsBody(rectangleOf: winBlock.size)
        self.winBlock.physicsBody?.affectedByGravity = false
        self.winBlock.physicsBody?.allowsRotation = false
        self.winBlock.physicsBody?.categoryBitMask = 32
        self.winBlock.physicsBody?.contactTestBitMask = 9


        //Setup Wall block
                
        self.wallBlock = self.childNode(withName: "wallblock") as! SKSpriteNode
        self.wallBlock.physicsBody = SKPhysicsBody(rectangleOf: wallBlock.size)
        self.wallBlock.physicsBody?.affectedByGravity = false
        self.wallBlock.physicsBody?.allowsRotation = false
        self.wallBlock.physicsBody?.categoryBitMask = 64
        self.wallBlock.physicsBody?.collisionBitMask = 0
        self.wallBlock.physicsBody?.contactTestBitMask = 9
        
        //Setup Walls
        self.enumerateChildNodes(withName: "wall") {
                   (node, stop) in
                   let stick = node as! SKSpriteNode
                   stick.physicsBody = SKPhysicsBody(rectangleOf: stick.size)
                   stick.physicsBody?.affectedByGravity = false
                   stick.physicsBody?.categoryBitMask = 128
                 stick.physicsBody?.collisionBitMask=0
            
               }
        //Initialize the labels
        upLabel = self.childNode(withName: "uplabel") as! SKLabelNode
        downLabel = self.childNode(withName: "downlabel") as! SKLabelNode
        rightLabel = self.childNode(withName: "rightlabel") as! SKLabelNode
        leftLabel = self.childNode(withName: "leftlabel") as! SKLabelNode
        
    
       
    }
    func didBegin(_ contact: SKPhysicsContact) {
   
        
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
        
        print(nodeA!.name!)
        print(nodeB!.name!)
    
        if(nodeA!.name! == "isblock" &&
            nodeB!.name!=="wallblock"){
            WALL_IS = true;
        }
        if(nodeA!.name! == "isblock" &&
            nodeB!.name!=="stopblock"){
            IS_STOP = true;
        }
        if(nodeA!.name! == "isblock" &&
            nodeB!.name!=="wallblock"){
            WALL_IS = true;
        }
        if(nodeA!.name! == "isblock" &&
            nodeB!.name!=="stopblock"){
            IS_STOP = true;
        }
        if(WALL_IS && IS_STOP){
            print("WALL IS STOP")
            //WALL IS STOP
            self.enumerateChildNodes(withName: "wall") {
                              (node, stop) in
                              let stick = node as! SKSpriteNode
                              stick.physicsBody = SKPhysicsBody(rectangleOf: stick.size)
                              stick.physicsBody?.affectedByGravity = false
                              stick.physicsBody?.categoryBitMask = 128
                       stick.physicsBody?.collisionBitMask=0

                          }

        }
        else{
            
        }
        if(WALL_IS && IS_WIN){
            //WALL IS WIN
            print("WALL IS WIN")

        }
        if(FLAG_IS && IS_STOP){
            //FLAG IS STOP
            print("FLAG IS STOP")

        }
        if(FLAG_IS && IS_WIN){
            //FLAG IS WIN
            print("FLAG IS WIN")

        }

        //        if(self.wallBlock.frame.intersects(self.isBlock.frame)
//        &&
//            self.isBlock.frame.intersects(self.stopBlock.frame)){
//            print("COLLISION! UODATE")
//        }

        print("Something collided!")
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        if(self.wallBlock.frame.intersects(self.isBlock.frame)
        &&
            self.isBlock.frame.intersects(self.stopBlock.frame)){
            print("COLLISION! UODATE")
        }
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
