//
//  Entree.swift
//  DinnerApp
//
//  Created by Mel and Sand on 2017-06-09.
//  Copyright © 2017 Moshi Media. All rights reserved.
//

import Foundation

class Movie: Hashable {
    /// Returns a Boolean value indicating whether two values are equal.
    ///
    /// Equality is the inverse of inequality. For any values `a` and `b`,
    /// `a == b` implies that `a != b` is `false`.
    ///
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    static func ==(lhs: Movie, rhs: Movie) -> Bool {
        return lhs.name == rhs.name
    }
            // ^ making Movie adhere to the Hashable protocal.. in order to later remove duplicates ^

    
    fileprivate var _name: String!
    fileprivate var _link: String!
    fileprivate var _type: String!
    fileprivate var _subType: String!
    
    var name: String {
        return _name
    }
    
    var link: String {
        return _link
    }
    
    var type: String {
        return _type
    }
    
    var subType: String {
        return _subType
    }
    
    var hashValue: Int {
        return _name.hashValue
    }
    
    init(name: String, link: String, type: String, subType: String) {
        self._name = name
        self._link = link
        self._type = type
        self._subType = subType
    }
    
}

var movieArray = [Movie]()
var uniqueMovieArray = [Movie]()



























