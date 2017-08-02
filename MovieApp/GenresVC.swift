//
//  GenresVC.swift
//  MovieApp
//
//  Created by Mel and Sand on 2017-07-15.
//  Copyright © 2017 Moshi Media. All rights reserved.
//

import UIKit

class GenresVC: UIViewController {
    
    
    @IBOutlet weak var actionBtn: IngredientsButton!
    @IBOutlet weak var romanticBtn: IngredientsButton!
    @IBOutlet weak var thrillerBtn: IngredientsButton!
    @IBOutlet weak var adventureBtn: IngredientsButton!
    @IBOutlet weak var dramaBtn: IngredientsButton!
    @IBOutlet weak var comedyBtn: IngredientsButton!
    @IBOutlet weak var horrorBtn: IngredientsButton!
    @IBOutlet weak var animatedBtn: IngredientsButton!
    
    @IBOutlet weak var continueBtn: UIButton!
    
    @IBOutlet weak var resetBtn: ResetButton!
    
    
    var actionBtnSelected = false
    var romanticBtnSelected = false
    var thrillerBtnSelected = false
    var horrorBtnSelected = false
    var dramaBtnSelected = false
    var comedyBtnSelected = false
    var animatedBtnSelected = false
    var adventureBtnSelected = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func romanticBtnPressed(_ sender: Any) {
        
        genreBtnPressed(romanticBtnSelected, genreBtn: romanticBtn, genre: "Romance")
        romanticBtnSelected = true
    }
    
    
    @IBAction func actionBtnPressed(_ sender: Any) {
        
        genreBtnPressed(actionBtnSelected, genreBtn: actionBtn, genre: "Action")
        actionBtnSelected = true
    }
    
    
    @IBAction func thrillerBtnPressed(_ sender: Any) {
        
        genreBtnPressed(thrillerBtnSelected, genreBtn: thrillerBtn, genre: "Thriller")
        thrillerBtnSelected = true
    }
    
    
    @IBAction func dramaBtnPressed(_ sender: Any) {
        genreBtnPressed(dramaBtnSelected, genreBtn: dramaBtn, genre: "Drama")
        dramaBtnSelected = true
    }
    
    
    @IBAction func comedyBtnPressed(_ sender: Any) {
        genreBtnPressed(comedyBtnSelected, genreBtn: comedyBtn, genre: "Comedy")
        comedyBtnSelected = true
    }
    
    
    @IBAction func horrorBtnPressed(_ sender: Any) {
        
        genreBtnPressed(horrorBtnSelected, genreBtn: horrorBtn, genre: "Horror")
        horrorBtnSelected = true
    }
    
    
    @IBAction func animatedBtnPressed(_ sender: Any) {
        genreBtnPressed(animatedBtnSelected, genreBtn: animatedBtn, genre: "Animated")
        animatedBtnSelected = true

    }
    
    @IBAction func adventureBtnPressed(_ sender: Any) {
        
        genreBtnPressed(adventureBtnSelected, genreBtn: adventureBtn, genre: "Adventure")
        adventureBtnSelected = true
    }
    
    
    @IBAction func resetBtnPressed(_ sender: Any) {
        
        movieArray = []

        
        colorReset(button: romanticBtn)
        colorReset(button: actionBtn)
        colorReset(button: thrillerBtn)
        colorReset(button: dramaBtn)
        colorReset(button: comedyBtn)
        colorReset(button: horrorBtn)
        colorReset(button: animatedBtn)
        colorReset(button: adventureBtn)
        
        actionBtnSelected = false
        romanticBtnSelected = false
        thrillerBtnSelected = false
        horrorBtnSelected = false
        dramaBtnSelected = false
        comedyBtnSelected = false
        animatedBtnSelected = false
        adventureBtnSelected = false
        
        continueBtn.isHidden = true
    }
    

 
    func genreBtnPressed(_ genreBtnStatus: Bool, genreBtn: IngredientsButton, genre: String) {
        resetBtn.isHidden = false
        continueBtn.isHidden = false
        
        if genreBtnStatus == false {
            genreBtn.backgroundColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 0.8)
            genreBtn.tintColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
            genreBtn.layer.borderColor = UIColor(red: 150/255, green: 150/255, blue: 150/255, alpha: 0.8).cgColor
            
            addMovie(movieGenre: genre)
            
        } else {
            
        }
    }
    
    func addMovie(movieGenre: String) {
        
        let path = Bundle.main.path(forResource: "movies", ofType: "csv")!
        
        do {
            
            let csv = try CSV(contentsOfURL: path)
            let rows = csv.rows
            
            for row in rows {
                let name = row["Name"]!
                let type = row["Type"]!
                let link = row["Link"]!
                let subType = row["subType"]!
                
                if type == movieGenre {
                    let movieInfo = Movie(name: name, link: link, type: type, subType: subType)
                    movieArray.append(movieInfo)
                    
                    
                } else if subType == movieGenre {
                    let movieInfo = Movie(name: name, link: link, type: type, subType: subType)
                    movieArray.append(movieInfo)
                }
                
            }
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
    }
    
    func colorReset (button: IngredientsButton) {
        
        button.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)
        
        button.tintColor = UIColor.white
        
    }
    
    @IBAction func continueBtnPressed(_ sender: Any) {
        
        uniqueMovieArray = Array(Set<Movie>(movieArray))
    }
    

    


}


