//
//  ApiData.swift
//  PigDailySupplyAuction
//
//  Created by WY NG on 18/4/2018.
//  Copyright © 2018 lumanman. All rights reserved.
//

import UIKit

private var serverURL:String = "http://www.fehd.gov.hk/tc_chi/sh/data/daily_supply_auction.xml"

class ApiData: NSObject, XMLParserDelegate {
    
    static var shared: ApiData = ApiData()
    
    private var auctionData: AuctionData? = nil
    
    private var auctionDatas = [AuctionData]()
    
    private var elementName: String = "" // 當前element名
    
    
    class func getData(_ completion: @escaping (_ data: [AuctionData]?, _ error: Error?)-> Void) {
        
        let url = URL(string: serverURL)
        guard url != nil else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            print("connection ok")
            
            guard error == nil && data != nil else {
                return
            }
            
            let xmlParser = XMLParser(data: data!) // the data is the data we get when we call the API
            xmlParser.delegate = self.shared
            xmlParser.parse()  // will return a bool value to confirm if the doc is sucessfully parsed(編譯)

            completion(self.shared.auctionDatas, error)
            print(self.shared.auctionDatas)
            
        }
        
        // to connect the url
        task.resume()
    }
    
    // MARK: XMLParserDelegate
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        // parse 到element開始的tag
        self.elementName = elementName
        
        if elementName == "DEPARTMENT" {
            auctionData = AuctionData()
        }
        
        // print(elementName)
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        // parse 到element的內容, 將該element的內容加到相應的 property 中
        guard (string.trimmingCharacters(in: [" ", "\n"])).count > 0 else {
            return
        }
        
        
        if elementName == "REPORT_DATE" {
            // print(string)
            auctionData?.date = string
        }else if elementName == "MAINLAND_ADMISSION" {
            // print(string)
            auctionData?.numberOfMainlandPig = string
            
        }else if elementName == "LOCAL_ADMISSION" {
            // print(string)
            auctionData?.numberOfLocalPig = string
            
        }else if elementName == "TOTAL_ADMISSION" {
            // print(string)
            auctionData?.numberOfTotal = string
            
        }else if elementName == "HIGHEST_AUCTION_PRICE" {
            // print(string)
            auctionData?.auctionPrice_highest = string
            
        }else if elementName == "LOWEST_AUCTION_PRICE" {
            // print(string)
            auctionData?.auctionPrice_lowest = string
            
        }else if elementName == "AVERAGE_AUCTION_PRICE" {
            // print(string)
            auctionData?.auctionPrice_average = string
            
        }else if elementName == "MAINLAND_FORECAST" {
            // print(string)
            auctionData?.forecastOfMainlandPig = string
            
        }else if elementName == "LOCAL_FORECAST" {
            // print(string)
            auctionData?.forecastOfLocalPig = string
            
        }else if elementName == "TOTAL_FORECAST"{
            //print(string)
            auctionData?.forecastTotal = string
        }
        
        
        
    }
    
    // parse 最後一個tag
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        // print(elementName)
        
        if elementName == "TOTAL_FORECAST" {
            auctionDatas.append(auctionData!)
            print(auctionDatas)
        }
    }
    
}
