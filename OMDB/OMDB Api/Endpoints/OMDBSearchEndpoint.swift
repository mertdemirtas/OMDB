//
//  OMDBSearchEndpoint.swift
//  OMDB
//
//  Created by Mert Demirtaş on 24.09.2022.
//

import Foundation
import NetworkLayerPackage

class OMDBSearchEndpoint: Endpoint {
    var networkConstants: NetworkConstants = OMDBNetworkConstants()
    var httpMethod: HTTPMethods = .get
    var path: String?
    var headers: [String : String]?
    var body: [String : Any]?
    
    var title: String
    var pageNumber: Int
    
    init(title: String, pageNumber: Int) {
        self.title = title
        self.pageNumber = pageNumber
        initPath()
    }
    
    private func initPath() {
        guard let apikey = networkConstants.apiKey else { return }
        path = "?apikey=\(apikey)" + "&page=\(pageNumber)" + "&s=\(title)"
    }
}
