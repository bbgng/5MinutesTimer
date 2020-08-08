//
//  MyTime.swift
//  5minutesTimer
//
//  Created by Tech-Marketer on 2020/08/02.
//  Copyright © 2020 Tech-Marketer. All rights reserved.
//

import Foundation

class MyTime {
    
    static let secOfFiveMinutes = 300
    
    static func toString(i: Int) -> String {
        
        let mm = i / 60
        let ss = i % 60
        
        return String(format: "%02d:%02d", mm, ss)
        
    }
    
    static func getRemainingTime(i: Int) -> String {
        
        
        let remainingSec = secOfFiveMinutes - i
        
        return String(format: "%02d:%02d", remainingSec/60, remainingSec%60)
        
    }
    
    static func isAlreadyPassed(i: Int) -> Bool {
        
        var ret = false
        
        if(i == secOfFiveMinutes) {
            ret = true
        }
        
        return ret
        
    }
}
