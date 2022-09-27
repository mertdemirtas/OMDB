//
//  SearchControllerFormatter.swift
//  OMDB
//
//  Created by Mert Demirtaş on 26.09.2022.
//

import Foundation

struct SearchControllerFormatter {
    static func formatDataToOMDBItemCellData(data: OMDBSearchModel?) -> [OMDBItemCellData]? {
        guard let itemData = data?.searchData else { return nil }
        var cellDataArray: [OMDBItemCellData] = []
        
        for element in itemData {
            cellDataArray.append(OMDBItemCellData(posterURLString: element.poster, title: element.title, year: element.year, type: element.type, imdbID: element.imdbID))
        }
        
        return cellDataArray
    }
}
