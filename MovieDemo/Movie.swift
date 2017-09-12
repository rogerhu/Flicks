//
//  Movie.swift
//  MovieDemo
//
//  Created by hsherchan on 9/12/17.
//  Copyright © 2017 Hearsay. All rights reserved.
//

import Foundation

class Movie {
    var voteCount: Int?
    var id: Int?
    var hasVideo: Bool?
    var voteAverage: Double?
    var title: String?
    var popularity: Double?
    var posterPath: String?
    var origLang: String?
    var origTitle: String?
    var genreIds: [Double]?
    var backdropPath: String?
    var hasMatureContent: Bool?
    var overview: String?
    var releaseDate: String?

    
    init(fromDict:NSDictionary) {
        self.voteCount = fromDict["vote_count"] as? Int
        self.id = fromDict["id"] as? Int
        self.hasVideo = fromDict["video"] as? Bool
        self.title = fromDict["title"] as? String
        self.popularity = fromDict["popularity"] as? Double
        self.posterPath = fromDict["poster_paths"] as? String ?? ""
        self.origLang = fromDict["original_language"] as? String
        self.origTitle = fromDict["original_title"] as? String
        self.genreIds = fromDict["genre_ids"] as? [Double]
        self.backdropPath = fromDict["backdrop_path"] as? String
        self.hasMatureContent = fromDict["adult"] as? Bool
        self.overview = fromDict["overview"] as? String
        self.releaseDate = fromDict["release_date"] as? String
        self.voteAverage = fromDict["vote_average"] as? Double
    }
}
