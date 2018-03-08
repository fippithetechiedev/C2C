//
//  Section.swift
//  c2cfinal
//
//  Created by Mufaddal Ibrahimjee on 22/02/18.
//  Copyright © 2018 mufaddal. All rights reserved.
//

import Foundation

struct Section
{
    var genre: String!
    var movies: [String]!
    var expanded: Bool!
    
    init (genre:String ,movies: [String] ,expanded: Bool)
    {
        self.genre = genre
        self.movies = movies
        self.expanded = expanded
    }
}
