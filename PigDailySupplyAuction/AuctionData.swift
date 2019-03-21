//
//  AuctionData.swift
//  PigDailySupplyAuction
//
//  Created by WY NG on 18/4/2018.
//  Copyright © 2018 lumanman. All rights reserved.
//

import Foundation


class AuctionData: NSObject {
    
    var date : String = ""  // 報告日期
    
    var numberOfMainlandPig: String = "" // 今日內地進口活豬供應數
    var numberOfLocalPig: String = "" // 今日本地活豬供應數
    var numberOfTotal: String = ""  // 今日活豬供應總數
    
    var auctionPrice_highest: String = "" // 今日活豬拍賣價(每擔)-最高
    var auctionPrice_lowest: String = "" // 今日活豬拍賣價(每擔) -最低
    var auctionPrice_average: String = "" // 今日活豬拍賣價(每擔) -平均
    
    var forecastOfMainlandPig: String = "" // 明日活豬預計供應 - 內地進口
    var forecastOfLocalPig: String = "" // 明日活豬預計供應 - 本地
    var forecastTotal: String = "" //明日活豬預計供應總數 - 內地進口與本地
    
}


