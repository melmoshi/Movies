//
//  SuggestionVC.swift
//  MovieApp
//
//  Created by Mel and Sand on 2017-07-15.
//  Copyright © 2017 Moshi Media. All rights reserved.
//

import UIKit
import GameKit

class SuggestionVC: UIViewController {
    
    @IBOutlet weak var movieLbl: UILabel!
    @IBOutlet weak var seeRecipeBtn: UIButton!
    @IBOutlet weak var greetingLbl: UILabel!
    @IBOutlet weak var greetingSubtitleLbl: UILabel!
    @IBOutlet weak var tryAgainBtn: RoundButton!
    @IBOutlet weak var backBtn: RoundButton!
    @IBOutlet weak var tag1: UILabel!
    @IBOutlet weak var tag2: UILabel!
    @IBOutlet weak var emoji1: UILabel!
    @IBOutlet weak var emoji2: UILabel!
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    
    var number = randomNum()
    
    var numberTryAgainPressed = 1
    //counts the number of times "Try Again" btn has been pressed
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        movieLbl.text = uniqueMovieArray[number].name
        showTags()
        
        
       
        
        
    }

  
    
    //------------------------------------------------//
    

    @IBAction func seeReviewPressed(_ sender: Any) {
        
        if let url = NSURL(string: "\(uniqueMovieArray[number].link)") {
            UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        }
        
    }
    
    
    @IBAction func tryAgainPressed(_ sender: Any) {
        
        numberTryAgainPressed += 1
        tag1.isHidden = false
        tag2.isHidden = false
        image1.isHidden = false
        image2.isHidden = false
        
        
        uniqueMovieArray.remove(at: number)
        //removes current Entree from array
        
        number = randomNum()
        //assigns new random number
        
        if uniqueMovieArray.count > 0 { //If there are still Entrees in the array
            
            movieLbl.text = uniqueMovieArray[number].name
            showTags()
            
//            if numberTryAgainPressed >= 3 {
//                
//                if interstitialAd != nil {
//                    if interstitialAd!.isReady {
//                        
//                        interstitialAd?.present(fromRootViewController: self)
//                    }
//                }
//                
//            }
            
        } else {
            
            movieLbl.text = "That's All. \n Try Adding More Genres."
            greetingLbl.text = "Sorry!"
            hideExtras()
            number = 0
            uniqueMovieArray.append(Movie(name: "safety", link: "safety", type: "safety", subType: "safety"))
            //this Entree item is added to the array only so that there is something to be removed if the user presses "Hmm.. Try Again" button again.
            
        }

    }
    
    @IBAction func bankToGenrePressed(_ sender: Any) {
        
        uniqueMovieArray = []
    }
    
    
    func showTags() {
        
        tag1.text = uniqueMovieArray[number].type
        
        if uniqueMovieArray[number].subType != "-" {
            tag2.text = uniqueMovieArray[number].subType
        } else {
            tag2.isHidden = true
        }
        switch uniqueMovieArray[number].type {
            case "Comedy": image1.image = UIImage(named: "Comedy")
            case "Adventure": image1.image = UIImage(named: "Adventure")
            case "Action": image1.image = UIImage(named: "Action")
            case "Romance": image1.image = UIImage(named: "Romance")
            case "Animated": image1.image = UIImage(named: "Animated")
            case "Thriller": image1.image = UIImage(named: "Thriller")
            case "Horror": image1.image = UIImage(named: "Horror")
            case "Drama": image1.image = UIImage(named: "Drama")
            default : image1.isHidden = true
        }
        
        switch uniqueMovieArray[number].subType {
        case "Comedy": image2.image = UIImage(named: "Comedy")
        case "Adventure": image2.image = UIImage(named: "Adventure")
        case "Action": image2.image = UIImage(named: "Action")
        case "Romance": image2.image = UIImage(named: "Romance")
        case "Animated": image2.image = UIImage(named: "Animated")
        case "Thriller": image2.image = UIImage(named: "Thriller")
        case "Horror": image2.image = UIImage(named: "Horror")
        case "Drama": image2.image = UIImage(named: "Drama")
        case "Music": image2.image = UIImage(named: "Music")
        case "Sports": image2.image = UIImage(named: "Sports")
        case "Biopic": image2.image = UIImage(named: "Biopic")
        case "Mafia": image2.image = UIImage(named: "Mafia")
        case "Sci-Fi": image2.image = UIImage(named: "Sci-fi")
        case "Documentary": image2.image = UIImage(named: "Documentary")
        default : image2.isHidden = true
        }
        
    }
    
    func hideExtras() {
        greetingSubtitleLbl.isHidden = true
        tag1.isHidden = true
        tag2.isHidden = true
        image1.isHidden = true
        image2.isHidden = true
    }
    
    

}

func randomNum() -> Int {
    let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: uniqueMovieArray.count)
    
    return randomNumber
    
    //Creates a random number to call from entree array
}


