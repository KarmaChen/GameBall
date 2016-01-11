//
//  GameOverScene.swift
//  KickBalliOS
//
//  Created by 陈昆涛 on 15/11/3.
//  Copyright © 2015年 陈昆涛. All rights reserved.
//

import Foundation
import SpriteKit
class GameOverScene:SKScene{
    override init(size: CGSize) {
        super.init(size:size)
        let lable=SKLabelNode()
        lable.text="游戏结束"
        lable.position=CGPoint(x: size.width/2, y: size.height/2)
        addChild(lable)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}