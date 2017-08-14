//
//  ViewController.swift
//  MovieApp
//
//  Created by Mel and Sand on 2017-07-15.
//  Copyright © 2017 Moshi Media. All rights reserved.
//
// ADMOB: ca-app-pub-8878911622308650/8906038765

import UIKit
import GoogleMobileAds

class HomeVC: UIViewController, GADBannerViewDelegate {
    
    @IBOutlet weak var bannerAd: GADBannerView!

    override func viewDidLoad() {
        
        //BANNER AD:
        // Request
        let requestBanner = GADRequest()
        requestBanner.testDevices = [kGADSimulatorID]
        //^COMMENT OUT FOR PUBLISHING (?)
        
        //Set Up Ad
        bannerAd.adUnitID = "ca-app-pub-8878911622308650/8906038765"
        
        //Making view controller responsible for ad unit
        bannerAd.rootViewController = self
        bannerAd.delegate = self
        
        bannerAd.load(requestBanner)
        //

      
    }



}

