//
//  Stage.swift
//  kancolle-ac-calculator
//
//  Created by mollifier on 2016/06/06.
//
//

import Foundation

// 海域
class Stage {
    enum StageType {
        // 通常
        case Normal
        // 追撃
        case Pursuit
    }
        
    // 海域番号
    var areaNumber = 0
    
    // ステージ番号
    var stageNumber = 0
    
    // 種別
    var stageType = StageType.Normal
    
    // GPコスト
    var cost = 0
    
    init(areaNumber: Int, stageNumber: Int, stageType: StageType, cost: Int) {
        self.areaNumber = areaNumber
        self.stageNumber = stageNumber
        self.stageType = stageType
        self.cost = cost
    }
}
