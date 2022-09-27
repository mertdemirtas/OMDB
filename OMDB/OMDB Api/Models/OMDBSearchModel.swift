//
//  OMDBSearchModel.swift
//  OMDB
//
//  Created by Mert Demirtaş on 26.09.2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct OMDBSearchModel: Codable {
    let searchData: [SearchData]?
    let response: String
    let error, totalResults: String?
    
    enum CodingKeys: String, CodingKey {
        case searchData = "Search"
        case totalResults
        case response = "Response"
        case error = "Error"
    }
}

// MARK: - Search
struct SearchData: Codable {
    let title, year, imdbID: String
    let type: String
    let poster: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}


