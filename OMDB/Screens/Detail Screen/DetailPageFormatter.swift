//
//  DetailPageFormatter.swift
//  OMDB
//
//  Created by Mert Demirtaş on 27.09.2022.
//

import Foundation

struct DetailPageFormatter {
    static func formatDataToItemDetailData(result: OMDBDetailModel) -> OMDBItemDetailData? {
        let formattedData = OMDBItemDetailData(posterURLString: result.poster, generalInfo: ItemGeneralInfoCardViewData(title: result.title, runtime: result.runtime, imdbRating: result.imdbRating, releaseDate: result.released, genre: result.genre, plot: result.plot))
        return formattedData
    }
}
