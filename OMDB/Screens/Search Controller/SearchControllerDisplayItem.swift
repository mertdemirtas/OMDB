//
//  SearchControllerDisplayItem.swift
//  OMDB
//
//  Created by Mert Demirtaş on 26.09.2022.
//

import Foundation

enum SearchControllerDisplayItem {
    case searchedKeywords(data: SearchedKeywordsTableViewCellData)
    case result(data: OMDBItemCellData)
    case empty(data: OMDBEmptyCellData)
}
