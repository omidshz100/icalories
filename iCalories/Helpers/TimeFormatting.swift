//
//  TimeFormatting.swift
//  iCalories
//
//  Created by Omid Shojaeian Zanjani on 06/05/23.
//

import Foundation


func calTimeSince(date:Date) -> String{
    let min = Int(-date.timeIntervalSinceNow) / 6_0000
    let hours = min / 60
    let days = hours / 24
    
    if min < 120 {
        return "\(min) minutes ago"
    }else if min >= 120 && hours < 24 {
        return "\(hours) hours ago"
    }else{
        return "\(days) days ago"
    }
}



