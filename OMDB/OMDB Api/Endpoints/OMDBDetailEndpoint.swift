//
//  OMDBDetailEndpoint.swift
//  OMDB
//
//  Created by Mert Demirtaş on 27.09.2022.
//

import Foundation
import NetworkLayerPackage

class OMDBDetailEndpoint: Endpoint {
    var networkConstants: NetworkConstants = OMDBNetworkConstants()
    var httpMethod: HTTPMethods = .get
    var path: String?
    var headers: [String : String]?
    var body: [String : Any]?
    
    var imdbID: String
    
    init(imdbID: String) {
        self.imdbID = imdbID
        initPath()
    }
    
    private func initPath() {
        guard let apikey = networkConstants.apiKey else { return }
        path = "?apikey=\(apikey)" + "&i=\(imdbID)"
    }
}
