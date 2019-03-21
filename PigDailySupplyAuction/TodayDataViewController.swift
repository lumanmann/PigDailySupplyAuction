//
//  TodayDataViewController.swift
//  PigDailySupplyAuction
//
//  Created by WY NG on 18/4/2018.
//  Copyright © 2018 lumanman. All rights reserved.
//

import UIKit

class TodayDataViewController: UIViewController, UICollectionViewDelegate {
    
    var auctionDatas = [AuctionData]()
    var todayData: AuctionData = AuctionData()
    
    
    @IBOutlet weak var dateShowing: UILabel!
    @IBOutlet weak var numberOfMainlandPigLB: UILabel!
    @IBOutlet weak var numberOfLocalPigLB: UILabel!
    @IBOutlet weak var numberOfTotalLB: UILabel!
    @IBOutlet weak var auctionPrice_highestLB: UILabel!
    @IBOutlet weak var auctionPrice_lowestLB: UILabel!
    @IBOutlet weak var auctionPrice_averageLB: UILabel!
    @IBOutlet weak var forecastOfMainlandPigLB: UILabel!
    @IBOutlet weak var forecastOfLocalPigLB: UILabel!
    @IBOutlet weak var forecastTotalLB: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ApiData.getData { (result, error) in
            //下載完畢
            if result != nil && error == nil {
                self.auctionDatas = result!
                //下載完畢顯示UI
                DispatchQueue.main.async {
                    
                    guard let todayData = self.auctionDatas.first else {
                        return }
                    
                    
                    self.dateShowing.text = todayData.date
                    
                    self.numberOfMainlandPigLB.text = todayData.numberOfMainlandPig
                    self.numberOfLocalPigLB.text = todayData.numberOfLocalPig
                    self.numberOfTotalLB.text = todayData.numberOfTotal
                    
                    self.auctionPrice_highestLB.text = todayData.auctionPrice_highest
                    self.auctionPrice_lowestLB.text = todayData.auctionPrice_lowest
                    self.auctionPrice_averageLB.text = todayData.auctionPrice_average
                    
                    self.forecastOfMainlandPigLB.text = todayData.forecastOfMainlandPig
                    self.forecastOfLocalPigLB.text = todayData.forecastOfLocalPig
                    self.forecastTotalLB.text = todayData.forecastTotal
                    
                }
            }
        }
        
    }

        
 
}



