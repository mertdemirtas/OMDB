//
//  OMDBDetailModel.swift
//  OMDB
//
//  Created by Mert Demirtaş on 27.09.2022.
//

import Foundation

// MARK: - OMDBDetailModel
struct OMDBDetailModel: Codable {
    let title: String?
    let released: String?
    let runtime: String?
    let genre: String?
    let plot: String?
    let poster: String?
    let imdbRating: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case plot = "Plot"
        case poster = "Poster"
        case imdbRating = "imdbRating"
    }
}

