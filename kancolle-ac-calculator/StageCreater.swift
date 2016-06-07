//
//  StageCreater.swift
//  kancolle-ac-calculator
//
//  Created by mollifier on 2016/06/07.
//
//

import Foundation

class StageCreater {
    private static let _stages: [Stage] = [
        Stage(areaNumber: 1, stageNumber: 1, stageType: .Normal, cost: 150),
        Stage(areaNumber: 1, stageNumber: 1, stageType: .Pursuit, cost: 100),
        Stage(areaNumber: 1, stageNumber: 2, stageType: .Normal, cost: 200),
        Stage(areaNumber: 1, stageNumber: 2, stageType: .Pursuit, cost: 100),
        Stage(areaNumber: 1, stageNumber: 3, stageType: .Normal, cost: 240),
        Stage(areaNumber: 1, stageNumber: 3, stageType: .Pursuit, cost: 150),
        Stage(areaNumber: 1, stageNumber: 4, stageType: .Normal, cost: 280),
        Stage(areaNumber: 1, stageNumber: 4, stageType: .Pursuit, cost: 150),
    
        Stage(areaNumber: 2, stageNumber: 1, stageType: .Normal, cost: 240),
        Stage(areaNumber: 2, stageNumber: 1, stageType: .Pursuit, cost: 150),
        Stage(areaNumber: 2, stageNumber: 2, stageType: .Normal, cost: 260),
        Stage(areaNumber: 2, stageNumber: 2, stageType: .Pursuit, cost: 150),
        Stage(areaNumber: 2, stageNumber: 3, stageType: .Normal, cost: 280),
        Stage(areaNumber: 2, stageNumber: 3, stageType: .Pursuit, cost: 200),
        Stage(areaNumber: 2, stageNumber: 4, stageType: .Normal, cost: 300),
        Stage(areaNumber: 2, stageNumber: 4, stageType: .Pursuit, cost: 200),
    
        Stage(areaNumber: 3, stageNumber: 1, stageType: .Normal, cost: 360),
        Stage(areaNumber: 3, stageNumber: 1, stageType: .Pursuit, cost: 150),
        Stage(areaNumber: 3, stageNumber: 2, stageType: .Normal, cost: 390),
        Stage(areaNumber: 3, stageNumber: 2, stageType: .Pursuit, cost: 150),
        Stage(areaNumber: 3, stageNumber: 3, stageType: .Normal, cost: 420),
        Stage(areaNumber: 3, stageNumber: 3, stageType: .Pursuit, cost: 200),
        Stage(areaNumber: 3, stageNumber: 4, stageType: .Normal, cost: 450),
        Stage(areaNumber: 3, stageNumber: 4, stageType: .Pursuit, cost: 200),
    ]

    static func areaCount() -> Int {
        return 3
    }
    
    static func stages() -> [Stage] {
        return self._stages
    }
    
    static func stages(areaNumber: Int) -> [Stage] {
        return self.stages().filter { (s) in s.areaNumber == areaNumber }
    }

    static func stages(stageType: Stage.StageType) -> [Stage] {
        return self.stages().filter { (s) in s.stageType == stageType }
    }
    
    static func stages(areaNumber: Int, stageType: Stage.StageType) -> [Stage] {
        return self.stages().filter { (s) in s.areaNumber == areaNumber && s.stageType == stageType }
    }
}
