//
//  OMDBNetworkConstants.swift
//  OMDB
//
//  Created by Mert Demirtaş on 24.09.2022.
//

import Foundation
import NetworkLayerPackage

struct OMDBNetworkConstants: NetworkConstants {
    var apiKey: String? = "3c526d96"
    var baseUrl: String = "https://www.omdbapi.com/"
}
