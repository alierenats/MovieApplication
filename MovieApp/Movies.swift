//
//  Movies.swift
//  MovieApp
//
//  Created by Eren Ates on 26.07.2023.
//

import Foundation

class Movies {
    
    var movieID:Int?
    var movieName:String?
    var movieImageName:String?
    var moviePrice:Double?
    
    init()
    {
        
    }
    init(movieID:Int,movieName:String,movieImageName:String,moviePrice:Double) {
        self.movieID = movieID
        self.movieName = movieName
        self.movieImageName = movieImageName
        self.moviePrice = moviePrice
    }
}
