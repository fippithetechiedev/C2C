//
//  Section.swift
//  c2cfinal
//
//  Created by Mufaddal Ibrahimjee on 22/02/18.
//  Copyright © 2018 mufaddal. All rights reserved.
//

import Foundation

struct Section1
{
    var genre: String!
    var movies: [String]!
    var name: [String]!
    var work: [String]!
    var expanded: Bool!

    
    init (genre:String ,movies: [String] ,name: [String], work: [String], expanded: Bool)
    {
        self.genre = genre
        self.movies = movies
        self.name = name
        self.work = work
        self.expanded = expanded
        
    }
}
